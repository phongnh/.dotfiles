# vim:et sts=2 sw=2 ft=zsh
#
# phongnh's Theme
#
# Requires the `git-info` zmodule to be included in the .zimrc file.

prompt_simple_help () {
  cat <<EOH

    prompt simple

EOH
}

prompt_simple_main() {
  ### Prompt components
  # Each component will draw itself, or hide itself if no information needs to
  # be shown.

  # Time: current time
  prompt_simple_time() {
    print -n "%k%F%f%D{%H:%M:%S} "
  }

  # Pwd: current working directory.
  prompt_simple_pwd() {
    print -n "%c "
  }

  # Status: Was there an error? Show !
  prompt_simple_status() {
    print -n "%(?:$:!) "
  }

  prompt_simple_time
  prompt_simple_pwd
  prompt_simple_status
}

prompt_simple_precmd() {
  (( ${+functions[git-info]} )) && git-info
}

prompt_simple_setup() {
  autoload -Uz add-zsh-hook && add-zsh-hook precmd prompt_simple_precmd

  prompt_opts=(cr percent sp subst)

  PS1="\$(prompt_simple_main)"
  RPS1=''
}

prompt_simple_preview () {
  if (( ${#} )); then
    prompt_preview_theme simple "${@}"
  else
    prompt_preview_theme simple
  fi
}

prompt_simple_setup "${@}"
