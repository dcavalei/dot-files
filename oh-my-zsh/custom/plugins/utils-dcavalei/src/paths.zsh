# Hardcoded list of directories to add to PATH
directories=(
  "$HOME/.local/share/JetBrains/Toolbox/scripts"
  # "/path/to/dir"
)

# Join the directories array into a colon-separated string
path_str="${(j/:/)directories}"

# Update PATH environment variable
export PATH="$path_str:$PATH"
