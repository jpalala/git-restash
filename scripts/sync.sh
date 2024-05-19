#!/bin/bash

# Usage function
usage() {
    echo "Usage: git sync [branch]"
    exit 0
}

# Check if help flag is provided
if [[ $1 == "-h" || $1 == "--help" ]]; then
    usage
fi

# Set branch to first argument or default branch
branch=${1:-$(git rev-parse --abbrev-ref HEAD)}

# Execute commands
git checkout $branch
git pull --rebase # )remove --rebase if you prefer. I simply prefer a clean commit history basically:  https://www.randyfay.com/node/89 
git checkout $(git rev-parse --abbrev-ref HEAD)
