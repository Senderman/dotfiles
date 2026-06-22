# Enable tv autocompletion on tab when the command is cd, otherwise use default completion
eval "$(tv init zsh)"

__tv_cd_path_completion() {
  local base lbuf tail dir leftover matches
  base=$1
  tail="/"

  eval "base=$base" 2> /dev/null || return
  [[ $base = *"/"* ]] && dir="$base"
  while [ 1 ]; do
    if [[ -z "$dir" || -d ${dir} ]]; then
      leftover=${base/#"$dir"}
      leftover=${leftover/#\/}
      [ -z "$dir" ] && dir='.'
      [ "$dir" != "/" ] && dir="${dir/%\//}"
      zle -I
      matches=$(
        shift
        tv "$dir" --autocomplete-prompt "cdcmp" --inline --no-status-bar --input "$leftover" < /dev/tty | while read -r item; do
          dirP="$dir/"
          [[ $dirP = "./" ]] && dirP=""
          echo -n -E "$dirP${(q)item} "
        done
      )
      matches=${matches% }
      if [ -n "$matches" ]; then
        LBUFFER="cd $matches$tail"
      fi
      zle reset-prompt
      break
    fi
    dir=$(dirname "$dir")
    dir=${dir%/}/
  done
}

__tv_cd_completion(){
  _disable_bracketed_paste

  local tokens prefix trigger lbuf
  setopt localoptions noshwordsplit noksh_arrays noposixbuiltins

  # http://zsh.sourceforge.net/FAQ/zshfaq03.html
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags
  tokens=(${(z)LBUFFER})
  if [ ${#tokens} -lt 1 ]; then
    zle ${fzf_default_completion:-expand-or-complete}
    return
  fi

  [[ ${LBUFFER[-1]} == ' ' ]] && tokens+=("")

  if [[ ${LBUFFER} = *"${tokens[-2]-}${tokens[-1]}" ]]; then
    tokens[-2]="${tokens[-2]-}${tokens[-1]}"
    tokens=(${tokens[0,-2]})
  fi

  lbuf=$LBUFFER
  cmd=${tokens[1]}
  prefix=${tokens[-1]}
  [ -n "${tokens[-1]}" ] && lbuf=${lbuf:0:-${#tokens[-1]}}

  if [[ "$LBUFFER" =~ "^\ *cd$" ]]; then
      zle ${fzf_default_completion:-expand-or-complete}
  # do not conflict with zoxide
  elif [[ "$LBUFFER" =~ "^\ *cd.+ $" ]];then
      zle ${fzf_default_completion:-expand-or-complete}
  elif [ "$cmd" = "cd" ]; then
       __tv_cd_path_completion "$prefix"
  else
      zle ${fzf_default_completion:-expand-or-complete}
  fi

  _enable_bracketed_paste
}

zle -N __tv_cd_completion
bindkey '^I' __tv_cd_completion

