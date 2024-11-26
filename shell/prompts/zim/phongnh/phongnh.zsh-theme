# vim:et sts=2 sw=2 ft=zsh
#
# phongnh's Theme
#
# Requires the `git-info` zmodule to be included in the .zimrc file.

prompt_phongnh_help () {
  cat <<EOH

    prompt phongnh

EOH
}

prompt_phongnh_main() {
  ### Prompt components
  # Each component will draw itself, or hide itself if no information needs to
  # be shown.

  # Time: current time
  prompt_phongnh_time() {
    print -n "%k%F%f%D{%H:%M:%S} "
  }

  # Pwd: current working directory.
  prompt_phongnh_pwd() {
    print -n "%c "
  }

  # Git: branch/detached head, dirty status.
  prompt_phongnh_git() {
    if [[ -n ${git_info} ]]; then
      print -n "${(e)git_info[prompt]}"
    fi
  }

  # Status: Was there an error? Show !
  prompt_phongnh_status() {
    print -n "\n%(?:$:!) "
  }

  prompt_phongnh_time
  prompt_phongnh_pwd
  prompt_phongnh_git
  prompt_phongnh_status
}

prompt_phongnh_precmd() {
  (( ${+functions[git-info]} )) && git-info
}

prompt_phongnh_setup() {
  autoload -Uz add-zsh-hook && add-zsh-hook precmd prompt_phongnh_precmd

  prompt_opts=(cr percent sp subst)

  zstyle ':zim:git-info'                             verbose 'yes'
  zstyle ':zim:git-info:action'                      format  ' [%s]'
  zstyle ':zim:git-info:action:apply'                format  'A'
  zstyle ':zim:git-info:action:bisect'               format  'B'
  zstyle ':zim:git-info:action:merge'                format  'M'
  zstyle ':zim:git-info:action:cherry-pick'          format  'C'
  zstyle ':zim:git-info:action:cherry-pick-sequence' format  'CS'
  zstyle ':zim:git-info:action:rebase'               format  'R'
  zstyle ':zim:git-info:action:rebase-interactive'   format  'RI'
  zstyle ':zim:git-info:action:rebase-merge'         format  'RM'
  zstyle ':zim:git-info:branch'                      format  '%b'
  zstyle ':zim:git-info:commit'                      format  '%.7c'
  zstyle ':zim:git-info:dirty'                       format  ' *'
  zstyle ':zim:git-info:clean'                       format  ' '
  zstyle ':zim:git-info:untracked'                   format  ' ?'
  zstyle ':zim:git-info:indexed'                     format  ' +'
  zstyle ':zim:git-info:unindexed'                   format  ' *'
  zstyle ':zim:git-info:position'                    format  '%p'
  zstyle ':zim:git-info:stashed'                     format  ' @'
  zstyle ':zim:git-info:ahead'                       format  ' >'
  zstyle ':zim:git-info:behind'                      format  ' <'
  zstyle ':zim:git-info:diverged'                    format  ' ='
  zstyle ':zim:git-info:keys'                        format  \
    'prompt' '($(coalesce "%b" "%p" "%.7c")%s%I%u%i%A%B%V%S)'

  PS1="\$(prompt_phongnh_main)"
  RPS1=''
}

prompt_phongnh_preview () {
  if (( ${#} )); then
    prompt_preview_theme phongnh "${@}"
  else
    prompt_preview_theme phongnh
  fi
}

prompt_phongnh_setup "${@}"
