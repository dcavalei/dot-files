# Hardcoded list of directories to be added
directories=(
  "$HOME/.local/share/JetBrains/Toolbox/scripts"
  "$HOME/blimey/bin"
  "$HOME/Repos/docker-aosp-build/scripts"
  # Android BS
  "$HOME/Android/Sdk/build-tools/34.0.0"
  "$HOME/Android/Sdk/platform-tools"
)

# Join the directories array into a colon-separated string
path_str="${(j/:/)directories}"

# Update PATH environment variable
export PATH="$path_str:$PATH"
