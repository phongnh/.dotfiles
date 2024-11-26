# http://ethanschoonover.com/solarized#the-values

# Use these settings if you've applied a Solarized theme to your terminal (for
# example, if "ls -G" produces Solarized output). i.e. if "blue" is #268bd2, not
# whatever the default is. (See "../etc/Solarized Dark.terminal" for OS X.)

set -l base03  "--bold black"
set -l base02  "black"
set -l base01  "--bold green"
set -l base00  "--bold yellow"
set -l base0   "--bold blue"
set -l base1   "--bold cyan"
set -l base2   "white"
set -l base3   "--bold white"
set -l yellow  "yellow"
set -l orange  "--bold red"
set -l red     "red"
set -l magenta "magenta"
set -l violet  "--bold magenta"
set -l blue    "blue"
set -l cyan    "cyan"
set -l green   "green"

# Use these settings if your terminal supports term256 and your terminal hasn't
# been configured with a Solarized theme.i.e. if "blue" is the default blue, not
# Solarized blue.
#
# set -l base03  002b36
# set -l base02  073642
# set -l base01  586e75
# set -l base00  657b83
# set -l base0   839496
# set -l base1   93a1a1
# set -l base2   eee8d5
# set -l base3   fdf6e3
# set -l yellow  b58900
# set -l orange  cb4b16
# set -l red     dc322f
# set -l magenta d33682
# set -l violet  6c71c4
# set -l blue    268bd2
# set -l cyan    2aa198
# set -l green   859900

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color

set -g fish_color_autosuggestion    $base01
set -g fish_color_cancel            \x2dr
set -g fish_color_command           $base0
set -g fish_color_comment           $base01
set -g fish_color_cwd               $yellow
set -g fish_color_cwd_root          $red
set -g fish_color_end               $base0
set -g fish_color_error             $red
set -g fish_color_escape            "$cyan"\x1e\x2d\x2dbold
set -g fish_color_history_current   \x2d\x2dbold
set -g fish_color_host              $cyan
set -g fish_color_match             $cyan
set -g fish_color_normal            $base0
set -g fish_color_operator          $orange
set -g fish_color_param             $blue
set -g fish_color_quote             $cyan
set -g fish_color_redirection       $base0
set -g fish_color_search_match      "--background=$base02"
set -g fish_color_user              $green
set -g fish_color_valid_path        \x2d\x2dunderline
set -g fish_color_selection         "$base0"\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3d"$base02"
set -g fish_pager_color_completion  \x1d
set -g fish_pager_color_description "$base0"
set -g fish_pager_color_prefix      "$base2"\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
set -g fish_pager_color_progress    "$base2"\x1e\x2d\x2dbackground\x3d"$green"

# Overwritten

# set -g fish_color_command      $base1
# set -g fish_color_end          $blue
# set -g fish_color_escape       "--bold $yellow"\x1e\x2d\x2dbold
# set -g fish_color_match        \x2d\x2dbackground\x3d"--bold $blue"
# set -g fish_color_operator     "--bold $yellow"
# set -g fish_color_param        $base0
# set -g fish_color_quote        $base00
# set -g fish_color_redirection  $violet
# set -g fish_color_search_match "$base0"\x1e\x2d\x2dbackground\x3d"$base02"

set -g fish_color_autosuggestion $cyan
set -g fish_color_comment        $cyan

set -g fish_color_host $base0
set -g fish_color_user "--bold $green"
set -g fish_color_cwd  $green

