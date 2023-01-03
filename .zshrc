source ~/.zsh/aliases.zsh
source ~/.zsh/options.zsh
source ~/.zsh/prompt.zsh

# Exports
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/.local/share/nvim/mason/bin:${PATH}"
export EDITOR=nvim

# Autostart
[[ -e ~/.ssh/key ]] && {
  { eval `ssh-agent`; ssh-add -q ~/.ssh/key; } &>/dev/null
}
