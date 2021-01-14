# git-tag-action

GitHub action that adds a lightweight git tag to the current workflow commit.

**Note:** If a tag with the same name already exists, it is replaced.

## Environment Variables

| Name             | Description                             | Mandatory | Default value |
| ---------------- | --------------------------------------- | --------- | ------------- |
| **TAG**          | TAG to create                           | **true**  |               |
| **GITHUB_TOKEN** | Github token used to push the token     | **true**  |               |
| **BRANCH**       | BRANCH on which the tag will be created | **false** | "master"      |
| **DELETE**       | If "true", delete tag and do not repush | **false** | "false"       |

## Example usage

```yaml
- name: "Tag staging"
uses: eKee-io/git-tag-action@master
env:
    TAG: staging
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    BRANCH: ${{ steps.extract_branch.outputs.branch }}
```
