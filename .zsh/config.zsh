# --==[ History File ]==--
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory

# --==[ Autocomplete ]==--
# zstyle ':completion:*' menu select=0
# zstyle ':completion:*' format '  %d'
# zmodload zsh/complist
# autoload -Uz compinit
# compinit

# --==[ Plugins ]==--
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --==[ Highlighting ]==--
typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
  ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
  ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
  ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[command]='fg=green'
  ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[path]='fg=blue,underline'
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan'

# --==[ Key Bindings ]==--
bindkey '^ ' autosuggest-accept                    # ctrl + space
bindkey '^[[7~' beginning-of-line                  # ctrl + a
bindkey '^[[8~' end-of-line                        # ctrl + e
bindkey '^[[2~' overwrite-mode                     # insert
bindkey '^[[3~' delete-char                        # delete
bindkey '^[[C'  forward-char                       # right
bindkey '^[[D'  backward-char                      # left
bindkey '^[[5~' history-beginning-search-backward  # page up
bindkey '^[[6~' history-beginning-search-forward   # page down
bindkey '^[[1;5D' backward-word                    # ctrl + right
bindkey '^[[1;5C' forward-word                     # ctrl + left
bindkey '^H' backward-kill-word                    # ctrl + backspace
bindkey '^K' backward-kill-line                    # ctrl + k
bindkey '^[[Z' undo                                # shift + tab
bindkey '^L' clear-screen                          # ctrl + l

# --==[ Exports ]==--
export PATH="${HOME}/.local/bin:${PATH}"

# --==[ Autostart ]==--
unset XDG_SEAT
[[ -e ~/.ssh/github ]] && {
  { eval `ssh-agent`; ssh-add -q ~/.ssh/github; } &>/dev/null
}
