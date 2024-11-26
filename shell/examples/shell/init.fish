# Environment Variables & Functions
for file in $HOME/.shell/{env,functions}/*.fish
    source "$file"
end

# fish_git_prompt colors
set -g __fish_git_prompt_color_untrackedfiles yellow
set -g __fish_git_prompt_color_invalidstate   red
set -g __fish_git_prompt_color_dirtystate     blue
set -g __fish_git_prompt_color_cleanstate     green
set -g __fish_git_prompt_color_stagedstate    yellow
set -g __fish_git_prompt_color_branch_dirty   red
set -g __fish_git_prompt_color_branch_staged  yellow
set -g __fish_git_prompt_color_branch         green
set -g __fish_git_prompt_char_stateseparator  '⚡'

true
