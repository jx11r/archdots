source ~/.zsh/aliases.zsh
source ~/.zsh/options.zsh
source ~/.zsh/prompt.zsh

# Exports
export PATH="${HOME}/.local/bin:${PATH}"

# Autostart
unset XDG_SEAT

[[ -e ~/.ssh/key ]] && {
  { eval `ssh-agent`; ssh-add -q ~/.ssh/key; } &>/dev/null
}
