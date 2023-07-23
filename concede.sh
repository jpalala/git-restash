#!/bin/bash
## Basic gist is 1. Get the previous commit through git rev-parse , reset it (--mixed by default), stash your working dir, (optionally) clean it, git s
PREV_NUM_COMMITS_BACK=1
# (optional) first lookup your previous commits and find the commit
# git log | tail -n 10
 
read -p "Are you sure to revert and stash to past -$PREV_NUM_COMMITS_BACK commit back?" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
   echo  "We are now going to stash"  # (optional) move to a new line
   PREV_COMMIT=$(git rev-parse HEAD~$DEFAULT_PREV_NUM)
   git reset $PREV_COMMIT
   # uncomment if you want a clean slate (but keep env files from deletion)
   #git clean -e *.env* -fd 
   T_NOW=date +"%H:%M"
   git stash save "stashed back HEAD minus $DEFAULT_PREV_NUM changes at $T_NOW"
else 
  echo "Aborting..."   
fi
# TODO ask user what to do next..
echo "You may now switch branch and apply your stash{0} and commit them manually"

