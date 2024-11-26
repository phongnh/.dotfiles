#
# Gruvbox Light (Medium)
#

set color00 fb/f1/c7 # Base 00 - Black
set color01 9d/00/06 # Base 08 - Red
set color02 79/74/0e # Base 0B - Green
set color03 b5/76/14 # Base 0A - Yellow
set color04 07/66/78 # Base 0D - Blue
set color05 8f/3f/71 # Base 0E - Magenta
set color06 42/7b/58 # Base 0C - Cyan
set color07 50/49/45 # Base 05 - White
set color08 bd/ae/93 # Base 03 - Bright Black
set color09 $color01 # Base 08 - Bright Red
set color10 $color02 # Base 0B - Bright Green
set color11 $color03 # Base 0A - Bright Yellow
set color12 $color04 # Base 0D - Bright Blue
set color13 $color05 # Base 0E - Bright Magenta
set color14 $color06 # Base 0C - Bright Cyan
set color15 28/28/28 # Base 07 - Bright White
set color16 af/3a/03 # Base 09
set color17 d6/5d/0e # Base 0F
set color18 eb/db/b2 # Base 01
set color19 d5/c4/a1 # Base 02
set color20 66/5c/54 # Base 04
set color21 3c/38/36 # Base 06
set colorfg $color07 # Base 05 - White
set colorbg $color00 # Base 00 - Black

# set syntax highlighting colors
set -g fish_color_autosuggestion    d5c4a1
set -g fish_color_cancel            \x2dr
set -g fish_color_command           green    #white
set -g fish_color_comment           d5c4a1
set -g fish_color_cwd               green
set -g fish_color_cwd_root          red
set -g fish_color_end               brblack  #blue
set -g fish_color_error             red
set -g fish_color_escape            yellow   #green
set -g fish_color_history_current   \x2d\x2dbold
set -g fish_color_host              normal
set -g fish_color_match             \x2d\x2dbackground\x3dbrblue
set -g fish_color_normal            normal
set -g fish_color_operator          blue     #green
set -g fish_color_param             665c54
set -g fish_color_quote             yellow   #brblack
set -g fish_color_redirection       cyan
set -g fish_color_search_match      bryellow\x1e\x2d\x2dbackground\x3dd5c4a1
set -g fish_color_selection         white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dd5c4a1
set -g fish_color_status            red
set -g fish_color_user              brgreen
set -g fish_color_valid_path        \x2d\x2dunderline
set -g fish_greeting                Welcome\x20to\x20fish\x2c\x20the\x20friendly\x20interactive\x20shell
set -g fish_key_bindings            fish_default_key_bindings
set -g fish_pager_color_completion  normal
set -g fish_pager_color_description yellow\x1e\x2d\x2ddim
set -g fish_pager_color_prefix      white\x1e\x2d\x2dbold #\x1e\x2d\x2dunderline
set -g fish_pager_color_progress    brwhite\x1e\x2d\x2dbackground\x3dcyan
