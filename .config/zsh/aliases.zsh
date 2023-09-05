alias reflector="sudo reflector --sort rate -l 5 --save /etc/pacman.d/mirrorlist"
alias pacman="sudo pacman"
alias yay="yay --devel --nodiffmenu --noeditmenu --removemake"
alias dload="curl -O"
alias ph="patch -p1 <"
alias cl="clear"
alias cd..="cd .."
alias ".."="cd .."
alias -g D="2>/dev/null"
alias -g G="| grep"
alias -g L="| less"

alias mktar="tar cfvz .tar.gz"
alias untar="tar xvf"
alias grep="grep --color=auto"
alias ls="exa --group-directories-first"
alias ll="exa -la --group-directories-first"
alias tree="exa -T"
alias cat="bat"
alias vi="nvim"

alias vs="code --profile"
alias fetch="neofetch"

alias Xp="Xephyr -screen 1920x1080 :1 &"
alias Xp1="Xephyr -screen 1024x598 :1 &"
alias Xp2="Xephyr -screen 1024x498 -screen 1024x498 +xinerama :1 &"
alias DS="DISPLAY=:1.0 QTILE_XEPHYR=1 qtile start -l INFO"

alias ga="git add"
alias gb="git branch"
alias gc="git clone"
alias gd="git diff"
alias gf="git fetch"
alias gl="git log --oneline"
alias gm="git merge"
alias gr="git restore"
alias gs="git status"
alias gco="git checkout"
alias grb="git rebase"
alias grs="git reset"
alias gst="git stash"
alias gsw="git switch"
alias grm="git remote"
alias grms="git remote set-url origin"
alias gcm="git commit -m"
alias gcma="git commit -a -m"
alias gpll="git pull"
alias gpsh="git push"

GLOBALIAS_FILTER_VALUES=(
  pacman yay dload cl cd.. .. grep ls ll tree cat vi
)
