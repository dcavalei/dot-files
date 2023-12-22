#!/bin/env sh

read -p "git user.name?  " name
git config --global user.name "$name"

read -p "git user.email? " email
git config --global user.email "$email"

git config --global core.excludesfile $(realpath "$(dirname "$0")")/global_gitignore
