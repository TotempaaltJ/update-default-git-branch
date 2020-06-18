# Change Github repository default branches from CLI

> **⚠ These scripts perform DESCTRUCTIVE actions on your Github repositories.**
> I _strongly_ recommend against using this if you don't understand what the
> code does.

Will create a new branch on Github and change the default branch to it, and
then delete the old one. You'll need JQ and the [Github CLI][cli] for this.

[cli]: https://cli.github.com

How to use:

```bash
$ chmod +x *.sh
$ ./rename-github-default-branch.sh <USER> <REPO> <from-branch-name> <to-branch-name>
$ ./rename-for-all-repos.sh <USER> <from-branch-name> <to-branch-name>
```

Then, in your local repo:

```bash
$ ./local-rename-to-remote.sh </path/to/repo> <from-branch-name>
```

That should work without any trouble.

## Help out!

I'm very open to PRs to support other platforms (like GitLab, Bitbucket, sr.ht,
etc…), as well as other ways to improve the source. Please keep it all Bash or
at least some other widely-supported scripting language. I'd like to keep it as
easy as possible to use!
