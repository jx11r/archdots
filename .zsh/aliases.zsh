# --==[ Aliases ]==--
alias ppd='popd'
alias pd='pushd'
alias cd..='cd ..'
alias cl='clear'
alias tar='tar -xf'
alias dload='curl -O'
alias grep='grep --color=auto'
alias pacman='sudo pacman'

# Xephyr
alias Xone='Xephyr -screen 720x480 :1'
alias Xtwo='Xephyr -screen 640x480 -screen 640x480 +xinerama :1'

# Files
alias ls='exa --group-directories-first'
alias ll='exa -la --group-directories-first'
alias tree='exa -T'
alias cat='bat'
alias vi='nvim'

# Git
alias gpsh='git push'
alias gpll='git pull'
alias gs='git status'
alias gr='git restore'
alias gd='git diff'
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'
alias gst='git stash'
alias gcm='git commit -m'
alias gcma='git commit -a -m'

# SSH
alias ssh-start='eval "$(ssh-agent -s)"; ssh-start'

# Info
alias fetch='neofetch'
alias usage='du -sh'
