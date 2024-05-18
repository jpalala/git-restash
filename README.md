# Git-concede

Concede to the power of git stash

## Usage

When you need to transfer your changes to another branch, this is what some people do:

1. Reset recent commit from the index to working tree
2. Stash changes (into working tree)
3. Checkout another branch and stash apply


![Screen Shot](./screenshot.png)

### Other useful git commands

#### Stash with untracked files:

```bash
git stash -u
```

#### Reset any local and staged changes

This is actually a git configuration, you only need to run once to set it globally and you can use it with `git wag`.

```bash
git config --global alias.wag "!git reset --hard && git clean -df"
```

Originally it was nah but I prefer `wag`. Wag means "Do not" in the Filipino language, and also refers to a meme *"Wag mong subukan masisira ang buhay mo"*.


TODO 
 - [] Allow user to either stash the working directory or just create a patch
 - [] Allow user to view first with git log
 - [] Maybe use python and/or node-git?
