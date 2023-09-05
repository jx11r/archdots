_modules=(
  'aliases'
  'options'
  'globalias'
  'syntax-highlighting'
  'keybinds'
)

for module in "${_modules[@]}"; do
  source "$XDG_CONFIG_HOME/zsh/$module.zsh"
done

unset _modules
eval "$(starship init zsh)"
