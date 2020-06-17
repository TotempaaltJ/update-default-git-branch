# Change Github repository default branches from CLI

> **⚠ These scripts perform DESCTRUCTIVE actions on your Github repositories.** I _strongly_ recommend against using this if you don't understand what the code does.

Will create a new branch on Github and change the default branch to it, and then delete the old one. You'll need the [Github CLI][cli] for this.

[cli]: https://cli.github.com

How to use:

```bash
$ ./rename-github-default-branch.sh <USER> <REPO> <from-branch-name> <to-branch-name>
$ ./rename-for-all-repos.sh <USER> <from-branch-name> <to-branch-name>
```
