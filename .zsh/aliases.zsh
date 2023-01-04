autoload -Uz compinit && compinit

globalias() {
  local word=${${(Az)LBUFFER}[-1]}

  [[ $GLOBALIAS_FILTER_VALUES[(Ie)$word] -eq 0 ]] && {
    zle _expand_alias
    zle expand-word
  }

  zle self-insert
}

zle -N globalias
bindkey " " globalias
bindkey -M isearch " " magic-space

# System
alias reflector='sudo reflector --sort rate -l 5 --save /etc/pacman.d/mirrorlist'
alias pacman='sudo pacman'
alias yay='yay --devel'
alias dload='curl -O'
alias ph='patch -p1 <'
alias cl='clear'
alias cd..='cd ..'
alias grep='grep --color=auto'
alias mktar='tar cfvz .tar.gz'
alias untar='tar xvf'
alias -g D='2>/dev/null'
alias -g G='| grep'
alias -g L='| less'

# Files
alias ls='exa --group-directories-first'
alias ll='exa -la --group-directories-first'
alias tree='exa -T'
alias cat='bat'
alias vi='nvim'
alias nv='neovide'

# Xephyr
alias Xone='Xephyr -screen 720x480 :1'
alias Xtwo='Xephyr -screen 640x480 -screen 640x480 +xinerama :1'

# Git
alias ga='git add'
alias gb='git branch'
alias gc='git clone'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log --oneline'
alias gm='git merge'
alias gr='git restore'
alias gs='git status'
alias gco='git checkout'
alias grb='git rebase'
alias grm='git remote'
alias grs='git reset'
alias gst='git stash'
alias gsw='git switch'
alias gcm='git commit -m'
alias gcma='git commit -a -m'
alias gpll='git pull'
alias gpsh='git push'

GLOBALIAS_FILTER_VALUES=(
  pacman yay dload cl cd.. grep ls ll tree cat vi nv
)
