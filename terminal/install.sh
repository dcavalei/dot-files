#!/bin/bash

set -ex

# Install wezterm
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg

echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

sudo apt update
sudo apt install wezterm

# Install wezterm config
self_dir=$(realpath $(dirname $0))
self_config=$self_dir/.wezterm.lua
target=$HOME/.wezterm.lua

[ -f $target ] && echo "$target file exists!" && exit 1
ln -s $self_config $target

