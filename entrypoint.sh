#!/bin/bash

set -e

DELETE=${DELETE:-"false"}
BRANCH=${BRANCH:-"master"}
echo "DELETE: ${DELETE}"

# input validation
if [[ -z "${TAG}" ]]; then
   echo "No tag name supplied"
   exit 1
fi

if [[ -z "${BRANCH}" ]]; then
   echo "No branch supplied"
   exit 1
fi

if [[ -z "${GITHUB_TOKEN}" ]]; then
   echo "No github token supplied"
   exit 1
fi

git config --global --add safe.directory $(realpath .)

git config user.email "contact@ekee.io"
git config user.name "ekee"
git config user.password ${GITHUB_TOKEN}

# Delete the tag on any remote before pushing
git push origin ":refs/tags/${TAG}" || true
git tag -d ${TAG} || true

if [ "$DELETE" == "true" ]; then
    # Stopping here
    echo DELETE "ON": not pushing a new tag
    exit 0
fi

# Make sure we are on the latest commit
git checkout origin/${BRANCH}

# Replace the tag to reference the most recent commit
git tag -a "${TAG}" -m "staging release for branch ${BRANCH}"

# Push the tag to the remote origin
git push --tags
