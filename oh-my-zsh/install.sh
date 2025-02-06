#!/usr/bin/env sh

set -e

# Install plugins dependencies
sudo apt update
sudo apt install zsh fzf fonts-powerline bat

# Install oh-my-zsh
read -p "Install oh-my-zsh? [y/n]" input
if [ "$input" = "y" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install oh-my-zsh custom directory (for plugins)
read -p "Install oh-my-zsh 'custom' directory (for plugins)? [y/n]: " input
if [ "$input" = "y" ]; then
    default_custom_zsh_dir="$HOME/.oh-my-zsh/custom"
    custom_zsh_dir="$(realpath "$(dirname "$0")")/custom"
    if [ -d "$default_custom_zsh_dir" ]; then
        read -p "The 'custom' dir exists! Do you still want to proceed? [y/n]: " input
        if [ "$input" != "y" ]; then
            exit
        fi
        rm -r "$default_custom_zsh_dir"
    fi
    ln -sf "$custom_zsh_dir" "$HOME/.oh-my-zsh"
fi

# Install .zshrc
read -p "Install .zshrc? [y/n] " input
if [ "$input" = "y" ]; then
    home_zshrc="$HOME/.zshrc"
    script_dir_zshrc="$(realpath "$(dirname "$0")")/.zshrc"
    if [ -f "$home_zshrc" ]; then
        echo "The $home_zshrc exists! Running diff to see differences...\n\n"
        diff "$home_zshrc" "$script_dir_zshrc" || echo "\n\nHmmmm...\n"

        read -p "Did you notice any major differences? [y/n]: " input
        if [ "$input" != "n" ]; then
            exit
        fi
    fi
    ln -sf "$script_dir_zshrc" "$home_zshrc"
fi
