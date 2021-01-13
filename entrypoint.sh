#!/bin/bash

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

# Delete the tag on any remote before pushing
git push origin ":refs/tags/${TAG}"

# Replace the tag to reference the most recent commit
git tag -fa "${TAG}"

# Push the tag to the remote origin
git push -f origin "${BRANCH}" --tags
