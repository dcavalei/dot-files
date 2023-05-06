#!/bin/bash


add_list_id=913a989b-bb52-4793-b81b-23b831ec68ff
dconf load /org/gnome/terminal/legacy/profiles:/:"$add_list_id"/ < dcavalei-terminal-profile.dconf

# Add it to the default list in the terminal
old_list=$(dconf read /org/gnome/terminal/legacy/profiles:/list | tr -d "]")

if [ -z "$old_list" ]
then
	front_list="["
else
	front_list="$old_list, "
fi

new_list="$front_list'$add_list_id']"
dconf write /org/gnome/terminal/legacy/profiles:/list "$new_list" 
dconf write /org/gnome/terminal/legacy/profiles:/default "'$add_list_id'"

# Switch the shell.
chsh -s $(which zsh)
