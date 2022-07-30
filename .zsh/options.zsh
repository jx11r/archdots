# History File
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt INTERACTIVE_COMMENTS

# Highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=red'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=white'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=white'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=white'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=white'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=white'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=white'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=magenra'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=red'
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=cyan'

# Key Bindings
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

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
