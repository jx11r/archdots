autoload -Uz compinit && compinit
autoload -U colors && colors

# enviroment variables
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"

# bind gpg-agent to this TTY if gpg commands are used
export GPG_TTY=$(tty)

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# fix useless space in right prompt
ZLE_RPROMPT_INDENT=0

# https://zsh.sourceforge.io/Doc/Release/Options.html
_options=(
  'AUTOCD'
  'EXTENDED_HISTORY'
  'HIST_EXPIRE_DUPS_FIRST'
  'HIST_IGNORE_ALL_DUPS'
  'HIST_IGNORE_DUPS'
  'HIST_IGNORE_SPACE'
  'HIST_REDUCE_BLANKS'
  'HIST_SAVE_NO_DUPS'
  'HIST_VERIFY'
  'INC_APPEND_HISTORY'
  'INTERACTIVE_COMMENTS'
  'SHARE_HISTORY'
)

for option in "${_options[@]}"; do
  setopt $option
done; unset _options

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
