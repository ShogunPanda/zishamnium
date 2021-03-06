#!/bin/zsh
#
# This file is part of zishamnium. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at https://choosealicense.com/licenses/mit.
#

zishamnium_install_git_aliases(){
  if [ "$(which git)" != "" ]; then
    git config --global alias.fbn '! git symbolic-ref HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null'
    git config --global alias.bn '! git fbn | sed "s#refs/heads/##"'
    git config --global alias.task '! git bn | sed -E "s/(.+)-([0-9]+)$/\2/g"'
  fi
}

git_branch(){
  local branch=$(git bn 2>/dev/null)
  [ ! -z "${branch}" ] && echo "${branch}"
}

git_commit(){
  local commit=$(git rev-parse --short HEAD 2>/dev/null)
  [ ! -z "${commit}" ] && echo "${commit}"
}

# This is to ensure bashmarks behavior
unalias g
compdef -d g

# Add aliases
alias gfbn='git fbn'
alias gbn='git bn'
alias gt='git task'
alias gtc='git task | tr -d "\n" | pbcopy'
