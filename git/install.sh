#!/bin/bash

set -e

read -p "git user.name?  " name
git config --global user.name "$name"

read -p "git user.email? " email
git config --global user.email "$email"

# Configure Git to use SSH to sign commits and tags
read -p "git user.signingkey? " signingkey
git config --global commit.gpgsign true
git config --global tag.gpgSign true
git config --global gpg.format ssh
git config --global user.signingkey "$signingkey"

git config --global core.excludesfile $(realpath "$(dirname "$0")")/global_gitignore
