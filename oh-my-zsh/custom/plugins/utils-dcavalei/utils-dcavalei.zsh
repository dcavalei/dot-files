current_dir=${0:A:h}

for file in $current_dir/src/*.zsh; do
  if [[ -f $file ]]; then
    source $file
  fi
done
