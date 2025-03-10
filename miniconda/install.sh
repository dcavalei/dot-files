#!/bin/bash

set -ex

mkdir -p ~/.miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/.miniconda3/miniconda.sh
bash ~/.miniconda3/miniconda.sh -b -u -p ~/.miniconda3
rm -rf ~/.miniconda3/miniconda.sh

# For zsh users
~/.miniconda3/bin/conda init zsh

# Stop conda automatic activation of base env
conda config --set auto_activate_base false
