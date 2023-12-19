#!/usr/bin/env sh

home_zshrc="$HOME/.zshrc"
script_dir_zshrc="$(dirname "$0")/.zshrc"

if [ -f "$home_zshrc" ]; then
	echo "There $home_zshrc exists!\n\tRunning diff to see diferences..."
	diff "$home_zshrc" "$script_dir_zshrc"

	echo -n "Did you notice any major differences? (Y/n): "
	read input
	if [ "$input" = "n" ]; then
		cp -f "$script_dir_zshrc" "$home_zshrc"
	else
		exit
	fi
fi

