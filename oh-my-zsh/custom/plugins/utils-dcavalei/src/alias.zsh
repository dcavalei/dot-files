# Git quick push
alias gqp='git add --update && git commit --amend --no-edit --date=now && git push --force'

# Copy history to clipboard
alias cph='history | fzf | awk "{\$1=\"\"; sub(/^[ \t]+/, \"\"); print}" | clipcopy'

alias cat='batcat'

alias wget-list='wget --spider -r --no-parent'

alias rg='rg -.'

alias fd='fdfind'

alias json-format='python -m json.tool'
