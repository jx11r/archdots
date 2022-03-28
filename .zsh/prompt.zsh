# --==[ Prompt + Git ]==--
autoload -U colors && colors
autoload -Uz add-zsh-hook
source /usr/share/gitstatus/gitstatus.prompt.zsh

# Fix useless space (right prompt)
ZLE_RPROMPT_INDENT=0

function git_prompt() {
  if gitstatus_query MY && [[ $VCS_STATUS_RESULT == ok-sync ]]; then
    declare -A vcs_status
      vcs_status[1]=$VCS_STATUS_NUM_UNSTAGED_DELETED
      vcs_status[2]=$VCS_STATUS_NUM_STAGED_DELETED
      vcs_status[3]=$VCS_STATUS_HAS_UNSTAGED
      vcs_status[4]=$VCS_STATUS_HAS_STAGED
      vcs_status[5]=$VCS_STATUS_HAS_UNTRACKED

    for value in ${vcs_status[@]}; do
      [[ $value > 0 ]] && {
        local git_status=true
        break
      }
    done

    [ $git_status ] && {
      local signs=''
      
      (( $vcs_status[1] )) ||
      (( $vcs_status[2] )) && signs+='%F{red}-%f'
      (( $vcs_status[3] )) && signs+='%F{green}!%f'
      (( $vcs_status[4] )) && signs+='%F{yellow}+%f'
      (( $vcs_status[5] )) && signs+='%F{blue}?%f'

      SIGNS="%B${signs}%b"
    }

    (( VCS_STATUS_HAS_CONFLICTED )) && {
      local color='red'
    } || {
      local color='magenta'
    }

    [[ $(pwd) != $HOME ]] && {
      BRANCH="%B%F{${color}} ${VCS_STATUS_LOCAL_BRANCH}%f%b "
    }
  fi
}

function set_prompt() {
  BRANCH=''
  SIGNS=''
  git_prompt

  PROMPT='%B%F{cyan}%1~%f%b ' 
  PROMPT+=${BRANCH}
  PROMPT+='%F{%(?.yellow.red)}❯ %f'

  RPROMPT=${SIGNS}

  setopt no_prompt_{bang,subst} prompt_percent
}

gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'
add-zsh-hook precmd set_prompt