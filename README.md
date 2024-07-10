# Git Restash

Use git stash and save all changes to a stash file for moving to anoteher branch

## Usage

When you need to transfer your last  commit and forgot that you're on main (whoops! that's okay - it happens!) you'd normally do [this](https://stackoverflow.com/a/63693588): 

1. Hard Reset recent commit from the index to working tree (`git reset --hard HEAD~X`, where X is the number of commits back)
2. `git checkout -b main-infected`
3.  `git checkout main`
4.  `git pull`
5. `git cherry-pick (commits from main-old)` or do copy pasting (tbh, used to do this!)


There's actually a simpler way:
 
1. Simply reset *softly* your changes which will keep your recent changes in the current working directory, then stash the changes. 
2. Checkout a new branch
3. Run `stash pop` or `stash apply`.

Here is source code of the script:

### Step 1: Check response of the user:

```bash
# This is the main script of restash.sh
# here we check if the reply is = Y or y
if [[ $REPLY =~ ^[Yy]$ ]] 
```

### Step 2: Reset to previous commit

```bash
# This is the THEN statement of the reply above
# then
   echo  "Will now reset to the previous commit (~= HEAD~1) and stash the changes (into working dir)"  # (optional) move to a new line
   # 1. we reset to the previous commit ~= HEAD~1, which means your one last log commit
   git reset --quiet $PREV_COMMIT
```

### Step 3:run git stash

Stashes everything

```bash

   T_NOW=$(date +"%H:%M")

   git stash --include-untracked --quiet save "stashed back HEAD~$DEFAULT_PREV_NUM changes at $T_NOW \n\n\n" # TODO: Add include-untracked or -u to include unstashed files
   # uncomment  below to start with a clean slate again (skips cleaning .env files for laravel or other frameworks)
   # git clean -e *.env* -df
else 
  echo "Aborting..."   
fi
```

### Step 4: Make a new branch and pop the stash

There's a new command called [git-switch](https://git-scm.com/docs/git-switch). Then apply the changes you've stashed using `git-stash`. 
```bash
# This is not scripted, we dont know what branch you want to branch out to:
git checkout -b my-new-feature-branch 
# Or you might want to try the git-switch: git switch -c my-new-feature-branch

git stash pop
```



![Screen Shot](./screenshot.png)

### useful git commands

#### Viewing git status: 

```bash
git status && git log -n 1
```

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

#### Git sync

```bash
git stash && git checkout master && git fetch --all && git pull --rebase`
```

then, to get back your stashed code:

```bash 
git stash apply
```

TODO 
 - [] Allow user to either stash the working directory or just create a patch
 - [x] Allow user to view first with git log (added how to note)

