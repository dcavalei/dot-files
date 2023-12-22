# Git quick push
alias gqp='git add -u && git commit --amend --no-edit --date=now && git push --force'

# Copy history to clipboard
alias cph='history | fzf | awk "{\$1=\"\"; sub(/^[ \t]+/, \"\"); print}" | clipcopy'
