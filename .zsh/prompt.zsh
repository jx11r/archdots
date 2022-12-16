autoload -U colors && colors
autoload -Uz add-zsh-hook
source /usr/share/gitstatus/gitstatus.plugin.zsh

# Fix useless space (right prompt)
ZLE_RPROMPT_INDENT=0

preexec() {
  timer=$(($(date +%s%0N) / 1000000000))
}

precmd() {
  [ $timer ] && {
    local seconds=$(($(date +%s%0N) / 1000000000 - $timer))
    local x=$seconds

    (( $seconds > 59 )) && {
      local minutes=$(($seconds / 60))
      (( $minutes > 59 )) && {
        local hours=$(($minutes / 60))
        minutes=$(($minutes - $hours * 60))
        time=$(echo $hours'h' $minutes'm' | sed 's/\s0m$//g')
      } || {
        seconds=$(($seconds - $minutes * 60))
        time=$(echo $minutes'm' $seconds's' | sed 's/\s0s$//g')
      }
    } || {
      time=$seconds's'
    }

    (( $x > 14 )) && elapsed="took ${time} " || elapsed=''

    unset timer time
  }
}

gitstatus() {
  if gitstatus_query MY && [[ $VCS_STATUS_RESULT == ok-sync ]]; then
    declare -A VCS_STATUS
      VCS_STATUS[1]=$VCS_STATUS_NUM_UNSTAGED_DELETED
      VCS_STATUS[2]=$VCS_STATUS_NUM_STAGED_DELETED
      VCS_STATUS[3]=$VCS_STATUS_HAS_UNSTAGED
      VCS_STATUS[4]=$VCS_STATUS_HAS_STAGED
      VCS_STATUS[5]=$VCS_STATUS_HAS_UNTRACKED

    for value in ${VCS_STATUS[@]}; do
      [[ $value > 0 ]] && {
        local show_status=true
        break
      }
    done

    [ $show_status ] && {
      local signs=''

      (( $VCS_STATUS[1] )) ||
      (( $VCS_STATUS[2] )) && signs+='-'
      (( $VCS_STATUS[3] )) && signs+='!'
      (( $VCS_STATUS[4] )) && signs+='+'
      (( $VCS_STATUS[5] )) && signs+='?'

      local signs="%F{red}[${signs}]%f "
    } || {
      unset VCS_STATUS
    }

    (( VCS_STATUS_HAS_CONFLICTED )) && \
      { local color='red' } || { local color='magenta' }

    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      local where=$VCS_STATUS_LOCAL_BRANCH
    elif [[ -n $VCS_STATUS_TAG ]]; then
      local where='#'$VCS_STATUS_TAG
    else
      local where='@'${VCS_STATUS_COMMIT[1,7]}
    fi

    echo "%F{${color}} ${where}%f ${signs}"
  fi
}

main() {
  PROMPT='%F{cyan}%1~%f '
  PROMPT+=$(gitstatus)
  PROMPT+="%F{yellow}${elapsed}%f"
  PROMPT+='%F{%(?.green.red)}❯ %f'

  RPROMPT=''
  [[ -n ${VIRTUAL_ENV} ]] && {
    RPROMPT+="%F{yellow}(env)%f"
  }

  setopt no_prompt_{bang,subst} prompt_percent
}

gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'
add-zsh-hook precmd main
