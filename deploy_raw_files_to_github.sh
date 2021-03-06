#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"


# ssh-add ~/.ssh/id_rsa
git remote set-url origin git@github.com:chengjun/mywebsite-hugo.git
# git checkout
# git pull
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Force Push
#git push -f origin master
