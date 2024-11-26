" Vim Settings
if has('vim_starting')
    set encoding=utf-8
    set fileformat=unix
endif
" scriptencoding utf-8

" No Vi Compatibility
if &compatible
    set nocompatible
endif

if &shell =~# 'fish$'
    if executable('zsh')
        let &shell = exepath('zsh')
    elseif executable('bash')
        let &shell = exepath('bash')
    endif
endif

" Python 3
if has('pythonx')
    set pyxversion=3
endif

if has('gui_running')
    " Disable menu
    let g:did_install_default_menus = 1
    let g:did_install_syntax_menu   = 1

    if has('gui_macvim')
        set guioptions+=M
    else
        " System menu is not sourced
        set guioptions-=M
    endif
endif

set ttimeout                    " Time out for key codes
set ttimeoutlen=50              " Wait up to 50ms after Esc for special key
set timeoutlen=500              " Time out on mapings after 500ms

set visualbell                  " Use visual bell instead of beeping
set t_vb=                       " Disable screen flash

set updatetime=250              " 250ms to save swap file and trigger CursorHold autocommand event

set mouse=a                     " Enable mouse in every mode
set mousemodel=popup            " Right mouse button pops up a menu

set fileformats=unix,dos

set tabpagemax=20
" set ttyfast                     " Indicates a fast terminal connection
set lazyredraw                  " Do not redraw while macro executing
set redrawtime=0                " Time in milliseconds for redrawing the display
set shortmess=aoOtTIcC          " Print current file name, cursor position and file status (press CTRL-G)
set laststatus=2                " Always display statusline
" set display+=lastline           " When a line is long, do not omit it in @
set display+=truncate           " Show @@@ in the last line if it is truncated - has('patch-7.4.2109')
set cmdheight=2                 " Height of command-line (easy-readable)
set history=250                 " Store lots of command lines in history
set noshowcmd                   " Do not show (partial) command in the last line of the screen
" set noruler                     " Do not show the line and column number of the cursor position (press CTRL-G or g CTRL-G)

set nofoldenable                " Disable fold by default
set foldopen+=insert,jump       " Folds will be opened for insert and jump commands as well
set foldmethod=indent           " Lines with equal indent form a fold
set foldlevel=2                 " Starting fold at level 2

set nomodeline                  " Disable modeline

set nrformats-=octal
set backspace=indent,eol,nostop " Enable backspace delete indent and newline
set virtualedit=block           " Enable virtualedit in visual block mode
set whichwrap=b,s,h,l,<,>,[,]   " Allow wrap only when Backspace, h, l and cursor keys are used
set nostartofline               " The cursor is kept in the same column (if possible)
set scrolloff=1                 " Minimal number of screen lines to keep above and below the cursor
set sidescrolloff=5             " The minimal number of screen columns to keep to the left and to the right of the cursor
set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new window right the current one
set splitkeep=screen            " Keep the text on the same screen line
set winminwidth=5               " Hard minimal width of a window
" set noequalalways               " No equal window size

set confirm                     " Confirm to save changes before exiting modified buffer
set hidden                      " Allow buffer switching without saving
set autowrite                   " Enable auto write
set autoread                    " Auto-reload if file is saved externally

" set infercase                   " Ignore case on insert completion
set ignorecase                  " Ignore case search for normal letters
set smartcase                   " Do case-sensitive search if pattern contains upper case letters
if has('reltime')
    set incsearch                   " Enable incremental search
endif
set hlsearch                    " Highlight search matches
" set matchtime=1                 " 100 miliseconds to show the matching paren
" set matchpairs+=<:>             " Highlight <>
" set cpoptions-=m                " A showmatch will wait a matchtime or until a character is typed

" Default indent settings
set shiftwidth=2
set shiftround
set autoindent
set smartindent
set expandtab                   " Expand tab to space
set smarttab                    " Smart insert / delete tab

" set textwidth=120
" set colorcolumn=+1
" set cursorline
" set cursorlineopt=number

" Use better separators
" :help 'fillchars'
set fillchars=vert:│,fold:\ ,foldsep:│,diff:⣿
if has('patch-8.2.2524') | set fillchars+=eob:\  | endif

" Display tabs and trailing spaces
" :help 'listchars'
" set listchars=tab:»\ ,leadmultispace:│\ ,trail:·,nbsp:•,extends:›,precedes:‹,eol:↲
set listchars=tab:»\ ,trail:…,nbsp:•,extends:›,precedes:‹,eol:§

if has('conceal')
    set conceallevel=2 concealcursor=n
endif

set nowrap                      " Disable wrapping long lines by default
if has('linebreak')
    set linebreak               " Wrap long lines at a character in 'breakat'
    let &showbreak='↪ '         " String to put at the start of lines that have been wrapped.
    " set breakat=\ \	;:,!?
    set breakindent
    set cpoptions+=n            " showbreak appears in between line numbers
endif

set nobackup nowritebackup      " Do not create backup
set noswapfile                  " Do not use swapfile for buffer
set directory=~/.cache/vim/swap//
set backupdir=~/.cache/vim/backup//
if has('persistent_undo')
    set undodir=~/.cache/vim/undo//
    set undofile
endif

" Disable a legacy behavior that can break plugin maps.
if has('langmap') && exists('+langremap') && &langremap
    set nolangremap
endif

" :help fo-table
" t: Auto-wrap text using 'textwidth'
" c: Auto-wrap comments using 'textwidth', inserting the current comment leader automatically
" 1: Don't break a line after a one-letter word
" j: Remove a comment leader when joining lines
set formatoptions+=t formatoptions+=c formatoptions+=1 formatoptions+=j

set notagbsearch                " Use linear search
set tagcase=match               " Use match case when searching tags

if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" Completion settings
" set completeopt=menu,menuone,noinsert,noselect
" set completeopt=menu,menuone,popup,noinsert,noselect
set completeopt=menu,menuone,popup,noselect

" CTRL-P / CTRN-N keyword completion
" . scan the current buffer ('wrapscan' is ignored)
" w scan buffers from other windows
" b scan other loaded buffers that are in the buffer list
" u scan the unloaded buffers that are in the buffer list
set complete=.,w,b,u

set wildmenu
set wildmode=longest:full,full
if has('patch-8.2.4325')
    set wildoptions=pum,tagfile
else
    set wildoptions=tagfile
endif
set wildcharm=<C-s>             " Use default command line completion by <C-s>

set pumheight=10                " Maximum number of entries in a popup

" Ignore the following file patterns when expanding wildcards, completing file or directory names
set wildignore+=*/.git/*,*/tmp/*,*/__pycache__/*,*/node_modules/*,*/.next/*,*/.terraform/*,*/.shards/*,*/_build/*,*/.elixir_ls/*,
set wildignore+=*.o,*.obj,*.dwarf,*.pyc,*.rbc,*.rbo,*.luac,*.class,*.gem
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf
set wildignore+=*.zip,*.rar,*.7z,*.tar,*.gz,*.bz2,*.xz
set wildignore+=*.dmg,*.pkg,*.dll,*.exe,*.lnk,*.ini,*.dat
set wildignore+=*.DS_Store,*.swp,*~,._*

" https://vimways.org/2018/death-by-a-thousand-files/
" Ignore /usr/include folder from search path
set path-=/usr/include

" Remember where we are, support yankring
if !empty(&viminfo)
    set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

if has('diff')
    if has('patch-8.1.0360')
        " Use the new internal diff feature with options:
        " - indent-heuristic: uses indentation to improve diffs
        " - algorithm:patience: patience diff algorithm
        " - algorithm:histogram: an improved patience algorithm as used in Git
        try
            set diffopt+=internal
            set diffopt+=algorithm:histogram
            " set diffopt+=algorithm:patience
            " set diffopt+=indent-heuristic
        catch /E474:/
            set diffopt-=internal
        endtry
    endif
    " Perform vertically split diffs by default
    set diffopt+=vertical,context:8
endif

" if exists('+termwinkey')
"     set termwinkey=<C-l>    " Use CTRL-L key to starts a CTRL-W command in a terminal window
" endif

" Scrolling works with screen lines
if exists('+smoothscroll')
    set smoothscroll
endif

" Don't try to highlight lines longer than 500 characters
set synmaxcol=500
" syntax sync minlines=256

" Work around for Kitty because Vim uses *background color erase*
" even if the terminfo file does not contain the `bce` capability.
if $TERM == 'xterm-kitty'
    set t_ut=
endif

" True Color settings
if $COLORTERM =~# '^\(truecolor\|24bit\)$' && has('termguicolors')
    " :help xterm-true-color
    if index(['alacritty-direct', 'alacritty', 'xterm-kitty', 'tmux-256color', 'screen-256color'], $TERM) > -1
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

" Disable system plugins
let g:loaded_2html_plugin      = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_less              = 1
let g:loaded_logiPat           = 1
let g:loaded_manpager_plugin   = 1
let g:loaded_rrhelper          = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1

" Don't support any embedded scripts
let g:vimsyn_embed = 0

" Disable sql mappings
let g:omni_sql_no_default_maps = 1

" Correctly highlight $() and other modern affordances in filetype=sh.
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
    let g:is_posix = 1
endif

" Set augroup
augroup MyAutoCmd
    autocmd!
augroup END

" Transparent VertSplit
augroup MyAutoCmd
    autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE
augroup END

" Filetype Settings
augroup ZeroVimFiletypes
    autocmd!
    autocmd BufNewFile,BufRead init.lua.local,*.{init,editor}.lua.local setfiletype lua
    autocmd BufNewFile,BufRead *.inky-haml setfiletype haml
    autocmd BufNewFile,BufRead *.html.inky setlocal filetype=eruby.html
    autocmd BufNewFile,BufRead .gemrc setfiletype yaml
    autocmd BufNewFile,BufRead .env.* setfiletype sh
    autocmd BufNewFile,BufRead tigrc,*.tigrc setfiletype tigrc
    autocmd BufNewFile,BufRead *.tmux.conf setfiletype tmux
    autocmd FileType qf setlocal cursorline
    autocmd FileType fugitiveblame setlocal cursorline
    autocmd FileType gitcommit setlocal spell cursorline textwidth=72
    autocmd FileType gitrebase setlocal cursorline
    autocmd FileType gitconfig setlocal noexpandtab
    autocmd FileType pullrequest setlocal spell cursorline
    autocmd FileType tigrc setlocal commentstring=#\ %s
    if executable('jq')
        autocmd FileType json command! -buffer -bar FormatJSON execute printf(':%%!jq -e -M --indent %d .', exists('*shiftwidth') ? shiftwidth() : &shiftwidth)
    elseif executable('python3')
        autocmd FileType json command! -buffer -bar FormatJSON :%!python3 -m json.tool
    elseif executable('python')
        autocmd FileType json command! -buffer -bar FormatJSON :%!python -m json.tool
    endif
    if executable('xmllint')
        autocmd FileType xml command! -buffer -bar FormatXML
                    \ execute printf(
                    \   'silent! :%%!env XMLLINT_INDENT="%s" xmllint --format --recover - 2>/dev/null',
                    \   repeat(' ', exists('*shiftwidth') ? shiftwidth() : &shiftwidth)
                    \ )
    endif
augroup END

function! s:SetupCloseWithQ() abort
    let b:matchup_matchparen_fallback = 0
    let b:matchup_matchparen_enabled = 0
    setlocal nobuflisted
    nnoremap <buffer> <silent> q <Cmd>close<CR>
endfunction

augroup ZeroVimCloseWithQ
    autocmd!
    autocmd FileType qf,help,fugitive,fugitiveblame call <SID>SetupCloseWithQ()
augroup END

function! s:OnVimEnter() abort
    set showtabline=1

    if empty(maparg('gb', 'n'))
        nmap gb <Leader>bb
    endif

    augroup ZeroVimFiletypes
        autocmd FileType ruby if &omnifunc ==# 'syntaxcomplete#Complete' | setlocal omnifunc= | endif
        autocmd FileType sql setlocal omnifunc=
    augroup END
endfunction

augroup MyAutoCmd
    autocmd VimEnter * call s:OnVimEnter()
augroup END

" Helpers
" Find and source vimrc from root to current folder
" ~/projects/hello $
" .
" └── /home/phong
"     ├── vimrc
"     └── projects
"         ├── vimrc
"         └── hello
"             ├── vimrc
"             └── ...
"
" Files are sourced in order for the call Source('vimrc'):
"   /home/phong/vimrc
"   /home/phong/projects/vimrc
"   /home/phong/projects/hello/vimrc
function! Source(name) abort
    let vimrcs = findfile(a:name, expand('~'), -1) + reverse(findfile(a:name, ';', -1))
    for vimrc in uniq(vimrcs)
        execute 'source ' . fnamemodify(vimrc, ':p')
    endfor
endfunction

" Check if a plugin is enabled or not
function! Enabled(plugin, ...) abort
    let l:current = get(g:zero_vim_plugins, a:plugin, 0)
    return !empty(l:current) && (a:0 > 0 ? (l:current ==? a:1) : 1)
endfunction

" Check if a group is enabled or not
function! EnabledGroup(group) abort
    return index(g:zero_vim_groups, a:group) > -1
endfunction

" Check if a plugin is plugged in plug section or not
function! Plugged(plugin) abort
    return has_key(g:plugs, a:plugin)
endfunction

" Helper to setup plugins
function! ZeroVimPlugins(opts) abort
    if type(a:opts) == v:t_dict
        let g:zero_vim_plugins = get(g:, 'zero_vim_plugins', {})
        call extend(g:zero_vim_plugins, a:opts)
    endif
endfunction

" Helper to setup groups
function! ZeroVimGroups(opts) abort
    if type(a:opts) == v:t_list
        let g:zero_vim_groups = extend(get(g:, 'zero_vim_groups', []), a:opts)
        let g:zero_vim_groups = uniq(sort(g:zero_vim_groups))
    elseif type(a:opts) == v:t_dict
        for [l:group, l:enabled] in items(a:opts)
            if empty(l:enabled)
                call filter(g:zero_vim_groups, 'v:val != l:group')
            else
                call add(g:zero_vim_groups, l:group)
            endif
        endfor
        let g:zero_vim_groups = uniq(sort(g:zero_vim_groups))
    endif
endfunction

" Helper to setup open folder mappings
function! ZeroVimOpenFolderMappings(opts) abort
    if type(a:opts) == v:t_dict
        let g:zero_vim_open_folder_mappings = get(g:, 'zero_vim_open_folder_mappings', {})
        call extend(g:zero_vim_open_folder_mappings, a:opts)
    endif
endfunction

" Default files
let g:zero_vim_local_file = get(g:, 'zero_vim_local_file',  '.vimrc.local')

" Default plugins
let g:zero_vim_default_plugins = get(g:, 'zero_vim_default_plugins', {
            \ 'startuptime':     0,
            \ 'statusline':      0,
            \ 'dashboard':       1,
            \ 'buffer-explorer': 0,
            \ 'explorer':        1,
            \ 'finder':          1,
            \ 'ctrlsf':          1,
            \ 'any-jump':        1,
            \ 'sneak':           0,
            \ 'editorconfig':    1,
            \ 'autoindent':      0,
            \ 'quickfix':        0,
            \ 'whitespace':      1,
            \ 'comment':         0,
            \ 'surround':        0,
            \ 'align':           0,
            \ 'change-case':     1,
            \ 'textobj-indent':  0,
            \ 'matchup':         1,
            \ 'foldtext':        1,
            \ 'indent-guides':   1,
            \ 'undotree':        1,
            \ 'ctags':           1,
            \ 'tagbar':          0,
            \ 'auto-pairs':      1,
            \ 'lsp':             0,
            \ 'completion':      1,
            \ 'formatting':      1,
            \ 'linting':         'neomake',
            \ 'github':          1,
            \ 'git':             1,
            \ 'git-messenger':   0,
            \ 'git-gutter':      1,
            \ 'which-key':       0,
            \ })

" Find and source .vimrc.local from root to current folder.
call Source(g:zero_vim_local_file)

" Plugin settings
let g:zero_vim_plugins = extend(deepcopy(g:zero_vim_default_plugins), get(g:, 'zero_vim_plugins', {}))

" Enabled groups
let g:zero_vim_groups = get(g:, 'zero_vim_groups', [])

let g:zero_vim_nerdfont               = get(g:, 'zero_vim_nerdfont',               0)
let g:zero_vim_transparent_background = get(g:, 'zero_vim_transparent_background', 0)
let g:zero_vim_powerline_fonts        = get(g:, 'zero_vim_powerline_fonts',        g:zero_vim_nerdfont)
let g:zero_vim_powerline_style        = get(g:, 'zero_vim_powerline_style',        'default')
let g:zero_vim_git_branch             = get(g:, 'zero_vim_git_branch',             0)
let g:zero_vim_indent_guides          = get(g:, 'zero_vim_indent_guides',          0)
let g:zero_vim_grep_no_ignore_vcs     = get(g:, 'zero_vim_grep_no_ignore_vcs',     0)
let g:zero_vim_find_tool              = get(g:, 'zero_vim_find_tool',              'fd')
let g:zero_vim_find_no_ignore_vcs     = get(g:, 'zero_vim_find_no_ignore_vcs',     0)
let g:zero_vim_follow_links           = get(g:, 'zero_vim_follow_links',           1)
let g:zero_vim_autolint               = get(g:, 'zero_vim_autolint',               0)
let g:zero_vim_autofix                = get(g:, 'zero_vim_autofix',                0)
let g:zero_vim_ctags_bin              = get(g:, 'zero_vim_ctags_bin',              'ctags')
let g:zero_vim_ctags_ignore           = get(g:, 'zero_vim_ctags_ignore',           expand('~/.config/ctags/ignore'))

" CtrlP
let g:zero_vim_ctrlp_matcher = get(g:, 'zero_vim_ctrlp_matcher', 'cpsm')

" Default signs
let g:zero_vim_signs = extend({
            \ 'error':         '🅔',
            \ 'style_error':   'ⓔ',
            \ 'warning':       '🅦',
            \ 'style_warning': 'ⓦ',
            \ 'information':   '🅘',
            \ 'hint':          '🅗',
            \ 'message':       '🅜',
            \ 'virtual_text':  '❯',
            \ }, get(g:, 'zero_vim_signs', {}))

" Map leader
let g:mapleader      = ' '
let g:maplocalleader = '\'

" Space: Leader
nmap <Space> <Nop>
xmap <Space> <Nop>

" F1: Help
" nnoremap <F1> :help<Space>
" imap     <F1> <Esc><F1>

" F2: Paste Toggle
" set pastetoggle=<F2>

" CTRL-Space: Show history
cnoremap <C-@> <C-f>

" CTRL-V: Paste from clipboard
cnoremap <C-v> <C-r>+

" Reset Esc
inoremap <nowait> <Esc> <Esc>
" nnoremap <Esc> <Cmd>nohlsearch<CR><Esc>
" inoremap <Esc> <Cmd>nohlsearch<CR><Esc>

" Enable undo for CTRL-W (Delete word) and CTRL-U (Delete line)
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" Add undo break-points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ; ;<C-g>u

" CTRL-T: Insert tab
" inoremap <silent> <C-t> <C-v><Tab>

" CTRL-L: Redraw
if has('diff')
    nnoremap <silent> <C-l> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-l><CR>
else
    nnoremap <silent> <C-l> <Cmd>nohlsearch<Bar>normal! <C-l><CR>
endif

" ig: inner entire / whole buffer
xnoremap <silent> ig :<C-u>mark '<Bar>keepjumps normal! gg^vGg_<CR>
onoremap <silent> ig :<C-u>mark '<Bar>keepjumps normal! gg^vGg_<CR>
" ag: a entire / whole buffer
xnoremap <silent> ag :<C-u>mark '<Bar>keepjumps normal! gg0vG$<CR>
onoremap <silent> ag :<C-u>mark '<Bar>keepjumps normal! gg0vG$<CR>

" iv: inner line
xnoremap <silent> iv :<C-u>mark '<Bar>keepjumps normal! ^vg_<CR>
onoremap <silent> iv :<C-u>mark '<Bar>keepjumps normal! ^vg_<CR>
" av: a line
xnoremap <silent> av :<C-u>mark '<Bar>keepjumps normal! 0v$<CR>
onoremap <silent> av :<C-u>mark '<Bar>keepjumps normal! 0v$<CR>

" Q: Disable Ex-mode. qq to record, Q to replay (remapped)
nmap Q @q

" Q: Use Q in Visual mode to execute a macro on each line of the selection
xnoremap <silent> <expr> Q mode() == 'V' ? ":normal! @\<C-r>=reg_recorded()\<CR>\<CR>" : 'Q'

" gQ: Q (remapped)
nnoremap gQ Q

" &: Use the same flags as the previous substitution
nnoremap & <Cmd>&&<CR>

" .: repeats the last command on every line
xnoremap . :normal .<CR>

" @: repeats macro on every line
" xnoremap @ :normal @
xnoremap <silent> <expr> @ mode() == 'V' ? ':normal! @' . getcharstr() . "\<CR>" : '@'

" After indenting code, does not exit Visual mode
xnoremap > >gv
xnoremap < <gv

" Tab / Shift-Tab: Indent code in Visual mode
xmap <Tab>   >
xmap <S-Tab> <

" Indent whole file
nnoremap g= gg=G``

" gi already moves to "last place you exited insert mode"
" gI: Move to last change (remapped)
nnoremap gI `.`

" gV: Select the text that was last edited/pasted (remapped)
" http://vimcasts.org/episodes/bubbling-text/
" nmap gV `[v`]
nmap <silent> <expr> gV '`[' . strpart(getregtype(), 0, 1) . '`]'

" g/: Search inside visually highlighted text
xnoremap g/ <Esc>/\%V

" Search visually selected text
xnoremap <silent> * y/\V<C-r>=escape(@", '/\')<CR><CR>
xnoremap <silent> # y?\V<C-r>=escape(@", '?\')<CR><CR>

" U: Redo (remapped)
nnoremap U <Cmd>redo<CR>

" Y: Yank to end line (remapped)
nnoremap Y y$

" Copy / cut to clipboard
nmap cy "+y
nmap cd "+d

xmap gy "+y
xmap gd "+d

" Copy <cfile> (filename or url) under cursor to clipboard
nnoremap <silent> cu <Cmd>let [@+, @*] = [expand('<cfile>'), expand('<cfile>')]<Bar>echo 'Copied: ' @*<CR>

" Copy yanked text to clipboard
nnoremap <silent> cY <Cmd>let [@+, @*] = [@", @"]<CR>

" Paste from clipboard
nnoremap <silent> cp  "+p
nnoremap <silent> cP  "+P
nnoremap <silent> cgp "+gp
nnoremap <silent> cgP "+gP
nnoremap <silent> c=p o<Esc>"+pm``[=`]``^
nnoremap <silent> c=P O<Esc>"+Pm``[=`]``^
nnoremap <silent> c=v <Cmd>set paste<CR>"+p<Cmd>set nopaste<CR>
nnoremap <silent> c=V <Cmd>set paste<CR>"+P<Cmd>set nopaste<CR>

" CTRL-V: Bracketed Paste in Insert mode
inoremap <silent> <C-v> <C-g>u<Cmd>set paste<CR><C-r>+<Cmd>set nopaste<CR>
" inoremap <silent> <C-v> <C-g>u<C-r><C-o>+

" Search and Replace
nnoremap <Leader>R  :%s//gc<Left><Left><Left>
nnoremap <Leader>sr :%s/<C-r><C-w>//gc<Left><Left><Left>
nnoremap <Leader>sx :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

xnoremap <Leader>R  :s/\%V/gc<Left><Left><Left>
xnoremap <Leader>sr "vy:%s/<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>//gc<Left><Left><Left>
xnoremap <Leader>sx "vy:%s/\<<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>\>//gc<Left><Left><Left>

" Search and Replace entries with same mappings in quickfix/locationlist with :cdo and :ldo
function! s:SetupQuickfixMapping() abort
    let l:cmd = ':silent ' . (getwininfo(win_getid())[0]['loclist'] ? 'lfdo' : 'cfdo')
    execute 'nnoremap <buffer> <Leader>R  '         . l:cmd . ' %s//eg<Left><Left><Left>'
    execute 'nnoremap <buffer> <Leader>sr '         . l:cmd . ' %s/<C-r><C-w>//eg<Left><Left><Left>'
    execute 'nnoremap <buffer> <Leader>sx '         . l:cmd . ' %s/\<<C-r><C-w>\>//eg<Left><Left><Left>'
    execute 'xnoremap <buffer> <Leader>sr ' . '"vy' . l:cmd . " %s/<C-r>=substitute(escape(getreg('v'), '^$.*\\/~[]'), '\\n', '\\\\n', 'g')<CR>//eg<Left><Left><Left>"
    execute 'xnoremap <buffer> <Leader>sx ' . '"vy' . l:cmd . " %s/\\<<C-r>=substitute(escape(getreg('v'), '^$.*\\/~[]'), '\\n', '\\\\n', 'g')<CR>\\>//eg<Left><Left><Left>"
    xmap <buffer> <Leader>R <Leader>sr
endfunction

augroup MyAutoCmd
    autocmd FileType qf call <SID>SetupQuickfixMapping()
augroup END

" Open Quickfix & LocationList
" nnoremap <silent> <Leader>Q <Cmd>copen<CR>
" nnoremap <silent> <Leader>W <Cmd>cwindow<CR>

" Buffer-related mappings
" gl: Go to Last buffer
nnoremap <silent> gl <Cmd>buffer#<CR>

" Edit file from buffer folder
nnoremap <C-w><C-e> :edit <C-r>=fnameescape(expand('%:p:~:.:h')) . '/'<CR>

" Edit buffer
nnoremap <C-w>e :edit<Space>

" Yank whole buffer to clipboard
nnoremap <silent> <Leader>by <Cmd>%y+<CR>

" Reload buffer
" nnoremap <silent> <Leader>be <Cmd>confirm edit<CR>

" Save/Write buffer
" nnoremap <silent> <Leader>w <Cmd>update<CR>
" vnoremap <silent> <Leader>w <Cmd>update<CR>

nnoremap <silent> <Leader>bw <Cmd>update<CR>
vnoremap <silent> <Leader>bw <Cmd>update<CR>

nnoremap <silent> <Leader>bu <Cmd>update<CR>
vnoremap <silent> <Leader>bu <Cmd>update<CR>

nnoremap <silent> <C-s> <Cmd>update<CR>
vnoremap <silent> <C-s> <Cmd>update<CR>
inoremap <silent> <C-s> <Cmd>update<CR><Esc>

" Save and Quit buffer
" nnoremap <silent> <Leader>x <Cmd>xit<CR>
" vnoremap <silent> <Leader>x <Cmd>xit<CR>

nnoremap <silent> <Leader>bx <Cmd>xit<CR>
vnoremap <silent> <Leader>bx <Cmd>xit<CR>

" Unload buffer and delete it from the buffer list
nnoremap <silent> <Leader>bk <Cmd>confirm bdelete<CR>

" Exit Vim. Bring up a prompt when some buffers have been changed
" nnoremap <silent> ZE <Cmd>confirm qall<CR>

" Insert date/time
inoremap <silent> <C-x>d <C-r>=strftime('%Y-%m-%d')<CR>
inoremap <silent> <C-x>c <C-r>=strftime('%c')<CR>
" RFC822 Format
inoremap <silent> <C-x>r <C-r>=strftime('%a, %d %b %Y %H:%M:%S %z')<CR>
" ISO8601 / W3C Format
inoremap <silent> <C-x>t <C-r>=strftime('%Y-%m-%dT%T%z')<CR>

" https://vimways.org/2018/death-by-a-thousand-files/
nnoremap <C-w>e :find **/*
nnoremap <C-w>E :edit **/*

" :help :DiffOrig
if exists(":DiffOrig") != 2
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man'
    runtime ftplugin/man.vim
endif

" Trim trailing whitespace
command! -bar -range=% TrimWhitespace silent execute (&readonly ? 'echo' : printf('keeppatterns keepjumps keepalt :%s,%ssubstitute/\s\+$//e', <line1>, <line2>))
nnoremap <silent> <Leader>bw <Cmd>TrimWhitespace<Bar>update<CR>
vnoremap <silent> <Leader>bw :TrimWhitespace<Bar>update<CR>gv

" Handle large file
let g:zero_vim_large_file = get(g:, 'zero_vim_large_file', 1024 * 1024 * 1) " 1 MB
let g:zero_vim_undoreload = &undoreload || 10000

function! s:HandleLargeFile() abort
    set eventignore-=FileType
    let &undoreload = g:zero_vim_undoreload
    let filename = expand('<afile>')
    let fsize = getfsize(filename)
    if filename =~# '[-_.]min\.\%(js\|css\|scss\)$' || fsize == -2 || fsize > g:zero_vim_large_file
        set eventignore+=FileType undoreload=0
        syntax clear
        setlocal noswapfile bufhidden=unload undolevels=-1 syntax=OFF filetype=
        setlocal nofoldenable foldmethod=manual nowrap nolist
    endif
endfunction

augroup MyAutoCmd
    autocmd BufReadPre * call <SID>HandleLargeFile()
augroup END

" Find project dir from buffer based on root markers
let g:zero_vim_file_root_markers = [
            \ 'Gemfile',
            \ 'rebar.config',
            \ 'mix.exs',
            \ 'Cargo.toml',
            \ 'shard.yml',
            \ 'go.mod',
            \ '.root',
            \ ]

let g:zero_vim_vcs_root_markers = [
            \ '.git',
            \ '.hg',
            \ '.svn',
            \ '.bzr',
            \ '_darcs',
            \ ]

let g:zero_vim_root_markers = g:zero_vim_vcs_root_markers + g:zero_vim_file_root_markers

let g:zero_vim_ignored_root_dirs = [
            \ '/',
            \ '/root',
            \ '/Users',
            \ '/home',
            \ '/usr',
            \ '/usr/local',
            \ '/opt',
            \ '/etc',
            \ '/var',
            \ expand('~'),
            \ ]

function! FindProjectDir(starting_dir) abort
    if empty(a:starting_dir)
        return ''
    endif

    let l:root_dir = ''

    for l:root_marker in g:zero_vim_root_markers
        if index(g:zero_vim_file_root_markers, l:root_marker) > -1
            let l:root_dir = findfile(l:root_marker, a:starting_dir . ';')
        else
            let l:root_dir = finddir(l:root_marker, a:starting_dir . ';')
        endif

        if l:root_dir == l:root_marker
            let l:root_dir = '.'
        else
            let l:root_dir = substitute(l:root_dir, l:root_marker . '$', '', '')
        endif

        if strlen(l:root_dir)
            let l:root_dir = fnamemodify(l:root_dir, ':p:h')
            break
        endif
    endfor

    if empty(l:root_dir) || index(g:zero_vim_ignored_root_dirs, l:root_dir) > -1
        if index(g:zero_vim_ignored_root_dirs, getcwd()) > -1
            let l:root_dir = a:starting_dir
        elseif stridx(a:starting_dir, getcwd()) == 0
            let l:root_dir = getcwd()
        else
            let l:root_dir = a:starting_dir
        endif
    endif

    let l:root_dir = fnamemodify(l:root_dir, ':p:h')

    return fnamemodify(l:root_dir, ':p:h:~')
endfunction

function! FindBufferProjectDir() abort
    return FindProjectDir(expand('%:p:h'))
endfunction

" <C-r><C-h>: Innsert buffer project dir
inoremap <C-r><C-h> <C-r>=FindBufferProjectDir()<CR>
cnoremap <C-r><C-h> <C-r>=FindBufferProjectDir()<CR>

" Setup mappings to open specific folders
let g:zero_vim_open_folder_mappings = get(g:, 'zero_vim_open_folder_mappings', {})

function s:SetupOpenFolderMappings() abort
    if exists(':CtrlP') == 2
        let l:cmd = 'CtrlP'
    elseif exists(':LeaderfFile') == 2
        let l:cmd = 'LeaderfFile'
    elseif exists(':ScopeFiles') == 2
        let l:cmd = 'ScopeFiles'
    else
        let l:cmd = 'Files'
    endif
    for [l:mapping, l:folder] in items(g:zero_vim_open_folder_mappings)
        execute printf('nnoremap <silent> %s :%s %s<CR>', l:mapping, l:cmd, l:folder)
    endfor
endfunction

augroup MyAutoCmd
    autocmd VimEnter * call <SID>SetupOpenFolderMappings()
augroup END

" Plugins
call plug#begin()

if exists('#User#ZeroVimPlugBegin')
    doautocmd <nomodeline> User ZeroVimPlugBegin
endif

" Startup {
    if Enabled('startuptime')
        " A plugin for profiling Vim and Neovim startup time.
        Plug 'dstein64/vim-startuptime'
    endif
" }

" UI {
    " Set cursor settings for iTerm.app, Kitty and Alacritty terminals
    Plug 'phongnh/vim-cursor-settings'

    if g:zero_vim_nerdfont
        " Fundemental plugin to handle Nerd Fonts in Vim
        Plug 'lambdalisue/vim-nerdfont'
        " An universal palette for Nerd Fonts
        Plug 'lambdalisue/vim-glyph-palette'
    endif

    if Enabled('statusline', 'crystalline')
        " My crystalline settings
        Plug 'phongnh/crystalline-settings.vim'
        " Build your own fancy statusline/tabline in Vim/Neovim
        Plug 'rbong/vim-crystalline'
    else
        " My lightline settings
        Plug 'phongnh/lightline-settings.vim'
        " A light and configurable statusline/tabline plugin for Vim
        Plug 'itchyny/lightline.vim'
    endif

    if Enabled('dashboard')
        " The fancy start screen for Vim
        Plug 'mhinz/vim-startify'
    endif
" }

" Explorer {
    if Enabled('buffer-explorer')
        " BufExplorer Plugin for Vim
        Plug 'jlanzarotta/bufexplorer'
    endif

    if Enabled('explorer', 'nerdtree')
        " A tree explorer plugin for vim
        Plug 'preservim/nerdtree'
    elseif Enabled('explorer') && has('patch-8.1.2269')
        " General purpose asynchrnonous tree viewer written in Pure Vim script
        Plug 'lambdalisue/vim-fern'
        " Make fern.vim as a default file explorer instead of Netrw
        Plug 'lambdalisue/vim-fern-hijack'
        " Mapping (h) to collapse or leave.
        Plug 'hrsh7th/fern-mapping-collapse-or-leave.vim'
        if Enabled('explorer', 'fern')
          " Add a file preview window to fern.vim.
          Plug 'yuki-yano/fern-preview.vim'
          if g:zero_vim_nerdfont
              " fern.vim plugin which add file type icon through nerdfont.vim
              Plug 'lambdalisue/vim-fern-renderer-nerdfont'
          endif
        endif
    endif
" }

" Fuzzy Finder {
    if Enabled('finder', 'CtrlP')
        if has('python3')
            if g:zero_vim_ctrlp_matcher ==? 'fruzzy'
                Plug 'raghur/fruzzy', { 'do': { -> fruzzy#install() } }
            elseif g:zero_vim_ctrlp_matcher ==? 'cpsm' && executable('cmake')
                Plug 'nixprime/cpsm', { 'do': 'env PY3=ON ./install.sh' }
            elseif g:zero_vim_ctrlp_matcher ==? 'cmatcher'
                Plug 'phongnh/ctrlp-cmatcher', { 'do': './install.sh' }
            endif
        endif

        " My CtrlP settings
        Plug 'phongnh/ctrlp-settings.vim'
        " Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.
        Plug 'ctrlpvim/ctrlp.vim'
        " Vim CtrlP plugin to switch between opened tabs
        Plug 'DavidEGx/ctrlp-smarttabs'
        " A super simple function navigator for ctrlp.vim
        Plug 'tacahiroy/ctrlp-funky'
        Plug 'mattn/ctrlp-register'
        " logging registers and reusing them.
        Plug 'LeafCage/yankround.vim', { 'on': 'CtrlPYankRound' }
        " Extension for ctrlp.vim, to have a command palette like sublime text 2
        Plug 'fisadev/vim-ctrlp-cmdpalette'
        " exec command from history via ctrlp
        Plug 'ompugao/ctrlp-history'
        Plug 'https://bitbucket.org/slimane/ctrlp-locationlist'
    elseif Enabled('finder', 'LeaderF') && has('python3')
        " My LeaderF settings
        Plug 'phongnh/leaderf-settings.vim'
        " An asynchronous fuzzy finder which is used to quickly locate files, buffers, mrus, tags, etc. in large project.
        Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    elseif Enabled('finder', 'scope') && v:version >= 901
        " Minimal, fast, and extensible fuzzy finder.
        Plug 'girishji/scope.vim'
    else
        " My fzf settings
        Plug 'phongnh/fzf-settings.vim'
        " A command-line fuzzy finder written in Go
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        " fzf ❤️ vim
        Plug 'junegunn/fzf.vim'
    endif
" }

" Search {
    " Helps you win at grep.
    Plug 'mhinz/vim-grepper'

    if Enabled('ctrlsf')
        " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
        Plug 'dyng/ctrlsf.vim'
    endif

    if Enabled('any-jump') && v:version >= 802 && executable('rg')
        " Jump to any definition and references IDE madness without overhead
        Plug 'pechorin/any-jump.vim', { 'on': ['AnyJump', 'AnyJumpVisual', 'AnyJumpBack', 'AnyJumpLastResults'] }
    endif

    if Enabled('sneak')
        " The missing motion for Vim
        Plug 'justinmk/vim-sneak'
    endif
" }

" Core {
    if Enabled('editorconfig')
        " EditorConfig plugin for Vim
        Plug 'editorconfig/editorconfig-vim'
    endif

    if Enabled('autoindent')
        " sleuth.vim: Heuristically set buffer options
        Plug 'tpope/vim-sleuth'
    endif

    " Make Vim handle line and column numbers in file names with a minimum of fuss
    Plug 'wsdjeg/vim-fetch'

    if exists("$TMUX")
        " Vim plugin for handling tmux panes.
        Plug 'jebaum/vim-tmuxify'
    endif

    " Helpers for UNIX
    Plug 'tpope/vim-eunuch'

    " Open URI with your favorite browser from your most favorite editor
    Plug 'tyru/open-browser.vim'

    " My Vim helpers
    Plug 'phongnh/zero.vim'

    " rsi.vim: Readline style insertion
    Plug 'tpope/vim-rsi'

    " Enable repeating supported plugin maps with "."
    Plug 'tpope/vim-repeat'

    " Pairs of handy bracket mappings
    Plug 'tpope/vim-unimpaired'

    " use CTRL-A/CTRL-X to increment dates, times, and more
    Plug 'tpope/vim-speeddating'

    if Enabled('quickfix', 'simple')
        " Open a Quickfix item in a window you choose. (Vim plugin)
        Plug 'yssl/QFEnter'
    else
        " Tame the quickfix window
        Plug 'romainl/vim-qf'
    endif
    if has('patch-8.2.3555')
        " Preview the quickfix item under the cursor in a popup window
        Plug 'bfrg/vim-qf-preview'
        " Navigate Vim's quickfix and location-list history using a popup menu
        Plug 'bfrg/vim-qf-history'
        " Highlight quickfix errors, and display error messages as virtual text or in a popup window
        Plug 'bfrg/vim-qf-diagnostics'
    endif

    " Maximize current buffer
    Plug 'phongnh/ZoomWin'

    " Master key for exiting or deleting nvim/vim buffers with respect to window splits and tabs.
    Plug 'marklcrns/vim-smartq'

    if Enabled('whitespace')
        " Better whitespace highlighting for vim
        Plug 'ntpeters/vim-better-whitespace'
    endif

    if Enabled('comment', 'caw')
        " Vim plugin: Define your own operator easily
        Plug 'kana/vim-operator-user'
        " Vim comment plugin: supported operator/non-operator mappings, repeatable by dot-command, 300+ filetypes
        Plug 'tyru/caw.vim'
    else
        " commentary.vim: comment stuff out
        Plug 'tpope/vim-commentary'
    endif

    if Enabled('surround')
        " quoting/parenthesizing made simple
        Plug 'tpope/vim-surround'
    else
        " The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
        Plug 'machakann/vim-sandwich'
    endif

    " A Vim alignment plugin
    Plug 'junegunn/vim-easy-align'

    if Enabled('change-case')
        " abolish.vim: Work with several variants of a word at once
        Plug 'tpope/vim-abolish'
    endif

    " Multiple cursors plugin for vim/neovim
    Plug 'mg979/vim-visual-multi'

    " A Narrow Region Plugin for vim (like Emacs Narrow Region)
    Plug 'chrisbra/NrrwRgn'

    " Easy text exchange operator for Vim
    Plug 'tommcdo/vim-exchange', { 'on': ['<Plug>(Exchange)', '<Plug>(ExchangeClear)', '<Plug>(ExchangeLine)'] }

    " A simple Vim plugin to switch segments of text with predefined replacements
    Plug 'andrewradev/switch.vim'

    " A vim plugin that simplifies the transition between multiline and single-line code
    Plug 'AndrewRadev/splitjoin.vim'

    " Weapon to fight against conflicts in Vim.
    Plug 'rhysd/conflict-marker.vim'

    " A better Vimdiff Git mergetool
    Plug 'whiteinge/diffconflicts', { 'on': ['DiffConflicts', 'DiffConflictsWithHistory'] }

    if has('diff') && !has('patch-8.1.0360')
        " Better Diff options for Vim
        Plug 'chrisbra/vim-diff-enhanced'
    endif
" }

" Text Objects {
    " Vim plugin: Create your own text objects
    Plug 'kana/vim-textobj-user'
    Plug 'glts/vim-textobj-comment'     " c

    if Enabled('textobj-indent')
        Plug 'kana/vim-textobj-indent'  " iI
    else
        " Vim plugin that defines a new text object representing lines of code at the same indent level.
        Plug 'michaeljsmith/vim-indent-object'  " iI
    endif

    " Vim plugin that provides additional text objects
    Plug 'wellle/targets.vim'
" }

" Editor {
    if Enabled('matchup')
        " vim match-up: even better %
        Plug 'andymass/vim-matchup'
    endif

    if Enabled('foldtext', 'readable')
        " A Vim plugin to improve foldtext for better looks
        Plug 'lambdalisue/vim-readablefold'
    elseif Enabled('foldtext', 'simple')
        " Custom vim folding function
        Plug 'jrudess/vim-foldtext', { 'as': 'jrudess-vim-foldtext' }
    elseif Enabled('foldtext')
        " Custom text for folded lines in vim
        Plug 'phongnh/vim-foldtext', { 'as': 'phongnh-vim-foldtext' }
    endif

    if Enabled('indent-guides')
        if has('conceal')
            " A vim plugin to display the indention levels with thin vertical lines
            Plug 'Yggdroot/indentLine'
        else
            " A Vim plugin for visually displaying indent levels in code
            Plug 'preservim/vim-indent-guides'
        endif
    endif

    if !has('patch-8.1.1270')
        " Show "Match 123 of 456 /search term/" in Vim searches
        Plug 'henrik/vim-indexed-search'
    endif
" }

" Distraction-free {
    " Distraction-free writing
    Plug 'junegunn/goyo.vim'

    " Hyperfocus-writing
    Plug 'junegunn/limelight.vim'
" }

" Undo history {
    if Enabled('undotree', 'mundo') && has('python3')
        " Vim undo tree visualizer
        Plug 'simnalamburt/vim-mundo'
    elseif Enabled('undotree', 'gundo') && has('python3')
        " Visualize your Vim undo tree
        Plug 'sjl/gundo.vim'
    elseif Enabled('undotree')
        " The ultimate undo history visualizer for VIM
        Plug 'mbbill/undotree'
    endif
" }

" Ctags {
    if executable(g:zero_vim_ctags_bin)
        if Enabled('ctags')
            " A Vim plugin that manages your tag files
            Plug 'ludovicchabant/vim-gutentags'
        endif

        if Enabled('tagbar')
            " A class outline viewer for Vim
            Plug 'preservim/tagbar'
        endif
    endif
" }

" Coding {
    " emmet for vim: http://emmet.io
    Plug 'mattn/emmet-vim', { 'on': ['<Plug>(emmet-expand-abbr)', '<Plug>(emmet-expand-word)', '<Plug>(emmet-anchorize-url)', '<Plug>(emmet-anchorize-summary)'] }

    " ragtag.vim: ghetto HTML/XML mappings
    Plug 'tpope/vim-ragtag', { 'for': ['html', 'eruby', 'eelixir', 'xml', 'vue', 'javascriptreact', 'typescriptreact'] }

    if Enabled('auto-pairs', 'lexima')
        " Auto close parentheses and repeat by dot dot dot...
        Plug 'cohama/lexima.vim'
    elseif Enabled('auto-pairs')
        " Vim plugin, insert or delete brackets, parens, quotes in pair
        Plug 'LunarWatcher/auto-pairs'
    endif

    if Enabled('completion', 'easycomplete') && v:version >= 802
        Plug 'jayli/vim-easycomplete'
        " Set of preconfigured snippets for different languages.
        Plug 'rafamadriz/friendly-snippets'
        " Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif Enabled('completion', 'phongnh-easycomplete') && v:version >= 802
        Plug 'phongnh/vim-easycomplete', { 'as': 'phongnh-vim-easycomplete', 'branch': 'test' }
        " Set of preconfigured snippets for different languages.
        Plug 'rafamadriz/friendly-snippets'
        " Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif Enabled('completion', 'asyncomplete') && has('timers')
        if Enabled('lsp')
            " async language server protocol plugin for vim and neovim
            Plug 'prabirshrestha/vim-lsp'
            Plug 'mattn/vim-lsp-settings'
            Plug 'prabirshrestha/asyncomplete-lsp.vim'
        endif
        " async completion in pure vim script for vim8 and neovim
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'phongnh/asyncomplete-buffer.vim', { 'as': 'phongnh-asyncomplete-buffer.vim' }
        Plug 'notuxic/asyncomplete-file.vim', { 'as': 'notuxic-asyncomplete-file.vim' }
        Plug 'notuxic/asyncomplete-tags.vim', { 'as': 'notuxic-asyncomplete-tags.vim' }
        " Set of preconfigured snippets for different languages.
        Plug 'rafamadriz/friendly-snippets'
        " Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif Enabled('completion', 'vimcomplete') && v:version >= 900
        if Enabled('lsp')
            " Language Server Protocol (LSP) plugin for Vim9
            Plug 'yegappan/lsp'
        endif
        " Set of preconfigured snippets for different languages.
        Plug 'rafamadriz/friendly-snippets'
        " Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
        " Async autocompletion for Vim.
        Plug 'girishji/vimcomplete'
        Plug 'girishji/ngram-complete.vim', { 'on': [] }
    elseif Enabled('completion')
        " Chained completion that works the way you want!
        Plug 'lifepillar/vim-mucomplete'
        " Set of preconfigured snippets for different languages.
        Plug 'rafamadriz/friendly-snippets'
        " Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
        if Enabled('lsp', 'lsc')
            " A vim plugin for communicating with a language server
            Plug 'natebosch/vim-lsc'
        elseif Enabled('lsp', 'yegappan-lsp') && has('patch-8.2.2342')
            " Language Server Protocol (LSP) plugin for Vim9
            Plug 'yegappan/lsp'
        elseif Enabled('lsp')
            " async language server protocol plugin for vim and neovim
            Plug 'prabirshrestha/vim-lsp'
            Plug 'mattn/vim-lsp-settings'
        endif
    endif
" }

" Formatting {
    if Enabled('formatting', 'autoformat') && has('python3')
        " Provide easy code formatting in Vim by integrating existing code formatters.
        Plug 'vim-autoformat/vim-autoformat', { 'on': 'Autoformat' }
    elseif Enabled('formatting')
        " A (Neo)vim plugin for formatting code.
        Plug 'sbdchd/neoformat'
    endif
" }

" Syntax Checking/Linting {
    if Enabled('linting', 'neomake') && has('job')
        " Asynchronous linting and make framework for Neovim/Vim
        Plug 'neomake/neomake'
    elseif Enabled('linting') && has('job')
        " Fix CursorHold Performance
        " https://github.com/neovim/neovim/issues/12587
        Plug 'antoinemadec/FixCursorHold.nvim'
        " Asynchronous Lint Engine
        Plug 'dense-analysis/ale'
    endif
" }

" Run your tests at the speed of thought
Plug 'vim-test/vim-test', { 'on': ['TestNearest', 'TestFile', 'TestLast', 'TestSuite', 'TestVisit'] }

" Git {
    if Enabled('github')
        " Open GitHub URL of current file, etc. from Vim editor (supported GitHub Enterprise)
        Plug 'tyru/open-browser-github.vim'
    endif

    if Enabled('git')
        " An awesome Git wrapper so awesome
        Plug 'tpope/vim-fugitive'
        " rhubarb.vim: GitHub extension for fugitive.vim
        Plug 'tpope/vim-rhubarb'
        " A git commit browser in Vim
        Plug 'junegunn/gv.vim', { 'on': 'GV' }
    endif

    if Enabled('git-messenger')
        " Vim and Neovim plugin to reveal the commit messages under the cursor
        Plug 'rhysd/git-messenger.vim'
    endif

    if Enabled('git-gutter', 'signify')
        " Show a diff via Vim sign column
        Plug 'mhinz/vim-signify'
    elseif Enabled('git-gutter')
        " Fix CursorHold Performance
        " https://github.com/neovim/neovim/issues/12587
        Plug 'antoinemadec/FixCursorHold.nvim'
        " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
        Plug 'airblade/vim-gitgutter'
    endif
" }

" Color schemes {
    " True Color
    Plug 'lifepillar/vim-solarized8'
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/everforest'
" }

if Enabled('which-key')
    " Vim plugin that shows keybindings in popup
    Plug 'liuchengxu/vim-which-key'
endif

" Syntax {
    " HTML5 omnicomplete and syntax
    Plug 'othree/html5.vim'
    " CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
    Plug 'hail2u/vim-css3-syntax'
    " JSX and TSX syntax pretty highlighting for vim.
    Plug 'MaxMEllon/vim-jsx-pretty'
    " A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
    Plug 'jparise/vim-graphql'
    " A vim text object for JSX attributes.
    Plug 'inside/vim-textobj-jsxattr' | Plug 'kana/vim-textobj-user'

    if EnabledGroup('web')
        " Yet Another TypeScript Syntax: The most advanced TypeScript Syntax Highlighting in Vim
        Plug 'HerringtonDarkholme/yats.vim'
        " Vastly improved Javascript indentation and syntax support in Vim.
        Plug 'pangloss/vim-javascript'
        " Generate JSDoc to your JavaScript code.
        Plug 'heavenshell/vim-jsdoc', { 'do': 'make install', 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
    endif

    if EnabledGroup('javascript')
        " A fork of pangloss/vim-javascript that removes flow support and adds TypeScript instead.
        Plug 'vieira/vim-javascript', { 'as': 'vieira-vim-javascript' }
        " Generate JSDoc to your JavaScript code.
        Plug 'heavenshell/vim-jsdoc', { 'do': 'make install', 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
    endif

    if EnabledGroup('js')
        " The most accurate syntax highlighting plugin for JavaScript and Flow.js
        Plug 'yuezk/vim-js'
        " Generate JSDoc to your JavaScript code.
        Plug 'heavenshell/vim-jsdoc', { 'do': 'make install', 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
    endif

    if EnabledGroup('yajs')
        " YAJS.vim: Yet Another JavaScript Syntax for Vim
        Plug 'othree/yajs.vim'
        " ES.Next syntax for Vim
        Plug 'othree/es.next.syntax.vim'
        " Syntax for JavaScript libraries
        Plug 'othree/javascript-libraries-syntax.vim'
        " Generate JSDoc to your JavaScript code.
        Plug 'heavenshell/vim-jsdoc', { 'do': 'make install', 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
    endif

    if EnabledGroup('rb')
        " Improved syntax highlighting and indentation for Ruby
        Plug 'jlcrochet/vim-ruby', { 'as': 'jlcrochet-vim-ruby' }
        " Syntax highlighting and indentation for Ruby Signature (RBS) files
        Plug 'jlcrochet/vim-rbs'
    elseif EnabledGroup('ruby')
        " Vim/Ruby Configuration Files
        Plug 'vim-ruby/vim-ruby'
        " Syntax plugin for RBS
        Plug 'pocke/rbs.vim'
    else
        " Syntax plugin for RBS
        Plug 'pocke/rbs.vim'
    endif

    " Ruby syntax extensions for highlighting YARD documentation.
    Plug 'noprompt/vim-yardoc'
    " Better rspec syntax highlighting for Vim
    Plug 'keith/rspec.vim'

    if EnabledGroup('rails')
        " projectionist.vim: Granular project configuration
        Plug 'tpope/vim-projectionist'
        " rake.vim: it's like rails.vim without the rails
        Plug 'tpope/vim-rake'
        " rails.vim: Ruby on Rails power tools
        Plug 'tpope/vim-rails'
    endif

    if EnabledGroup('rubocop')
        " The Vim RuboCop plugin runs RuboCop and displays the results in Vim
        Plug 'phongnh/vim-rubocop', { 'on': ['RuboCop', 'RuboCopProject'] }
    endif

    if EnabledGroup('reek')
        " Code smell detector for Ruby in Vim
        Plug 'phongnh/vim-reek', { 'on': 'RunReek' }
    endif

    if EnabledGroup('cr')
        " Improved Vim syntax highlighting and indentation for Crystal
        Plug 'jlcrochet/vim-crystal', { 'as': 'jlcrochet-vim-crystal' }
    else
        " Vim filetype and tools support for Crystal language.
        Plug 'vim-crystal/vim-crystal'
        " Vim plugin for Slang in Crystal
        Plug 'elorest/vim-slang'
    endif

    if EnabledGroup('go')
        " Go development plugin for Vim
        Plug 'fatih/vim-go'
        Plug 'zchee/vim-go-stdlib'  " go standard library syntax highlighting
    endif

    if EnabledGroup('rust')
        " Vim configuration for Rust.
        Plug 'rust-lang/rust.vim'
    endif

    if EnabledGroup('zig')
        " Vim configuration for Zig.
        Plug 'ziglang/zig.vim'
    endif

    " Support for V syntax highlighting in Vim
    Plug 'ollykel/v-vim'

    if EnabledGroup('erlang')
        " Erlang indentation and syntax for Vim
        Plug 'vim-erlang/vim-erlang-runtime'
        " Erlang syntax checking and compiler plugin for Vim
        Plug 'vim-erlang/vim-erlang-compiler'
        " Motions and text objects for erlang!
        Plug 'edkolev/erlang-motions.vim'
    endif

    " Vim configuration files for Elixir
    Plug 'elixir-editors/vim-elixir'
    " Make text objects with various elixir block structures.
    Plug 'andyl/vim-textobj-elixir' | Plug 'kana/vim-textobj-user'

    " basic vim/terraform integration
    Plug 'hashivim/vim-terraform'

    " Vim plugin provides syntax and filtetype detection for DBML (Database Markup Language) by dbml-lang.org
    Plug 'jidn/vim-dbml'
" }

if exists('#User#ZeroVimPlugEnd')
    doautocmd <nomodeline> User ZeroVimPlugEnd
endif

call plug#end()

" https://github.com/junegunn/vim-plug
" Run PlugInstall if there are missing plugins
augroup AutoPlugInstall
    autocmd!
    autocmd VimEnter *
                \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) > 0
                \ |     PlugInstall --sync | source $MYVIMRC
                \ | endif
augroup END

nnoremap <silent> <Leader>vv <Cmd>PlugUpdate<CR>

" https://github.com/antoinemadec/FixCursorHold.nvim
let g:cursorhold_updatetime = get(g:, 'cursorhold_updatetime', 250)

if Plugged('vim-nerdfont')
    " https://github.com/lambdalisue/vim-nerdfont
    let g:nerdfont#path#basename#customs = {
                \ '.code.ignore':        '',
                \ '.fdignore':           '',
                \ '.ignore':             '',
                \ 'ignore':              '',
                \ '.env.sample':         '',
                \ '.envrc':              '',
                \ '.vimrc.local':        '',
                \ 'vimrc.local':         '',
                \ '.editor.vimrc.local': '',
                \ '.init.lua.local':     '',
                \ 'init.lua.local':      '',
                \ '.editor.lua.local':   '',
                \ }

    let g:nerdfont#path#extension#customs = {
                \ 'vimrc': '',
                \ 'envrc': '',
                \ }

    if Plugged('vim-startify')
        " https://github.com/mhinz/vim-startify
        function! StartifyEntryFormat() abort
            return 'nerdfont#find(absolute_path) . "  " . entry_path'
        endfunction
    endif

    if Plugged('ctrlp.vim')
        " https://github.com/ctrlpvim/ctrlp.vim
        let g:ctrlp_formatline_func = 's:formatline(s:curtype() =~? "fil\\|mru" ? (nerdfont#find(v:val) . "  " . v:val) : v:val) '
    endif

    " https://github.com/lambdalisue/vim-glyph-palette
    augroup MyAutoCmd
        autocmd FileType startify,vaffle,fern call glyph_palette#apply()
    augroup END
endif

if Plugged('vim-crystalline')
    " https://github.com/rbong/vim-crystalline
    let g:crystalline_powerline_fonts = g:zero_vim_powerline_fonts
    let g:crystalline_powerline_style = get(g:, 'crystalline_powerline_style', g:zero_vim_powerline_style)
    let g:crystalline_show_devicons   = g:zero_vim_nerdfont
    let g:crystalline_show_git_branch = g:zero_vim_git_branch
endif

if Plugged('lightline.vim')
    " https://github.com/itchyny/lightline.vim
    let g:lightline_powerline_fonts = g:zero_vim_powerline_fonts
    let g:lightline_powerline_style = get(g:, 'lightline_powerline_style', g:zero_vim_powerline_style)
    let g:lightline_show_devicons   = g:zero_vim_nerdfont
    let g:lightline_show_git_branch = g:zero_vim_git_branch
endif

if Plugged('vim-startify')
    " https://github.com/mhinz/vim-startify
    let g:startify_skiplist = [
                \ '.git/index',
                \ '.git/config',
                \ 'fugitiveblame',
                \ 'COMMIT_EDITMSG',
                \ 'git-rebase-todo',
                \ escape(fnamemodify($VIMRUNTIME, ':p'), '\') . 'doc',
                \ ]

    let g:startify_enable_special     = 0
    let g:startify_change_to_dir      = 0
    let g:startify_change_to_vcs_root = 0
    let g:startify_relative_path      = 1
    let g:startify_update_oldfiles    = 1
    let g:startify_show_sessions      = 1
    let g:startify_custom_header      = [] " Disable random quotes header

    augroup MyAutoCmd
        autocmd User Startified setlocal buftype= nofoldenable foldcolumn=0
    augroup END
endif

if Plugged('bufexplorer')
    " https://github.com/jlanzarotta/bufexplorer
    let g:bufExplorerDisableDefaultKeyMapping = 1
    let g:bufExplorerShowDirectories          = 0
    let g:bufExplorerShowRelativePath         = 1

    nnoremap <silent> gb <Cmd>ToggleBufExplorer<CR>
endif

" Netrw
let g:netrw_banner    = 0
let g:netrw_liststyle = 0
let g:netrw_winsize   = -35
let g:netrw_preview   = 1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'

function! s:InitNetrw() abort
    nnoremap <buffer> <silent> <Plug>NetrwChgwinCheck <Cmd>let g:netrw_chgwin = get(t:, 'netrw_lexbufnr', -1) == bufnr() ? 2 : -1<CR>
    nnoremap <buffer> <silent> <nowait> <expr> gq printf("\<Cmd>%s\<CR>", tabpagenr('$') == 1 && tabpagewinnr(tabpagenr(), '$') == 1 ? 'SmartQ' : (get(t:, 'netrw_lexbufnr', -1) == bufnr() ? 'close' : 'silent! buffer #'))
    nnoremap <buffer> <silent> <nowait> <expr> gl printf("\<Cmd>%s\<CR>", get(t:, 'netrw_lexbufnr', -1) == bufnr() ? 'SmartQ' : 'silent! buffer #')
    nmap <buffer> <silent> <nowait> <CR> <Plug>NetrwChgwinCheck<Plug>NetrwLocalBrowseCheck
    nmap <buffer> qq gq
    nmap <buffer> q  gq
    nmap <buffer> H  u
    nmap <buffer> h  -^
    nmap <buffer> l  <CR>
endfunction

augroup MyAutoCmd
    autocmd FileType netrw call <SID>InitNetrw()
augroup END

nnoremap <silent> <Leader>e  <Cmd>Lexplore<CR>
nnoremap <silent> <Leader>E  <Cmd>Explore .<CR>
nnoremap <silent> <Leader>bf <Cmd>Explore<CR>

if Plugged('nerdtree')
    " https://github.com/preservim/nerdtree
    let g:NERDTreeWinSize             = 35
    let g:NERDTreeMinimalUI           = 1
    let g:NERDTreeMouseMode           = 2
    let g:NERDTreeMapChangeRoot       = '.' " Map . for changing root in NERDTree
    let g:NERDTreeQuitOnOpen          = 0
    let g:NERDTreeChDirMode           = 0
    let g:NERDTreeShowBookmarks       = 0
    let g:NERDTreeMarkBookmarks       = 0
    let g:NERDTreeDirArrowExpandable  = '+'
    let g:NERDTreeDirArrowCollapsible = '~'
    let g:NERDTreeBookmarksFile       = expand('~/.cache/vim/NERDTreeBookmarks')

    nnoremap <silent> <Leader>e  <Cmd>NERDTreeToggle<CR>
    noremap  <silent> <Leader>E  <Cmd>NERDTreeCWD<CR>
    nnoremap <silent> <Leader>bf <Cmd>NERDTreeFind<CR>
endif

if Plugged('vim-fern')
    " https://github.com/lambdalisue/vim-fern
    let g:fern#drawer_width              = 35
    let g:fern#disable_drawer_smart_quit = 1

    if Plugged('vim-fern-renderer-nerdfont')
        " https://github.com/lambdalisue/vim-fern-renderer-nerdfont
        let g:fern#renderer                  = 'nerdfont'
        let g:fern#renderer#nerdfont#leading = '  '
    else
        let g:fern#renderer#default#root_symbol      = "\u2302\u00a0"
        let g:fern#renderer#default#leading          = '  '
        let g:fern#renderer#default#leaf_symbol      = "\u00a0 "
        let g:fern#renderer#default#collapsed_symbol = '+ '
        let g:fern#renderer#default#expanded_symbol  = '~ '
    endif

    command! -nargs=? -complete=customlist,fern#internal#command#fern#complete FernDrawer Fern <args> -drawer
    command! -nargs=? -complete=customlist,fern#internal#command#fern#complete FernReveal Fern %:h -reveal=%:t <args>

    nnoremap <silent> <Leader>e  <Cmd>FernDrawer . -toggle<CR>
    nnoremap <silent> <Leader>E  :FernDrawer <C-r>=fnameescape(getcwd())<CR><CR>
    nnoremap <silent> <Leader>bf <Cmd>FernReveal -drawer<CR>

    function! s:InitFern() abort
        nnoremap <buffer> <silent> <Plug>(fern-action-quit) <Cmd>quit<CR>

        nmap <buffer> <Plug>(fern-action-reload!)
                    \ <Plug>(fern-action-reload:all)<Plug>(fern-action-redraw)

        nmap <buffer>          o <Plug>(fern-action-open-or-expand)
        nmap <buffer>          O <Plug>(fern-action-cd)
        nmap <buffer>          p <Plug>(fern-action-leave)
        nmap <buffer>          u <Plug>(fern-action-leave)
        nmap <buffer>          r <Plug>(fern-action-reload!)
        nmap <buffer>          I <Plug>(fern-action-hidden:toggle)
        nmap <buffer> <nowait> q <Plug>(fern-action-quit)

        nmap <buffer> <Leader>bf <Leader>e

        " https://github.com/hrsh7th/fern-mapping-collapse-or-leave.vim
        nmap <buffer> h <Plug>(fern-action-collapse-or-leave)

        if Plugged('fern-preview.vim')
            " https://github.com/yuki-yano/fern-preview.vim
            nnoremap <buffer> <silent> <Plug>(fern-action-scroll-up)   <C-u>
            nnoremap <buffer> <silent> <Plug>(fern-action-scroll-down) <C-d>

            nmap <buffer>        <C-p> <Plug>(fern-action-preview:toggle)
            nmap <buffer> <expr> <C-u> fern_preview#smart_preview("\<Plug>(fern-action-preview:scroll:up:half)", "\<Plug>(fern-action-scroll-up)")
            nmap <buffer> <expr> <C-d> fern_preview#smart_preview("\<Plug>(fern-action-preview:scroll:down:half)", "\<Plug>(fern-action-scroll-down)")

            nmap <buffer> <nowait> <expr> q fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", "\<Plug>(fern-action-quit)")
        endif
    endfunction

    augroup MyAutoCmd
        autocmd FileType fern call <SID>InitFern()
    augroup END
endif

if Plugged('ctrlp.vim')
    " https://github.com/ctrlpvim/ctrlp.vim
    let g:ctrlp_find_tool          = g:zero_vim_find_tool
    let g:ctrlp_find_no_ignore_vcs = g:zero_vim_find_no_ignore_vcs
    let g:ctrlp_follow_symlinks    = g:zero_vim_follow_links
    let g:ctrlp_buftag_ctags_bin   = g:zero_vim_ctags_bin
    let g:ctrlp_map                = '<Leader>f'

    if Plugged('fruzzy')
        " https://github.com/raghur/fruzzy
        let g:fruzzy#usenative = 1
        let g:fruzzy#sortonempty = 1
        let g:ctrlp_match_func = { 'match': 'fruzzy#ctrlp#matcher' }
    elseif Plugged('cpsm') && filereadable(g:plugs['cpsm'].dir . 'autoload/cpsm_py.so')
        " https://github.com/nixprime/cpsm
        let g:cpsm_query_inverting_delimiter = ' '
        let g:cpsm_match_empty_query = 0
        let g:cpsm_highlight_mode = 'basic'
        let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
    elseif Plugged('ctrlp-cmatcher') && filereadable(g:plugs['ctrlp-cmatcher'].dir . 'autoload/fuzzycomt.so')
        " https://github.com/phongnh/ctrlp-cmatcher
        let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
    elseif exists('*matchfuzzypos')
        let g:ctrlp_match_func = { 'match': 'ctrlp_settings#matcher#match' }
    endif

    command! -bar CtrlPSmartRoot execute 'CtrlP' FindBufferProjectDir()

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> yoa <Cmd>ToggleCtrlPFollowSymlinks<CR>

    nnoremap <silent> <Leader>a <Cmd>CtrlPAll<CR>
    nnoremap <silent> <C-p>     <Cmd>CtrlPSmartRoot<CR>
    nnoremap <silent> <Leader>p <Cmd>CtrlPRoot<CR>
    nnoremap <silent> <Leader>o <Cmd>CtrlPMRUFiles<CR>
    nnoremap <silent> <Leader>O <Cmd>CtrlPMRUCwdFiles<CR>
    nnoremap <silent> <Leader>d :<C-u>CtrlP <C-r>=expand('%' . repeat(':h', v:count1))<CR><CR>

    nnoremap <silent> <Leader>\ <Cmd>CtrlPTag<CR>

    nnoremap <silent> <Leader>q <Cmd>cclose<Bar>CtrlPQuickfix<CR>

    " Buffer-related mappings
    nnoremap <silent> <Leader>bb <Cmd>CtrlPBuffer<CR>
    nmap              <Leader>bd <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl <Cmd>CtrlPLine %<CR>
    nnoremap <silent> <Leader>bt <Cmd>CtrlPBufTag<CR>

    " https://github.com/DavidEGx/ctrlp-smarttabs
    nnoremap <silent> <C-w><C-a> <Cmd>CtrlPSmartTabs<CR>

    " https://github.com/tacahiroy/ctrlp-funky
    nnoremap <silent> <Leader>bo <Cmd>CtrlPFunky<CR>

    " https://github.com/mattn/ctrlp-register
    nnoremap <silent> <Leader>Y <Cmd>CtrlPRegister<CR>

    " https://github.com/LeafCage/yankround.vim
    let g:yankround_max_history = 100
    nnoremap <silent> <Leader>y <Cmd>CtrlPYankRound<CR>

    " https://github.com/fisadev/vim-ctrlp-cmdpalette
    nnoremap <silent> <Leader>; <Cmd>CtrlPCmdPalette<CR>

    " https://github.com/ompugao/ctrlp-history
    nnoremap <silent> <Leader>: <Cmd>CtrlPCmdHistory<CR>
    nnoremap <silent> <Leader>? <Cmd>CtrlPSearchHistory<CR>

    " https://github.com/slimane/ctrlp-locationlist
    nnoremap <silent> <Leader>l <Cmd>lclose<Bar>CtrlPLocationlist<CR>
endif

if Plugged('LeaderF')
    " https://github.com/Yggdroot/LeaderF
    let g:Lf_Powerline_Fonts = g:zero_vim_powerline_fonts
    let g:Lf_Powerline_Style = get(g:, 'Lf_Powerline_Style', g:zero_vim_powerline_style)
    let g:Lf_ShowDevIcons    = g:zero_vim_nerdfont
    let g:Lf_FindTool        = g:zero_vim_find_tool
    let g:Lf_FindNoIgnoreVCS = g:zero_vim_find_no_ignore_vcs
    let g:Lf_FollowLinks     = g:zero_vim_follow_links
    let g:Lf_GrepNoIgnoreVCS = g:zero_vim_grep_no_ignore_vcs
    let g:Lf_Ctags           = g:zero_vim_ctags_bin

    let g:Lf_ShortcutF = '<Leader>f'
    let g:Lf_ShortcutB = '<Leader>bb'

    command! -bar LeaderfFileSmartRoot execute 'LeaderfFile' FindBufferProjectDir()

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> yoa <Cmd>ToggleLeaderfFollowLinks<CR>

    nnoremap <silent> <Leader>a <Cmd>LeaderfFileAll<CR>
    nnoremap <silent> <C-p>     <Cmd>LeaderfFileSmartRoot<CR>
    nnoremap <silent> <Leader>p <Cmd>LeaderfFileRoot<CR>
    nnoremap <silent> <Leader>o <Cmd>LeaderfMru<CR>
    nnoremap <silent> <Leader>O <Cmd>LeaderfMruCwd<CR>
    nnoremap <silent> <Leader>d :<C-u>LeaderfFile <C-r>=expand('%' . repeat(':h', v:count1))<CR><CR>

    nnoremap <silent> <Leader>\ <Cmd>LeaderfTag<CR>

    " Buffer-related mappings
    nmap              <Leader>bd <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl <Cmd>LeaderfLine<CR>
    nnoremap <silent> <Leader>bt <Cmd>LeaderfBufTag<CR>

    nnoremap <silent> <C-w><C-a> <Cmd>LeaderfWindow<CR>

    nnoremap <silent> <Leader>bo <Cmd>LeaderfFunction<CR>

    nnoremap <silent> <Leader>; <Cmd>LeaderfCommand<CR>
    nnoremap <silent> <Leader>: <Cmd>LeaderfHistoryCmd<CR>
    nnoremap <silent> <Leader>? <Cmd>LeaderfHistorySearch<CR>

    nnoremap <silent> <Leader>q <Cmd>cclose<Bar>LeaderfQuickFix<CR>
    nnoremap <silent> <Leader>l <Cmd>lclose<Bar>LeaderfLocList<CR>

    nnoremap          <Leader>si :<C-u>Leaderf rg<Space>
    nnoremap <silent> <Leader>sc :<C-u>Leaderf rg --match-path <C-r>=zero#leaderf#CCword()<CR><CR>
    xnoremap <silent> <Leader>sc :<C-u>Leaderf rg --match-path <C-r>=zero#leaderf#Vword()<CR><CR>
    nnoremap <silent> <Leader>sm <Cmd>Leaderf rg --recall<CR>
    nnoremap <silent> <Leader>/  <Cmd>Leaderf rg --live<CR>
    xnoremap <silent> <Leader>/  :<C-u>Leaderf rg --match-path <C-r>=zero#leaderf#Vword()<CR><CR>
endif

if Plugged('scope.vim')
    " https://github.com/girishji/scope.vim
    let g:scope_find_tool          = g:zero_vim_find_tool
    let g:scope_find_no_ignore_vcs = g:zero_vim_find_no_ignore_vcs
    let g:scope_follow_links       = g:zero_vim_follow_links
    let g:scope_grep_no_ignore_vcs = g:zero_vim_grep_no_ignore_vcs

    " call scope#fuzzy#OptionsSet({
    "             \ 'find_echo_cmd': v:true,
    "             \ })

    call scope#popup#OptionsSet({
                \ 'emacsKey': v:true,
                \ })

    augroup MyAutoCmd
        autocmd VimEnter,VimResized * call scope#popup#OptionsSet({
                    \ 'maxheight': max([float2nr(&lines * 0.45), 15]),
                    \ 'maxwidth': max([float2nr(&columns * 0.75), 80]),
                    \ })
    augroup END

    function! s:BuildScopeFindCommand() abort
        let l:find_commands = {
                    \ 'fd': 'fd --type file --color never --hidden',
                    \ 'rg': 'rg --files --color never --ignore-dot --ignore-parent --hidden',
                    \ }
        let g:scope_find_command = l:find_commands[g:scope_find_tool ==# 'rg' ? 'rg' : 'fd']
        let g:scope_find_command .= g:scope_follow_links ? ' -L' : ''
        let g:scope_find_command .= g:scope_find_no_ignore_vcs ? ' --no-ignore-vcs' : ''
        return g:scope_find_command
    endfunction

    function! s:BuildScopeFindAllCommand() abort
        let l:find_all_commands = {
                    \ 'fd': 'fd --type file --color never --no-ignore --hidden --follow',
                    \ 'rg': 'rg --files --color never --no-ignore --hidden --follow',
                    \ }
        let g:scope_find_all_command = l:find_all_commands[g:scope_find_tool ==# 'rg' ? 'rg' : 'fd']
        return g:scope_find_all_command
    endfunction

    function! s:BuildScopeGrepCommand() abort
        let g:scope_grep_command = 'rg --color=never -H --no-heading -n --column -S --hidden --trim'
        " let g:scope_grep_command = 'rg --vimgrep --no-heading --smart-case'
        let g:scope_grep_command .= g:scope_follow_links ? ' -L' : ''
        let g:scope_grep_command .= g:scope_grep_no_ignore_vcs ? ' --no-ignore-vcs' : ''
        return g:scope_grep_command
    endfunction

    call s:BuildScopeFindCommand()
    call s:BuildScopeFindAllCommand()
    call s:BuildScopeGrepCommand()

    command! -bar ScopeRoot execute 'ScopeFiles' FindBufferProjectDir()
    command!-nargs=? -complete=dir ScopeFiles call scope#fuzzy#File(g:scope_find_command . ' . ' . fnameescape(<q-args>))
    command! -nargs=? -complete=dir ScopeAllFiles call scope#fuzzy#File(g:scope_find_all_command . ' . ' . fnameescape(<q-args>))
    command! -nargs=? -complete=dir ScopeGitFiles call scope#fuzzy#GitFile(fnameescape(<q-args>))
    command! -bang -nargs=? -complete=dir -range ScopeGrep call scope#fuzzy#Grep(g:scope_grep_command, v:true, <bang>0 ? '<cword>' : (<range> ? zero#Vword() : ''), fnameescape(<q-args>))

    function! s:ScopeGrepPrompt(...) abort
        let l:grep_opts = input('Grep Options: ', '')
        let l:pattern = input('Pattern: ', '')
        let l:dir = input('Dir: ', '', 'dir')
        call scope#fuzzy#Grep(g:scope_grep_command . ' ' . l:grep_opts, v:true, l:pattern, fnameescape(l:dir))
    endfunction

    command! -nargs=* ScopeGrepPrompt call <SID>ScopeGrepPrompt(<f-args>)

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> <Leader>f <Cmd>ScopeFiles<CR>
    nnoremap <silent> <Leader>a <Cmd>ScopeAllFiles<CR>
    nnoremap <silent> <C-p>     <Cmd>ScopeRoot<CR>
    nnoremap <silent> <Leader>p <Cmd>ScopeGitFiles<CR>
    nnoremap <silent> <Leader>o <Cmd>Scope MRU<CR>
    nnoremap <silent> <Leader>O <Cmd>Scope MRU<CR>
    nnoremap <silent> <Leader>d :<C-u>ScopeFiles <C-r>=expand('%' . repeat(':h', v:count1))<CR><CR>

    nnoremap <silent> <Leader>\ <Cmd>Scope Tag<CR>

    " Buffer-related mappings
    nmap              <Leader>bb <Cmd>Scope Buffer<CR>
    nmap              <Leader>bd <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl <Cmd>Scope BufSearch<CR>
    nnoremap <silent> <Leader>bt <Cmd>Scope Tag<CR>
    nnoremap <silent> <Leader>bo <Cmd>Scope Tag<CR>

    nnoremap <silent> <C-w><C-a> <Cmd>Scope Window<CR>

    nnoremap <silent> <Leader>; <Cmd>Scope Command<CR>
    nnoremap <silent> <Leader>: <Cmd>Scope CmdHistory<CR>

    nnoremap <silent> <Leader>' <Cmd>Scope Mark<CR>
    nnoremap <silent> <Leader>Y <Cmd>Scope Register<CR>

    nnoremap <silent> <Leader>q <Cmd>cclose<Bar>Scope Quickfix<CR>
    nnoremap <silent> <Leader>l <Cmd>lclose<Bar>Scope Loclist<CR>

    nnoremap <silent> <Leader>si <Cmd>ScopeGrep<CR>
    nnoremap <silent> <Leader>sc <Cmd>ScopeGrep!<CR>
    xnoremap <silent> <Leader>sc :ScopeGrep<CR>
    nnoremap <silent> <Leader>/  <Cmd>ScopeGrep<CR>
    xnoremap <silent> <Leader>/  :ScopeGrep<CR>
endif

if Plugged('fzf.vim')
    " https://github.com/junegunn/fzf
    " https://github.com/junegunn/fzf.vim
    let g:fzf_find_tool          = g:zero_vim_find_tool
    let g:fzf_find_no_ignore_vcs = g:zero_vim_find_no_ignore_vcs
    let g:fzf_follow_links       = g:zero_vim_follow_links
    let g:fzf_grep_no_ignore_vcs = g:zero_vim_grep_no_ignore_vcs
    let g:fzf_ctags_bin          = g:zero_vim_ctags_bin
    let g:fzf_ctags_ignore       = g:zero_vim_ctags_ignore

    command! -bang PFiles execute (<bang>0 ? 'Files!' : 'Files') FindBufferProjectDir()

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> yoa <Cmd>ToggleFzfFollowLinks<CR>

    nnoremap <silent> <Leader>f <Cmd>Files<CR>
    nnoremap <silent> <Leader>a <Cmd>AFiles<CR>
    nnoremap <silent> <C-p>     <Cmd>PFiles<CR>
    nnoremap <silent> <Leader>p <Cmd>GitFiles<CR>
    nnoremap <silent> <Leader>o <Cmd>Mru<CR>
    nnoremap <silent> <Leader>O <Cmd>MruCwd<CR>
    nnoremap <silent> <Leader>d :<C-u>Files <C-r>=expand('%' . repeat(':h', v:count1))<CR><CR>

    nnoremap <silent> <Leader>\ <Cmd>Tags!<CR>

    " Buffer-related mappings
    nnoremap <silent> <Leader>bb <Cmd>Buffers<CR>
    nmap              <Leader>bd <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl <Cmd>BLines<CR>
    nnoremap <silent> <Leader>bt <Cmd>BTags<CR>
    nnoremap <silent> <Leader>bo <Cmd>BOutline<CR>

    nnoremap <silent> <C-w><C-a> <Cmd>Windows<CR>

    nnoremap <silent> <Leader>; <Cmd>Commands<CR>
    nnoremap <silent> <Leader>: <Cmd>History:<CR>
    nnoremap <silent> <Leader>? <Cmd>History/<CR>

    nnoremap <silent> <Leader>' <Cmd>Marks<CR>
    nnoremap <silent> <Leader>Y <Cmd>Registers<CR>

    nnoremap <silent> <Leader>q <Cmd>Quickfix<CR>
    nnoremap <silent> <Leader>l <Cmd>LocationList<CR>

    nnoremap          <Leader>si :<C-u>RgRaw!<Space>
    nnoremap <silent> <Leader>sc :<C-u>RgRaw! -- <C-r>=zero#shell#CCword()<CR><CR>
    xnoremap <silent> <Leader>sc :<C-u>RgRaw! -- <C-r>=zero#shell#Vword()<CR><CR>
    nnoremap <silent> <Leader>/  <Cmd>Rg!<CR>
    xnoremap <silent> <Leader>/  :<C-u>RgRaw! -- <C-r>=zero#shell#Vword()<CR><CR>
endif

if Plugged('vim-grepper')
    " https://github.com/mhinz/vim-grepper
    let g:grepper = {
                \ 'open':                1,
                \ 'switch':              1,
                \ 'jump':                0,
                \ 'prompt':              1,
                \ 'prompt_mapping_tool': '<C-\>',
                \ 'stop':                2000,
                \ 'repo':                g:zero_vim_vcs_root_markers + g:zero_vim_file_root_markers,
                \ 'tools':               ['rg', 'git'],
                \ 'rg':                  { 'escape': '\^$.*+?()[]{}|-', 'grepformat': '%f:%l:%c:%m,%f:%l:%m' },
                \ }

    let g:grepper.rg.grepprg = 'rg -H --no-heading -n -S --hidden'
    let g:grepper.rg.grepprg .= g:zero_vim_follow_links ? ' -L' : ''
    let g:grepper.rg.grepprg .= g:zero_vim_grep_no_ignore_vcs ? ' --no-ignore-vcs' : ''

    command! -nargs=* -complete=customlist,grepper#complete PGrepper Grepper  -dir repo,filecwd,cwd <args>
    command! -nargs=* -complete=customlist,grepper#complete DGrepper Grepper  -dir file,repo,cwd <args>
    command! -nargs=* -complete=customlist,grepper#complete LGrepper Grepper  -noquickfix <args>
    command! -nargs=* -complete=customlist,grepper#complete BGrepper LGrepper -buffer <args>

    command! -bang -nargs=* -complete=customlist,grepper#complete        GrepperCCword  execute 'Grepper'  (<bang>0 ? '-noprompt' : '') '-cword' <q-args>
    command! -bang -nargs=* -complete=customlist,grepper#complete        GrepperCword   execute 'Grepper'  (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Cword()
    command! -bang -nargs=* -complete=customlist,grepper#complete        GrepperWord    execute 'Grepper'  (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Word()
    command! -bang -nargs=* -complete=customlist,grepper#complete -range GrepperVword   execute 'Grepper'  (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Vword()
    command! -bang -nargs=* -complete=customlist,grepper#complete        LGrepperCCword execute 'LGrepper' (<bang>0 ? '-noprompt' : '') '-cword' <q-args>
    command! -bang -nargs=* -complete=customlist,grepper#complete        LGrepperCword  execute 'LGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Cword()
    command! -bang -nargs=* -complete=customlist,grepper#complete        LGrepperWord   execute 'LGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Word()
    command! -bang -nargs=* -complete=customlist,grepper#complete -range LGrepperVword  execute 'LGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Vword()
    command! -bang -nargs=* -complete=customlist,grepper#complete        PGrepperCCword execute 'PGrepper' (<bang>0 ? '-noprompt' : '') '-cword' <q-args>
    command! -bang -nargs=* -complete=customlist,grepper#complete        PGrepperCword  execute 'PGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Cword()
    command! -bang -nargs=* -complete=customlist,grepper#complete        PGrepperWord   execute 'PGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Word()
    command! -bang -nargs=* -complete=customlist,grepper#complete -range PGrepperVword  execute 'PGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Vword()

    nnoremap <silent> <Leader>S  <Cmd>Grepper<CR>
    xnoremap <silent> <Leader>S  :GrepperVword<CR>
    nnoremap <silent> <Leader>s; <Cmd>GrepperCCword<CR>
    xnoremap <silent> <Leader>s; :GrepperVword<CR>
    nnoremap <silent> <Leader>ss <Cmd>GrepperCCword!<CR>
    xnoremap <silent> <Leader>ss :GrepperVword!<CR>
    nnoremap <silent> <Leader>s. <Cmd>GrepperWord!<CR>
    nnoremap <silent> <Leader>sg <Cmd>PGrepperCCword! -tool git -grepprg git grep -nIP<CR>
    xnoremap <silent> <Leader>sg :PGrepperVword! -tool git<CR>
    " Grepper with current buffer dir
    nnoremap <silent> <Leader>sd <Cmd>LGrepperCCword! -dir file,repo,cwd<CR>
    xnoremap <silent> <Leader>sd :LGrepperVword! -dir file,repo,cwd<CR>

    " Buffer search
    nnoremap <silent> <Leader>B  <Cmd>PGrepper -noquickfix<CR>
    xnoremap <silent> <Leader>B  :PGrepperVword -noquickfix<CR>
    nnoremap <silent> <Leader>b; <Cmd>PGrepperCCword -noquickfix<CR>
    xnoremap <silent> <Leader>b; :PGrepperVword -noquickfix<CR>
    nnoremap <silent> <Leader>bs <Cmd>PGrepperCCword! -noquickfix<CR>
    xnoremap <silent> <Leader>bs :PGrepperVword! -noquickfix<CR>
    nnoremap <silent> <Leader>b. <Cmd>PGrepperWord! -noquickfix<CR>
    nnoremap <silent> <Leader>bg <Cmd>PGrepperCCword! -noquickfix -tool git -grepprg git grep -nIP<CR>
    xnoremap <silent> <Leader>bg :PGrepperVword! -noquickfix -tool git<CR>
endif

if Plugged('ctrlsf.vim')
    " https://github.com/dyng/ctrlsf.vim
    let g:ctrlsf_default_root       = 'cwd' " project+fw
    let g:ctrlsf_extra_root_markers = ['.git', '.hg', '.svn', '.bzr', '_darcs', 'Gemfile', 'rebar.config', 'mix.exs', 'Cargo.toml', 'shard.yml', 'go.mod']
    let g:ctrlsf_follow_symlinks    = g:zero_vim_follow_links
    let g:ctrlsf_populate_qflist    = get(g:, 'ctrlsf_populate_qflist', 0)
    let g:ctrlsf_preview_position   = 'inside'
    let g:ctrlsf_auto_focus         = {
                \ 'at': 'start'
                \ }

    " Prefer rg
    if executable('rg')
        let g:ctrlsf_backend = 'rg'
        let g:ctrlsf_extra_backend_args = {
                    \ 'rg': g:zero_vim_grep_no_ignore_vcs ? '--no-ignore-vcs' : '',
                    \ }
    endif

    function! s:MoveCtrlSFMainWindow(position) abort
        let g:ctrlsf_position = a:position
        call ctrlsf#Quit() | call ctrlsf#Open()
        echo printf('CtrlSF Position: %s!', g:ctrlsf_position)
    endfunction

    function! s:SetupCtrlSFMainWindowMappings()
        nnoremap <buffer> <silent> <C-w>H <Cmd>call <SID>MoveCtrlSFMainWindow('left')<CR>
        nnoremap <buffer> <silent> <C-w>J <Cmd>call <SID>MoveCtrlSFMainWindow('bottom')<CR>
        nnoremap <buffer> <silent> <C-w>K <Cmd>call <SID>MoveCtrlSFMainWindow('top')<CR>
        nnoremap <buffer> <silent> <C-w>L <Cmd>call <SID>MoveCtrlSFMainWindow('right')<CR>
    endfunction

    function! s:PCtrlSF(...) abort
        try
            let l:current = g:ctrlsf_default_root
            let g:ctrlsf_default_root = 'project+fw'
            call ctrlsf#Search(join(a:000, ' '))
        finally
            let g:ctrlsf_default_root = l:current
        endtry
    endfunction

    command! -nargs=* -complete=customlist,ctrlsf#comp#Completion        CtrlSFCCword  execute 'CtrlSF' <q-args> zero#ctrlsf#CCword()
    command! -nargs=* -complete=customlist,ctrlsf#comp#Completion        CtrlSFCword   execute 'CtrlSF' <q-args> zero#ctrlsf#Cword()
    command! -nargs=* -complete=customlist,ctrlsf#comp#Completion        CtrlSFWord    execute 'CtrlSF' <q-args> zero#ctrlsf#Word()
    command! -nargs=* -complete=customlist,ctrlsf#comp#Completion -range CtrlSFVword   execute 'CtrlSF' <q-args> zero#ctrlsf#Vword()
    command! -nargs=* -complete=customlist,ctrlsf#comp#Completion        PCtrlSF       call <SID>PCtrlSF(<f-args>)
    command! -nargs=* -complete=customlist,ctrlsf#comp#Completion        PCtrlSFCCword call <SID>PCtrlSF(<q-args>, zero#ctrlsf#CCword())
    command! -nargs=* -complete=customlist,ctrlsf#comp#Completion        PCtrlSFCword  call <SID>PCtrlSF(<q-args>, zero#ctrlsf#Cword())
    command! -nargs=* -complete=customlist,ctrlsf#comp#Completion        PCtrlSFWord   call <SID>PCtrlSF(<q-args>, zero#ctrlsf#Word())
    command! -nargs=* -complete=customlist,ctrlsf#comp#Completion -range PCtrlSFVword  call <SID>PCtrlSF(<q-args>, zero#ctrlsf#Vword())

    cnoremap <C-r><C-i> <C-r>=zero#InsertInput()<CR>

    nnoremap          <Leader>F  :CtrlSF<Space>
    xnoremap          <Leader>F  :CtrlSFVword<Space>
    nnoremap <silent> <Leader>sf <Cmd>CtrlSFCCword<CR>
    xnoremap <silent> <Leader>sf :CtrlSFVword<CR>
    nnoremap <silent> <Leader>sw <Cmd>CtrlSFWord<CR>
    nnoremap <silent> <Leader>so <Cmd>CtrlSFToggle<CR>
    nnoremap <silent> <Leader>su <Cmd>CtrlSFUpdate<CR>
    " CtrlSF with current buffer project / repo
    nnoremap <silent> <Leader>sp <Cmd>PCtrlSFCCword<CR>
    xnoremap <silent> <Leader>sp :PCtrlSFVword<CR>

    augroup MyAutoCmd
        autocmd FileType ctrlsf call <SID>SetupCtrlSFMainWindowMappings()
    augroup END
endif

if Plugged('any-jump.vim')
    " https://github.com/pechorin/any-jump.vim
    " Disable default any-jump keybindings
    let g:any_jump_disable_default_keybindings = v:true

    " Any-jump window size & position options
    let g:any_jump_window_width_ratio  = 0.85
    let g:any_jump_window_height_ratio = 0.75
    let g:any_jump_window_top_offset   = 4

    " Hide Help section
    let g:any_jump_show_help_section = v:false

    " Disable search engine ignore vcs untracked files
    let g:any_jump_disable_vcs_ignore = v:false

    " Custom ignore files
    let g:any_jump_ignored_files = get(g:, 'any_jump_ignored_files', [])

    nnoremap <silent> <Leader>sa <Cmd>AnyJump<CR>
    xnoremap <silent> <Leader>sa :AnyJumpVisual<CR>
    nnoremap <silent> <Leader>sb <Cmd>AnyJumpBack<CR>
    nnoremap <silent> <Leader>sl <Cmd>AnyJumpLastResults<CR>
endif

if Plugged('vim-sneak')
    " https://github.com/justinmk/vim-sneak
    let g:sneak#label = 1

    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T
endif

" Vim 9.0.1799 and above comes bundled with a recent stable version of editorconfig-vim.
" https://github.com/editorconfig/editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

augroup MyAutoCmd
    autocmd FileType gitcommit let b:EditorConfig_disable = 1
augroup END

if Plugged('vim-tmuxify')
    " https://github.com/jebaum/vim-tmuxify
    let g:tmuxify_custom_command = 'tmux split-window -d -l 30%'
    let g:tmuxify_map_prefix     = '<Leader>m'
    let g:tmuxify_global_maps    = 1

    function! s:TmuxifySendKeys(keys, bang) abort
        let keys = empty(a:keys) ? input('TxSendKeys> ') : a:keys
        for key in split(keys)
            call tmuxify#pane_send_raw(key, a:bang)
        endfor
    endfunction

    " TxSendText: Send current line or selected lines
    command! -bar -bang -range TxSendText     <line1>,<line2>yank m | TxSend<bang>(@m)
    command! -bar -bang        TxSendBuffer   %TxSendText<bang>
    command! -bar -bang        TxSendLastText TxSend<bang>(@m)
    command! -bar -bang        TxSendClear    call tmuxify#pane_send(<q-bang>, 'clear')
    command! -bar -bang        TxSendQuit     call <SID>TmuxifySendKeys('C-u q C-u C-d C-u C-\ C-u', <q-bang>) | redraw!

    nnoremap <silent> <Leader>mf <Cmd>TxSendClear!<CR>
    nnoremap <silent> <Leader>md <Cmd>TxSendQuit!<CR>
    nnoremap <silent> <Leader>ma <Cmd>TxSendLastText!<CR>
    nnoremap <silent> <Leader>mi <Cmd>TxSend!<CR>
    nmap     <silent> <Leader>ml mm^vg_<Leader>ms`m
    nmap     <silent> <Leader>mv mmV<Leader>ms`m
    nmap     <silent> <Leader>mw mmviw<Leader>ms`m

    function! s:SetupTmuxify() abort
        " Overwrite TxClear and TxSendKey commands
        command!          -bar -bang TxClear   call <SID>TmuxifySendKeys('C-u C-l C-u', <q-bang>) | redraw!
        command! -nargs=? -bar -bang TxSendKey call <SID>TmuxifySendKeys(<q-args>, <q-bang>)

        " Overwrite <Leader>ms to send inner paragraph to Tmux pane
        nmap <silent> <Leader>ms mmvip<Leader>ms`m
    endfunction

    augroup MyAutoCmd
        autocmd VimEnter * call <SID>SetupTmuxify()
    augroup END
endif

" https://github.com/tpope/vim-eunuch
let g:eunuch_no_maps = 1

" https://github.com/tyru/open-browser.vim
let g:openbrowser_message_verbosity = 1
let g:openbrowser_allowed_schemes   = ['http', 'https', 'ftp']

if !empty($BROWSER)
    let g:openbrowser_browser_commands = [
                \ {
                \   'name': $BROWSER,
                \   'args': ['{browser}', '{uri}'],
                \ },
                \ ]
endif

let g:netrw_nogx = 1

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

if Plugged('QFEnter')
    " https://github.com/yssl/QFEnter
    let g:qfenter_autoclose = 0
    let g:qfenter_exclude_filetypes = ['netrw', 'dirvish', 'molder', 'nerdtree', 'fern', 'tagbar']

    let g:qfenter_keymap = {
                \ 'vopen': ['<C-v>'],
                \ 'hopen': ['<C-CR>', '<C-s>', '<C-x>'],
                \ 'topen': ['<C-t>'],
                \ }
endif

if Plugged('vim-qf')
    " https://github.com/romainl/vim-qf
    let g:qf_auto_open_quickfix = 0
    let g:qf_auto_open_loclist  = 0
    let g:qf_mapping_ack_style  = 1

    function! s:RemapQuickfixMappings() abort
        execute 'nnoremap <buffer> <silent> <expr> <C-v> ' . maparg('v', 'n')
        execute 'nnoremap <buffer> <silent>        <C-s> ' . maparg('s', 'n')
        execute 'nnoremap <buffer> <silent>        <C-x> ' . maparg('s', 'n')
        execute 'nnoremap <buffer> <silent>        <C-t> ' . maparg('t', 'n')
        nnoremap <buffer> v v
        nnoremap <buffer> t t
    endfunction

    augroup MyAutoCmd
        autocmd FileType qf call <SID>RemapQuickfixMappings()
    augroup end
endif

if Plugged('vim-qf-preview')
    " https://github.com/bfrg/vim-qf-preview
    let g:qfpreview = {
                \ 'height': 15,
                \ 'offset': 1,
                \ 'top': 'g',
                \ 'bottom': 'G',
                \ 'scrollup': "\<C-k>",
                \ 'scrolldown': "\<C-j>",
                \ 'halfpageup': "\<C-u>",
                \ 'halfpagedown': "\<C-d>",
                \ 'fullpageup': "\<C-b>",
                \ 'fullpagedown': "\<C-f>",
                \ 'next': "\<C-n>",
                \ 'previous': "\<C-p>",
                \ 'number': v:false,
                \ 'sign': {
                \   'text': '>>',
                \   'texthl': 'Search',
                \ },
                \ }

    augroup MyAutoCmd
        autocmd FileType qf nmap <buffer> p <Plug>(qf-preview-open)
    augroup END
endif

if Plugged('vim-qf-history')
    " https://github.com/bfrg/vim-qf-history
    let g:qfhistory = {
                \ 'padding': [0, 1, 0, 1],
                \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
                \ }

    function! s:SetupQuickfixMappingForHistory() abort
        if getwininfo(win_getid())[0]['loclist']
            nnoremap <buffer> <silent> <C-h> <Cmd>Lhistory<CR>
        else
            nnoremap <buffer> <silent> <C-h> <Cmd>Chistory<CR>
        endif
    endfunction

    augroup MyAutoCmd
        autocmd FileType qf call <SID>SetupQuickfixMappingForHistory()
        autocmd QuickFixCmdPost chistory cwindow
        autocmd QuickFixCmdPost lhistory lwindow
    augroup END
endif

if Plugged('vim-qf-diagnostics')
    " https://github.com/bfrg/vim-qf-diagnostics
    nmap <expr> go getwininfo(win_getid())[0]['loclist'] ? "\<Plug>(qf-diagnostics-popup-loclist)" : "\<Plug>(qf-diagnostics-popup-quickfix)"

    let g:qfdiagnostics = {
                \ 'popup_border': [1, 1, 1, 1],
                \ 'popup_borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
                \ }

    function! s:SetupQuickfixMappingForDiagnostics() abort
        if getwininfo(win_getid())[0]['loclist']
            nnoremap <buffer> <silent> D <Cmd>LDiagnosticsToggle<CR>
        else
            nnoremap <buffer> <silent> D <Cmd>DiagnosticsToggle<CR>
        endif
    endfunction

    augroup MyAutoCmd
        autocmd FileType qf call <SID>SetupQuickfixMappingForDiagnostics()
    augroup END
endif

if Plugged('ZoomWin')
    " https://github.com/phongnh/ZoomWin
    nmap <silent> <C-w>m     <Plug>ZoomWin
    vmap          <C-w>m     <Esc><C-w>mgv
    nmap          <Leader>bm <C-w>m
    vmap          <Leader>bm <C-w>m
endif

" https://github.com/marklcrns/vim-smartq
let g:smartq_default_mappings = 0
let g:smartq_no_exit          = 1

nmap <C-w>q     <Plug>(smartq_this_force)
nmap <Leader>bk <Plug>(smartq_this)

if Plugged('vim-better-whitespace')
    " https://github.com/ntpeters/vim-better-whitespace
    let g:better_whitespace_operator = ''
    let g:better_whitespace_enabled  = 1
    let g:strip_whitespace_on_save   = 0
    let g:strip_whitespace_confirm   = 0
    let g:strip_only_modified_lines  = 1

    let g:better_whitespace_filetypes_blacklist = [
                \ '',
                \ 'terminal',
                \ 'diff',
                \ 'git',
                \ 'gitcommit',
                \ 'ctrlsf',
                \ 'qf',
                \ 'help',
                \ 'markdown',
                \ 'fugitive',
                \ 'fugitiveblame',
                \ ]

    nnoremap <silent> yo<Space>  <Cmd>ToggleWhitespace<CR>
    nnoremap <silent> <Leader>bw <Cmd>StripWhitespace<CR><Cmd>update<CR>
    vnoremap <silent> <Leader>bw :StripWhitespace<CR><Cmd>update<CR>gv
endif

if Plugged('caw.vim')
    " https://github.com/tyru/caw.vim
    let g:caw_no_default_keymappings = 1

    nmap <silent> gc  <Plug>(caw:hatpos:toggle:operator)
    nmap <silent> gcc V<Plug>(caw:hatpos:toggle)
    xmap <silent> gc  <Plug>(caw:hatpos:toggle:operator)

    nmap <silent> gC  <Plug>(caw:zeropos:toggle:operator)
    xmap <silent> gC  <Plug>(caw:zeropos:toggle:operator)

    nmap <silent> gW  <Plug>(caw:wrap:toggle:operator)
    xmap <silent> gW  <Plug>(caw:wrap:toggle:operator)

    nmap <silent> gB  <Plug>(caw:box:comment:operator)
    xmap <silent> gB  <Plug>(caw:box:comment:operator)
endif

if Plugged('vim-surround')
    " https://github.com/tpope/vim-surround
    let g:surround_indent             = 1
    let g:surround_no_insert_mappings = 1
endif

" https://github.com/machakann/vim-sandwich
if Plugged('vim-sandwich')
    runtime! macros/sandwich/keymap/surround.vim

    let g:sandwich#recipes += [
                \ { 'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{'] },
                \ { 'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['['] },
                \ { 'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['('] },
                \ { 'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{'] },
                \ { 'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['['] },
                \ { 'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['('] },
                \ ]
endif

" https://github.com/junegunn/vim-easy-align
xmap <Enter> <Plug>(EasyAlign)

if Plugged('vim-abolish')
    " https://github.com/tpope/vim-abolish
    vmap ga <Plug>(abolish-coerce)

    nnoremap <Leader>V  :%Subvert//gc<Left><Left><Left>
    nnoremap <Leader>sv :%Subvert/<C-r><C-w>//gc<Left><Left><Left>

    xnoremap <Leader>V  :Subvert//gc<Left><Left><Left>
    xnoremap <Leader>sv "vy:%Subvert/<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>//gc<Left><Left><Left>

    " Search and Replace entries with same mappings in quickfix/locationlist with :cfdo and :lfdo
    function! s:SetupQuickfixMappingForSubvert() abort
        let l:cmd = ':silent ' . (getwininfo(win_getid())[0]['loclist'] ? 'lfdo' : 'cfdo')
        execute 'nnoremap <buffer> <Leader>V  '         . l:cmd . ' %Subvert//eg<Left><Left><Left>'
        execute 'nnoremap <buffer> <Leader>sv '         . l:cmd . ' %Subvert/<C-r><C-w>//eg<Left><Left><Left>'
        execute 'xnoremap <buffer> <Leader>sv ' . '"vy' . l:cmd . " %Subvert/<C-r>=substitute(escape(getreg('v'), '^$.*\\/~[]'), '\\n', '\\\\n', 'g')<CR>//eg<Left><Left><Left>"
        xmap <buffer> <Leader>V <Leader>sv
    endfunction

    augroup MyAutoCmd
        autocmd FileType qf call <SID>SetupQuickfixMappingForSubvert()
    augroup END
endif

" Autocompletion plugins should define these functions to integrate with vim-visual-multi plugin
function! MultipleCursorsStart() abort
endfunction

function! MultipleCursorsExit() abort
endfunction

" https://github.com/mg979/vim-visual-multi
let g:VM_custom_remaps = {
            \ '<C-p>': 'N',
            \ '<C-x>': 'q',
            \ '<C-c>': '<Esc>',
            \ }

nmap <nowait> <C-n> <Plug>(VM-Find-Under)
xmap <nowait> <C-n> <Plug>(VM-Find-Subword-Under)

function! VM_Start() abort
    doautocmd <nomodeline> User MultipleCursorsStart
endfunction

function! VM_Exit() abort
    doautocmd <nomodeline> User MultipleCursorsExit
endfunction

augroup MyAutoCmd
    autocmd User visual_multi_mappings imap <nowait> <buffer> <C-c> <Esc><Esc>
augroup end

" https://github.com/chrisbra/NrrwRgn
let g:nrrw_topbot_leftright  = 'belowright'
let g:nrrw_rgn_nomap_nr      = 1
let g:nrrw_rgn_nomap_Nr      = 1
let g:nrrw_rgn_resize_window = 'relative'
let g:nrrw_rgn_rel_min       = 50
let g:nrrw_rgn_rel_max       = 50

nmap <silent> <expr> <Leader>bn exists(':WR') == 2 ? "\<Cmd>WR!\<CR>" : "vip:NR\<CR>"
xmap <silent> <expr> <Leader>bn exists(':WR') == 2 ? "\<Cmd>WR!\<CR>" : ":NR\<CR>"

nmap <Leader>n <Leader>bn
xmap <Leader>n <Leader>bn

function! s:SetupNrrwRgn() abort
    if Plugged('vim-crystalline')
        command! -bang -range NR :<line1>,<line2>call nrrwrgn#NrrwRgn('', <q-bang>) | call crystalline#UpdateStatusline(win_getid())
    elseif Plugged('lightline.vim')
        command! -bang -range NR :<line1>,<line2>call nrrwrgn#NrrwRgn('', <q-bang>) | call lightline#update()
    endif
endfunction

augroup MyAutoCmd
    autocmd VimEnter * call <SID>SetupNrrwRgn()
augroup END

" https://github.com/tommcdo/vim-exchange
nmap cx  <Plug>(Exchange)
xmap X   <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

" https://github.com/andrewradev/switch.vim
let g:switch_mapping         = '+'
let g:switch_reverse_mapping = '_'

" https://github.com/AndrewRadev/splitjoin.vim
let g:splitjoin_split_mapping = 'gS'
let g:splitjoin_join_mapping  = 'gJ'

" https://github.com/wellle/targets.vim
let g:targets_nl = 'nl'

" Default seek ranges
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB Ab AB rb al rB Al bb aa bB Aa BB AA'

" Prefer multiline targets around cursor over distant targets within cursor line:
" let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

" Never seek backwards:
" let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr lb ar ab lB Ar aB Ab AB rb rB bb bB BB'

" Only seek if next/last targets touch current line:
" let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB Ab AB rb rB al Al'

" Only consider targets fully visible on screen:
" let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab rr rb bb ll al aa'

" Only consider targets around cursor:
" let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB'

" Only consider targets fully contained in current line:
" let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll'

augroup MyAutoCmd
    autocmd User targets#mappings#user call targets#mappings#extend({
                \ 'a': { 'argument': [ { 'o': '[{([]', 'c': '[])}]', 's': '[,;]' } ] },
                \ 'A': { 'argument': [ { 'o': '[{([]', 'c': '[])}]', 's': '[,;]' } ] },
                \ })
augroup END

if Plugged('vim-matchup')
    " https://github.com/andymass/vim-matchup
    let g:matchup_matchparen_enabled             = 1
    let g:matchup_matchparen_hi_surround_always  = get(g:, 'matchup_matchparen_hi_surround_always', 1)
    let g:matchup_matchparen_hi_background       = get(g:, 'matchup_matchparen_hi_background', 0)
    let g:matchup_matchparen_deferred            = 1
    let g:matchup_matchparen_deferred_show_delay = 100  " 50
    let g:matchup_matchparen_deferred_hide_delay = 500  " 700
    let g:matchup_matchparen_offscreen           = get(g:, 'matchup_matchparen_offscreen', {})  " { 'method': 'popup' }
    let g:matchup_matchparen_pumvisible          = 0
    let g:matchup_matchparen_nomode              = 'i'

    let g:matchup_matchpref = {
                \ 'html':  { 'tagnameonly': 1 },
                \ 'eruby': { 'tagnameonly': 1 },
                \ }

    " Use mappings that are easier to reach
    xmap ir i%
    omap ir i%
    xmap ar a%
    omap ar a%

    " Jump between matching words
    nmap g<Space> g%
    xmap g<Space> g%
    omap g<Space> g%

    " Jump to open and close words
    nmap [w [%
    xmap [w [%
    omap [w [%
    nmap ]w ]%
    xmap ]w ]%
    omap ]w ]%

    " Jump inside
    nmap z<Space> z%
    xmap z<Space> z%
    omap z<Space> z%

    function! s:ShowMatchupInfo() abort
        MatchupWhereAmI?
        let current = g:matchup_matchparen_hi_background
        try
            let g:matchup_matchparen_hi_background = 2
            call matchup#matchparen#highlight_surrounding()
        finally
            let g:matchup_matchparen_hi_background = current
        endtry
    endfunction
    command! ShowMatchupInfo call <SID>ShowMatchupInfo()

    nnoremap <silent> zz zz<Cmd>ShowMatchupInfo<CR>

    " Integrate with vim-visual-multi plugin
    augroup MyAutoCmd
        autocmd User MultipleCursorsStart NoMatchParen
        autocmd User MultipleCursorsExit DoMatchParen
    augroup END
endif

" https://github.com/jrudess/vim-foldtext
" https://github.com/phongnh/vim-foldtext
let g:FoldText_placeholder    = '<!>'
let g:FoldText_line           = 'L'
let g:FoldText_whole          = 'W'
let g:FoldText_level          = 'Z'
let g:FoldText_division       = '/'
let g:FoldText_multiplication = '*'
let g:FoldText_expansion      = ' . '

if Plugged('indentLine')
    " https://github.com/Yggdroot/indentLine
    let g:indentLine_enabled              = g:zero_vim_indent_guides
    let g:indentLine_fileTypeExclude      = ['help', 'startify', 'dirvish', 'molder', 'vaffle', 'nerdtree', 'fern', 'tagbar']
    let g:indentLine_first_char           = '│'
    let g:indentLine_char                 = '┊'
    let g:indentLine_leadingSpaceChar     = '·'
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_concealcursor        = &concealcursor
    let g:indentLine_conceallevel         = &conceallevel

    nnoremap <silent> <Leader>bi <Cmd>IndentLinesToggle<CR>
    vnoremap <silent> <Leader>bi <Cmd>IndentLinesToggle<CR>
endif

if Plugged('vim-indent-guides')
    " https://github.com/preservim/vim-indent-guides
    let g:indent_guides_enable_on_vim_startup = g:zero_vim_indent_guides
    let g:indent_guides_start_level           = 1
    let g:indent_guides_color_change_percent  = 3
    let g:indent_guides_exclude_filetypes     = ['help', 'startify', 'dirvish', 'molder', 'vaffle', 'nerdtree', 'fern', 'tagbar']
    let g:indent_guides_default_mapping       = 0

    nnoremap <silent> <Leader>bi <Cmd>IndentGuidesToggle<CR>
    vnoremap <silent> <Leader>bi <Cmd>IndentGuidesToggle<CR>
endif

" https://github.com/junegunn/goyo.vim
let g:goyo_width  = '70%'
let g:goyo_height = get(g:, 'goyo_height', '85%')
let g:goyo_linenr = 1

let g:goyo_mode_index = 0
let g:goyo_modes = [
            \ [g:goyo_width, g:goyo_height],
            \ [120, g:goyo_height],
            \ [100, g:goyo_height],
            \ [80, g:goyo_height],
            \ ]

function! s:GoyoCycleMode(direction) abort
    let g:goyo_mode_index += a:direction
    if g:goyo_mode_index >= len(g:goyo_modes)
        let g:goyo_mode_index = 0
    elseif g:goyo_mode_index < 0
        let g:goyo_mode_index = len(g:goyo_modes) - 1
    endif
    let l:goyo_mode = g:goyo_modes[g:goyo_mode_index]
    let [g:goyo_width, g:goyo_height] = l:goyo_mode
    let l:cmd = printf('Goyo %sx%s', g:goyo_width, g:goyo_height)
    echo l:cmd | execute l:cmd | redraw
endfunction

function! s:GoyoHooks(entered) abort
    if a:entered
        augroup GoyoHooks
            autocmd!
            autocmd WinResized * call feedkeys("\<Plug>(goyo-resize)")
        augroup END
    else
        augroup GoyoHooks
            autocmd!
        augroup END
        augroup! GoyoHooks
    endif
endfunction

function! s:GoyoMaps(state, entered) abort
    if a:entered
        let a:state['<C-w>r']     = maparg('<C-w>r',     'n', 0, 1)
        let a:state['<C-w><C-r>'] = maparg('<C-w><C-r>', 'n', 0, 1)
        let a:state['<C-w>o']     = maparg('<C-w>o',     'n', 0, 1)
        let a:state['<C-w><C-o>'] = maparg('<C-w><C-o>', 'n', 0, 1)
        let a:state['<C-w>m']     = maparg('<C-w>m',     'n', 0, 1)
        let a:state['<C-w>M']     = maparg('<C-w>M',     'n', 0, 1)
        nmap              <C-w>r     <C-w>=
        nmap              <C-w><C-r> <C-w>=
        nmap              <C-w>o     <Plug>(goyo-clph-close)<Plug>(goyo-resize)
        nmap              <C-w><C-o> <Plug>(goyo-clph-close)<Plug>(goyo-resize)
        nnoremap <silent> <C-w>m     <Cmd>call <SID>GoyoCycleMode(1)<CR>
        nnoremap <silent> <C-w>M     <Cmd>call <SID>GoyoCycleMode(-1)<CR>
    else
        for [k, v] in items(a:state)
            if empty(v)
                execute printf('silent! nunmap %s', k)
            elseif exists('*mapset')
                call mapset('n', 0, v)
            else
                execute printf('%s %s %s', v.noremap ? 'nnoremap' : 'nmap', v.lhs, v.rhs)
            endif
        endfor
    endif
endfunction

function! s:GoyoOptions(state, entered) abort
    if a:entered
        let a:state.cursorline = &cursorline
        let a:state.showmode   = &showmode
        let a:state.scrolloff  = &scrolloff
        set cursorline
        set showmode
        set scrolloff=999
    else
        let &cursorline = a:state.cursorline
        let &showmode   = a:state.showmode
        let &scrolloff  = a:state.scrolloff
    endif
endfunction

function! s:GoyoHighlight(...) abort
    highlight StatusLineNC cterm=bold
    highlight StatusLine cterm=NONE
endfunction

function! s:OnGoyoEnter() abort
    let s:goyo_state = { 'maps': {}, 'options': {} }
    call s:GoyoHooks(v:true)
    call s:GoyoMaps(s:goyo_state.maps, v:true)
    call s:GoyoOptions(s:goyo_state.options, v:true)
    call s:GoyoHighlight()
endfunction

function! s:OnGoyoLeave() abort
    call s:GoyoHooks(v:false)
    call s:GoyoMaps(s:goyo_state.maps, v:false)
    call s:GoyoOptions(s:goyo_state.options, v:false)
endfunction

augroup MyAutoCmd
    autocmd! User GoyoEnter nested call <SID>OnGoyoEnter()
    autocmd! User GoyoLeave nested call <SID>OnGoyoLeave()
augroup END

nnoremap <silent> <Plug>(goyo-clph-close) <Cmd>cclose<Bar>lclose<Bar>pclose<Bar>helpclose<CR>

nnoremap <silent> <Leader><Enter> <Cmd>Goyo<CR>
vnoremap <silent> <Leader><Enter> <Cmd>Goyo<CR>gv

" <C-w><C-m>
nnoremap <silent> <C-w><Enter> <Cmd>Goyo<CR>
vnoremap <silent> <C-w><Enter> <Cmd>Goyo<CR>gv

" https://github.com/junegunn/limelight.vim
let g:limelight_conceal_ctermfg     = 240
let g:limelight_conceal_guifg       = '#777777'
let g:limelight_default_coefficient = get(g:, 'limelight_default_coefficient', 0.5)
let g:limelight_priority            = -1

nnoremap <silent> <Leader>L <Cmd>Limelight!!<CR>
xmap              <Leader>L <Plug>(Limelight)

if Plugged('vim-mundo')
    " https://github.com/simnalamburt/vim-mundo
    let g:mundo_prefer_python3 = 1
    let g:mundo_right          = 1
    let g:mundo_width          = 30
    let g:mundo_preview_bottom = 1
    let g:mundo_preview_height = 18
    let g:mundo_auto_preview   = 1

    nnoremap <silent> <Leader>U <Cmd>MundoToggle<CR>
endif

if Plugged('gundo.vim')
    " https://github.com/sjl/gundo.vim
    let g:gundo_prefer_python3 = 1
    let g:gundo_right          = 1
    let g:gundo_width          = 30
    let g:gundo_preview_bottom = 1
    let g:gundo_preview_height = 18
    let g:gundo_auto_preview   = 1

    nnoremap <silent> <Leader>U <Cmd>GundoToggle<CR>
endif

if Plugged('undotree')
    " https://github.com/mbbill/undotree
    let g:undotree_SplitWidth         = 35
    let g:undotree_WindowLayout       = 4
    let g:undotree_SetFocusWhenToggle = 1
    let g:undotree_ShortIndicators    = 1

    nnoremap <silent> <Leader>U <Cmd>UndotreeToggle<CR>
endif

if Plugged('vim-gutentags')
    " https://github.com/ludovicchabant/vim-gutentags
    " Enable only ctags module
    let g:gutentags_modules = ['ctags']

    " Generate datebases in my cache directory, prevent gtags files polluting my project
    let g:gutentags_cache_dir           = expand('~/.cache/vim/gutentags')
    let g:gutentags_ctags_executable    = g:zero_vim_ctags_bin

    " Universal Ctags
    if filereadable(g:zero_vim_ctags_ignore)
        let g:gutentags_ctags_exclude = [ '@' . g:zero_vim_ctags_ignore ]
    endif

    " Ignored directories
    let g:gutentags_exclude_project_root = [
                \ expand('~/.vim/plugged'),
                \ expand('~/src'),
                \ $HOME,
                \ '/etc',
                \ '/opt',
                \ '/usr',
                \ '/var',
                \ ]

    " Ignored file types
    let g:gutentags_exclude_filetypes = [
                \ 'html',
                \ 'xml',
                \ 'css',
                \ 'sass',
                \ 'scss',
                \ 'coffee',
                \ 'less',
                \ 'eruby',
                \ 'haml',
                \ 'hamlc',
                \ 'text',
                \ 'git',
                \ 'gitcommit',
                \ 'gitrebase',
                \ 'fugitiveblame',
                \ ]

    " Define advanced commands
    let g:gutentags_define_advanced_commands = 1
endif

if Plugged('tagbar')
    " https://github.com/preservim/tagbar
    let g:tagbar_sort         = 0
    let g:tagbar_silent       = 0
    let g:tagbar_show_balloon = 0
    let g:tagbar_autofocus    = 1
    let g:tagbar_autoclose    = 0
    let g:tagbar_iconchars    = ['+', '~']
    let g:tagbar_ctags_bin    = g:zero_vim_ctags_bin

    nnoremap <silent> <Leader>T <Cmd>TagbarToggle<CR>
endif

" https://github.com/mattn/emmet-vim
let g:emmet_install_only_plug = 1
let g:user_emmet_mode = 'i'

imap <silent> <C-x>, <Plug>(emmet-expand-abbr)
imap <silent> <C-x>; <Plug>(emmet-expand-word)
imap <silent> <C-x>a <Plug>(emmet-anchorize-url)
imap <silent> <C-x>A <Plug>(emmet-anchorize-summary)

function! s:CR() abort
    return "\<CR>"
endfunction

if Plugged('lexima.vim')
    " https://github.com/cohama/lexima.vim
    let g:lexima_accept_pum_with_enter = 1
    let g:lexima_ctrlh_as_backspace    = 1

    " https://github.com/cohama/lexima.vim/issues/65
    call lexima#set_default_rules()
    call lexima#insmode#map_hook('before', '<CR>', '')

    function! s:CR() abort
        " <C-g>u: Break undo sequence when a new line is inserted
        return "\<C-g>u" . lexima#expand('<CR>', 'i')
    endfunction

    " Integrate with vim-visual-multi plugin
    augroup MyAutoCmd
        autocmd User MultipleCursorsStart let b:lexima_disabled = 1
        autocmd User MultipleCursorsExit let b:lexima_disabled = 0
    augroup END
endif

if Plugged('auto-pairs')
    " https://github.com/LunarWatcher/auto-pairs
    let g:AutoPairsCompatibleMaps         = 0
    let g:AutoPairsFlyMode                = 0
    let g:AutoPairsDefaultDisableKeybinds = 1
    let g:AutoPairsMapCR                  = 0

    function! s:CR() abort
        " <C-g>u: Break undo sequence when a new line is inserted
        return "\<C-g>u\<CR>\<Plug>AutoPairsReturn"
    endfunction
endif

" LSP Settings
let g:zero_vim_lsp_diagnostics          = get(g:, 'zero_vim_lsp_diagnostics',          0)
let g:zero_vim_lsp_highlight_references = get(g:, 'zero_vim_lsp_highlight_references', 0)

" Signs
let g:zero_vim_lsp_signs = extend({
            \ 'error':         'E>',
            \ 'warning':       'W>',
            \ 'information':   'I>',
            \ 'hint':          'H>',
            \ 'message':       'M>',
            \ 'virtual_text':  '<!>',
            \ }, get(g:, 'zero_vim_lsp_signs', {}))

" Available Language Servers
let g:zero_vim_available_language_servers = {
            \ 'efm-langserver': {
            \   'cmd': ['efm-langserver'],
            \   'filetypes': ['sh', 'json', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'yaml', 'ruby', 'elixir', 'dockerfile'],
            \ },
            \ 'deno': {
            \   'cmd': ['deno', 'lsp'],
            \   'filetypes': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
            \ },
            \ 'typescript-language-server': {
            \   'cmd': ['typescript-language-server', '--stdio'],
            \   'filetypes': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
            \ },
            \ 'pylsp': {
            \   'cmd': ['pylsp'],
            \   'filetypes': ['python'],
            \ },
            \ 'pylyzer': {
            \   'cmd': ['pylyzer', '--server'],
            \   'filetypes': ['python'],
            \   'root_markers': ['setup.py', 'tox.ini', 'requirements.txt', 'Pipfile', 'pyproject.toml'],
            \   'workspace_config': {
            \       'python': {
            \         'diagnostics':     v:true,
            \         'inlayHints':      v:true,
            \         'smartCompletion': v:true,
            \         'checkOnType':     v:false,
            \       },
            \   },
            \ },
            \ 'pyre': {
            \   'cmd': ['pyre', 'persistent'],
            \   'filetypes': ['python'],
            \   'root_markers': ['.pyre_configuration'],
            \ },
            \ 'pyright': {
            \   'cmd': ['pyright-langserver', '--stdio'],
            \   'filetypes': ['python'],
            \   'workspace_config': {
            \     'python': {
            \       'analysis': {
            \         'autoSearchPaths':        v:true,
            \         'useLibraryCodeForTypes': v:true,
            \         'diagnosticMode':         'openFilesOnly',
            \       },
            \     },
            \   },
            \ },
            \ 'ruby-lsp': {
            \   'cmd': ['ruby-lsp'],
            \   'filetypes': ['ruby'],
            \   'initialization_options': {
            \       'experimentalFeaturesEnabled': 'false',
            \       'enabledFeatures': [
            \           'codeActions',
            \           'codeLens',
            \           'completion',
            \           'definition',
            \           'diagnostics',
            \           'documentHighlights',
            \           'documentLink',
            \           'documentSymbols',
            \           'foldingRanges',
            \           'formatting',
            \           'hover',
            \           'inlayHint',
            \           'onTypeFormatting',
            \           'selectionRanges',
            \           'semanticHighlighting',
            \       ],
            \       'formatter': 'auto',
            \   },
            \   'root_markers': ['Gemfile'],
            \ },
            \ 'solargraph': {
            \   'cmd': ['solargraph', 'stdio'],
            \   'filetypes': ['ruby'],
            \   'initialization_options': { 'diagnostics': 'true' },
            \   'root_markers': ['Gemfile'],
            \ },
            \ 'sorbet': {
            \   'cmd': ['srb', 'tc', '--lsp'],
            \   'filetypes': ['ruby'],
            \   'root_markers': ['Gemfile'],
            \ },
            \ 'crystalline': {
            \   'cmd': ['crystalline'],
            \   'filetypes': ['crystal'],
            \   'root_markers': ['shard.yml'],
            \ },
            \ 'gopls': {
            \   'cmd': ['gopls'],
            \   'filetypes': ['go'],
            \ },
            \ 'golangci-lint-langserver': {
            \   'cmd': ['golangci-lint-langserver'],
            \   'filetypes': ['go'],
            \ },
            \ 'rust-analyzer': {
            \   'cmd': ['rust-analyzer'],
            \   'filetypes': ['rust'],
            \ },
            \ 'erlang-ls': {
            \   'cmd': ['erlang-ls'],
            \   'filetypes': ['erlang'],
            \   'root_markers': ['rebar.config'],
            \ },
            \ 'elixir-ls': {
            \   'cmd': ['elixir-ls'],
            \   'filetypes': ['elixir'],
            \   'root_markers': ['mix.exs'],
            \ },
            \ 'terraform-ls': {
            \   'cmd': ['terraform-ls', 'serve'],
            \   'filetypes': ['terraform'],
            \ },
            \ 'vim-language-server': {
            \   'cmd': ['vim-language-server', '--stdio'],
            \   'filetypes': ['vim'],
            \ },
            \ 'lua-language-server': {
            \   'cmd': ['lua-language-server'],
            \   'filetypes': ['lua'],
            \   'workspace_config': {
            \       'Lua': {
            \           'color': {
            \               'mode': 'Semantic'
            \           },
            \           'completion': {
            \               'callSnippet':    'Disable',
            \               'enable':         v:true,
            \               'keywordSnippet': 'Replace'
            \           },
            \           'develop': {
            \               'debuggerPort': 11412,
            \               'debuggerWait': v:false,
            \               'enable':       v:false
            \           },
            \           'diagnostics': {
            \               'enable':   v:true,
            \               'globals':  '',
            \               'severity': {}
            \           },
            \           'hover': {
            \               'enable':        v:true,
            \               'viewNumber':    v:true,
            \               'viewString':    v:true,
            \               'viewStringMax': 1000
            \           },
            \           'runtime': {
            \               'path': ['?.lua', '?/init.lua', '?/?.lua'],
            \               'version': 'Lua 5.3'
            \           },
            \           'signatureHelp': {
            \               'enable': v:true
            \           },
            \           'workspace': {
            \               'ignoreDir': [],
            \               'maxPreload': 1000,
            \               'preloadFileSize': 100,
            \               'useGitIgnore': v:true
            \           },
            \       },
            \   },
            \   'semantic_highlight': {},
            \   'root_markers': ['.stylua.toml', 'stylua.toml'],
            \ },
            \ }

" Language Servers
let g:zero_vim_language_servers = extend(
            \ deepcopy(g:zero_vim_available_language_servers),
            \ get(g:, 'zero_vim_language_servers', {})
            \ )

function! s:InitLanguageServers() abort
    for [l:name, l:server] in items(deepcopy(g:zero_vim_language_servers))
        let l:default = deepcopy(get(g:zero_vim_available_language_servers, l:name, {}))
        if type(l:server) == v:t_dict
            let g:zero_vim_language_servers[l:name] = extend(l:default, l:server)
        elseif type(l:server) == v:t_list
            let g:zero_vim_language_servers[l:name] = extend(l:default, { 'cmd': l:server })
        elseif type(l:server) == v:t_string
            let g:zero_vim_language_servers[l:name] = extend(l:default, { 'cmd': split(l:server) })
        endif
    endfor
endfunction

call s:InitLanguageServers()

function! s:MergeLanguageServers(language_servers) abort
    for [l:name, l:server] in items(deepcopy(a:language_servers))
        if has_key(g:zero_vim_language_servers, l:name)
            let l:default = deepcopy(get(g:zero_vim_language_servers, l:name, {}))
            let g:zero_vim_language_servers[l:name] = extend(l:default, l:server)
        endif
    endfor
endfunction

" Enabled Language Servers
let g:zero_vim_enabled_language_servers = filter(
            \ get(g:, 'zero_vim_enabled_language_servers', []),
            \ 'has_key(g:zero_vim_language_servers, v:val)'
            \ )

if Plugged('vim-lsc')
    " https://github.com/natebosch/vim-lsc
    let g:lsc_enable_autocomplete  = get(g:, 'lsc_enable_autocomplete', v:false)
    let g:lsc_autocomplete_length  = 1
    let g:lsc_enable_diagnostics   = g:zero_vim_lsp_diagnostics ? v:true : v:false
    let g:lsc_reference_highlights = g:zero_vim_lsp_highlight_references ? v:true : v:false
    let g:lsc_trace_level          = 'off'

    let g:lsc_server_commands = {}

    function! s:SetupLanguageServers() abort
        " Default server options
        let l:lsc_server_default_opts = {
                    \ 'log_level':        -1,
                    \ 'suppress_stderr':  v:true,
                    \ 'workspace_config': {},
                    \ }

        for l:name in g:zero_vim_enabled_language_servers
            let l:server = g:zero_vim_language_servers[l:name]
            let l:default = copy(l:lsc_server_default_opts)

            let l:message_hooks = {}

            if has_key(l:server, 'initialization_options')
                let l:message_hooks['initialize'] = {
                            \ 'initializationOptions': l:server['initialization_options'],
                            \ }
            endif

            let l:server_settings = extend(l:default, {
                        \ 'name':          l:name,
                        \ 'command':       l:server['cmd'],
                        \ 'message_hooks': l:message_hooks,
                        \ })

            for ft in l:server['filetypes']
                if !has_key(g:lsc_server_commands, ft)
                    let g:lsc_server_commands[ft] = l:server_settings
                endif
            endfor
        endfor
    endfunction

    call s:SetupLanguageServers()

    let g:lsc_auto_map = {
                \ 'GoToDefinition':      'g]',
                \ 'GoToDefinitionSplit': ['<C-w>]', '<C-w><C-]>'],
                \ 'FindReferences':      'gr',
                \ 'NextReference':       '[r',
                \ 'PreviousReference':   ']r',
                \ 'FindImplementations': 'gI',
                \ 'FindCodeActions':     'g<CR>',
                \ 'Rename':              'gr',
                \ 'ShowHover':           'K',
                \ 'DocumentSymbol':      'gO',
                \ 'WorkspaceSymbol':     'gW',
                \ 'SignatureHelp':       'gm',
                \ 'Completion':          'omnifunc',
                \ }

    function! s:LSClientServerStatus(...) abort
        let info = []
        for server in lsc#server#current()
            call add(info, printf('%s: %s!', server['config'].name, server['status']))
        endfor
        echo join(info, ' | ')
    endfunction

    command! LSClientServerStatus call <SID>LSClientServerStatus()

    function! s:SetupLSC() abort
        if !has_key(g:lsc_server_commands, &filetype)
            return
        endif
        nnoremap <buffer> <silent> gL <Cmd>LSClientAllDiagnostics<CR>
        nnoremap <buffer> <silent> gK <Cmd>LSClientWindowDiagnostics<CR>
    endfunction

    augroup MyAutoCmd
        autocmd BufNewFile,BufReadPost * call <SID>SetupLSC()
    augroup END
endif

if Plugged('lsp')
    " https://github.com/yegappan/lsp
    function! s:SetupLanguageServers() abort
        let g:lsp_servers = []

        let l:omnicompl = Plugged('vimcomplete') ? v:false : v:true

        for l:name in g:zero_vim_enabled_language_servers
            let l:server = g:zero_vim_language_servers[l:name]
            let l:filetypes = l:server['filetypes']
            let l:cmd = l:server['cmd']

            let l:lsp_server = {
                        \ 'name':      l:name,
                        \ 'filetype':  l:filetypes,
                        \ 'path':      l:cmd[0],
                        \ 'args':      l:cmd[1:-1],
                        \ 'omnicompl': l:omnicompl,
                        \ 'syncInit':  v:true,
                        \ }


            if has_key(l:server, 'initialization_options')
                let l:lsp_server['initializationOptions'] = l:server['initialization_options']
            endif

            call add(g:lsp_servers, l:lsp_server)
        endfor

        call LspOptionsSet({
                    \ 'autoComplete': v:false,
                    \ 'autoHighlight': g:zero_vim_lsp_highlight_references ? v:true : v:false,
                    \ 'autoPopulateDiags': g:zero_vim_lsp_diagnostics ? v:true : v:false,
                    \ 'hoverInPreview': v:true,
                    \ 'noNewlineInCompletion': v:true,
                    \ 'vsnipSupport': v:false,
                    \ })
        call LspAddServer(g:lsp_servers)
    endfunction

    augroup MyAutoCmd
        autocmd User LspSetup call <SID>SetupLanguageServers()
    augroup END
endif

if Plugged('vim-lsp')
    " https://github.com/prabirshrestha/vim-lsp
    let g:lsp_async_completion    = get(g:, 'lsp_async_completion', 1)
    let g:lsp_fold_enabled        = 0
    let g:lsp_format_sync_timeout = 3000

    let g:lsp_signs_error         = { 'text': g:zero_vim_lsp_signs.error }
    let g:lsp_signs_warning       = { 'text': g:zero_vim_lsp_signs.warning }
    let g:lsp_signs_information   = { 'text': g:zero_vim_lsp_signs.information }
    let g:lsp_signs_hint          = { 'text': g:zero_vim_lsp_signs.hint }
    let g:lsp_virtual_text_prefix = g:zero_vim_lsp_signs.virtual_text

    let g:lsp_diagnostics_enabled          = g:zero_vim_lsp_diagnostics
    let g:lsp_diagnostics_echo_cursor      = 0
    let g:lsp_highlight_references_enabled = g:zero_vim_lsp_highlight_references

    function! s:OnLspBufferEnabled() abort
        if !Plugged('asyncomplete-lsp.vim')
            setlocal omnifunc=lsp#complete
        endif

        " setlocal foldmethod=expr
        " setlocal foldexpr=lsp#ui#vim#folding#foldexpr()
        " setlocal foldtext=lsp#ui#vim#folding#foldtext()

        if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

        " Use `[g` and `]g` to navigate diagnostics
        nmap <buffer> <silent> [g <Plug>(lsp-previous-diagnostic)
        nmap <buffer> <silent> ]g <Plug>(lsp-next-diagnostic)
        nmap <buffer> <silent> [k <Plug>(lsp-previous-error)
        nmap <buffer> <silent> ]k <Plug>(lsp-next-error)

        " Use `[r` and `]r` to navigate references
        nmap <buffer> <silent> [r <Plug>(lsp-previous-reference)
        nmap <buffer> <silent> ]r <Plug>(lsp-next-reference)

        nmap <buffer> <silent> K     <Plug>(lsp-hover)
        nmap <buffer> <silent> g<CR> <Plug>(lsp-code-action)
        nmap <buffer> <silent> gr    <Plug>(lsp-rename)
        nmap <buffer> <silent> g=    <Plug>(lsp-document-format)
        vmap <buffer> <silent> g=    <Plug>(lsp-document-format)
        nmap <buffer> <silent> gF    <Plug>(lsp-document-range-format)
        xmap <buffer> <silent> gF    <Plug>(lsp-document-range-format)
        nmap <buffer> <silent> gd    <Plug>(lsp-declaration)
        nmap <buffer> <silent> g]    <Plug>(lsp-definition)
        nmap <buffer> <silent> g[    <Plug>(lsp-type-definition)
        nmap <buffer> <silent> g{    <Plug>(lsp-type-hierarchy)
        nmap <buffer> <silent> gI    <Plug>(lsp-implementation)
        nmap <buffer> <silent> gL    <Plug>(lsp-document-diagnostics)
        nmap <buffer> <silent> gO    <Plug>(lsp-document-symbol)
        nmap <buffer> <silent> gW    <Plug>(lsp-workspace-symbol)
        nmap <buffer> <silent> gR    <Plug>(lsp-references)
        nmap <buffer> <silent> gm    <Plug>(lsp-signature-help)
    endfunction

    augroup MyAutoCmd
        autocmd User lsp_buffer_enabled call <SID>OnLspBufferEnabled()
    augroup END

    if Plugged('vim-lsp-settings')
        " https://github.com/mattn/vim-lsp-settings
        let g:lsp_settings_global_settings_dir = expand('~/.vim/lsp-settings')
        let g:lsp_settings_servers_dir = expand('~/.cache/vim/lsp-servers')
        let g:lsp_settings = {}

        function! s:SetupLanguageServers() abort
            for l:name in keys(g:zero_vim_language_servers)
                let g:lsp_settings[l:name] = { 'disabled': v:true }
            endfor

            for l:name in g:zero_vim_enabled_language_servers
                let l:server = g:zero_vim_language_servers[l:name]

                let l:server_settings = {
                            \ 'disabled':  v:false,
                            \ 'cmd':       l:server['cmd'],
                            \ 'allowlist': l:server['filetypes'],
                            \ }

                if has_key(l:server, 'root_markers')
                    let l:server_settings['root_uri_patterns'] = l:server['root_markers']
                endif

                if has_key(l:server, 'initialization_options')
                    let l:server_settings['initialization_options'] = l:server['initialization_options']
                endif

                let g:lsp_settings[l:name] = l:server_settings
            endfor
        endfunction

        call s:SetupLanguageServers()
    endif
endif

if Plugged('vim-vsnip')
    " https://github.com/hrsh7th/vim-vsnip
    let g:vsnip_snippet_dir  = expand('~/.vim/vsnip')
    let g:vsnip_snippet_dirs = glob('~/.vim/vsnip/*/', 0, 1)
    let g:vsnip_filetypes = {
                \ 'ruby': ['rdoc', 'rake', 'rails'],
                \ 'javascript': ['javascriptreact'],
                \ 'typescript': ['typescriptreact'],
                \ }

    imap <expr> <C-k> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : ''
    smap <expr> <C-k> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : ''
    imap <expr> <C-j> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)'      : ''
    smap <expr> <C-j> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)'      : ''
    imap <expr> <C-b> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : '<C-b>'
    smap <expr> <C-b> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : ''

    smap <expr> <CR>    vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<CR>'
    smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
    smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

    imap <expr> <C-g><C-e> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : ''
    smap <expr> <C-g><C-e> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : ''
    imap <expr> <C-g><C-n> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)'      : ''
    smap <expr> <C-g><C-n> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)'      : ''
    imap <expr> <C-g><C-p> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : ''
    smap <expr> <C-g><C-p> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : ''
endif

if Plugged('vim-easycomplete') || Plugged('phongnh-vim-easycomplete')
    " https://github.com/jayli/vim-easycomplete
    " https://github.com/phongnh/vim-easycomplete
    let g:easycomplete_tabnine_enable   = 0
    let g:easycomplete_lsp_checking     = 0
    let g:easycomplete_signature_enable = 1
    let g:easycomplete_cursor_word_hl   = 0

    let g:easycomplete_tab_trigger       = '<C-g><Tab>'
    let g:easycomplete_shift_tab_trigger = '<C-g><S-Tab>'

    let g:easycomplete_diagnostics_next = ']g'
    let g:easycomplete_diagnostics_prev = '[g'

    " Enable Nerd Font icons
    let g:easycomplete_nerd_font = g:zero_vim_nerdfont

    if g:easycomplete_nerd_font
        let g:easycomplete_kindflag_vsnip = ''
        let g:easycomplete_menuflag_vsnip = 'Code'
    endif

    " phongnh/vim-easycomplete: Disable registering default sources
    let g:easycomplete_default_sources_enable = 0

    function! s:UnRegisterEasyCompleteSources() abort
        let sources = [
                    \ 'tn', 'ts', 'deno', 'dart', 'vim',
                    \ 'cpp', 'php', 'css', 'html', 'yml',
                    \ 'sh', 'json', 'py', 'java', 'nim',
                    \ 'grvy', 'lua', 'rb', 'kt', 'xml',
                    \ 'c#', 'r', 'cmake', 'snips',
                    \ ]
        for source in sources
            call easycomplete#UnRegisterSource(source)
        endfor
    endfunction

    function! s:SetupEasyCompleteMappings() abort
        nnoremap <buffer> <silent> [g <Cmd>EasyCompleteNextDiagnostic<CR>
        nnoremap <buffer> <silent> ]g <Cmd>EasyCompletePreviousDiagnostic<CR>
        nnoremap <buffer> <silent> gL <Cmd>EasyCompleteLint<CR>
        nnoremap <buffer> <silent> gR <Cmd>EasyCompleteReference<CR>
        nnoremap <buffer> <silent> gd <Cmd>EasyCompleteGotoDefinition<CR>
        nnoremap <buffer> <silent> gr <Cmd>EasyCompleteRename<CR>
        " nnoremap <silent> g[ <Cmd>BackToOriginalBuffer<CR>
    endfunction

    augroup MyAutoCmd
        autocmd User easycomplete_custom_plugin call <SID>UnRegisterEasyCompleteSources()
        autocmd User lsp_buffer_enabled call <SID>SetupEasyCompleteMappings()
    augroup END

    " Trigger autocomplete
    imap <C-x><C-x> <Plug>EasycompleteRefresh

    " <Tab>: completion
    function! s:CleverTab() abort
        if vsnip#jumpable(1)
            return "\<Plug>(vsnip-jump-next)"
        else
            return "\<Plug>EasycompleteTabTrigger"
        endif
    endfunction

    imap <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    function! s:CleverSTab() abort
        if vsnip#jumpable(-1)
            return "\<Plug>(vsnip-jump-prev)"
        else
            return "\<Plug>EasycompleteShiftTabTrigger"
        endif
    endfunction

    imap <expr> <S-Tab> <SID>CleverSTab()

    " <CR>: expand snippet or accept completion
    inoremap <silent> <Plug>EasycompleteEnterTrigger <C-r>=easycomplete#TypeEnterWithPUM()<CR>

    function! s:CleverCR() abort
        if pumvisible()
            if vsnip#available(1)
                return "\<Plug>(vsnip-expand-or-jump)"
            elseif empty(v:completed_item) || complete_info(['selected']).selected == -1
                return "\<C-e>" . s:CR()
            else
                " return "\<C-y>"
                return "\<Plug>EasycompleteEnterTrigger"
            endif
        elseif vsnip#jumpable(1)
            return "\<Plug>(vsnip-jump-next)"
        else
            return s:CR()
        endif
    endfunction

    augroup MyAutoCmd
        autocmd VimEnter * inoremap <silent> <expr> <CR> <SID>CleverCR()
    augroup END

    " <C-y>: expand snippet or accept completion
    function! s:CleverCtrlY() abort
        if pumvisible() && vsnip#available(1)
            return "\<Plug>(vsnip-expand-or-jump)"
        endif
        return "\<C-y>"
    endfunction

    inoremap <silent> <expr> <C-y> <SID>CleverCtrlY()

    function! s:SetupEasyComplete() abort
        if exists('*easycomplete#sources#tn#GetGlboalSoucresItems')
            function! easycomplete#sources#tn#GetGlboalSoucresItems()
                return []
            endfunction
        endif
        inoremap <silent> <expr> <CR> <SID>CleverCR()
    endfunction

    augroup MyAutoCmd
        autocmd VimEnter * call <SID>SetupEasyComplete()
    augroup END

    " Integrate with vim-visual-multi plugin
    augroup MyAutoCmd
        autocmd User MultipleCursorsStart silent! EasyCompleteDisable
        autocmd User MultipleCursorsExit silent! EasyCompleteEnable
    augroup END

    " LSP settings
    let g:easycomplete_sign_text = {
                \ 'error':       g:zero_vim_lsp_signs.error,
                \ 'warning':     g:zero_vim_lsp_signs.warning,
                \ 'information': g:zero_vim_lsp_signs.information,
                \ 'hint':        g:zero_vim_lsp_signs.hint,
                \ }

    let g:easycomplete_lsp_enabled = empty(filter(['vim-lsc', 'lsp', 'vim-lsp'], 'Plugged(v:val)'))

    if g:easycomplete_lsp_enabled
        let g:easycomplete_diagnostics_enable = g:zero_vim_lsp_diagnostics
        let g:easycomplete_diagnostics_hover  = g:zero_vim_lsp_diagnostics

        call s:MergeLanguageServers({
                    \ 'deno': {
                    \   'name': 'deno',
                    \   'extensions': ['js', 'jsx', 'ts', 'tsx', 'mjs', 'ejs'],
                    \   'filter': v:true,
                    \   'initialization_options': {
                    \       'enable': v:true,
                    \       'lint': v:true,
                    \       'unstable': v:true,
                    \       'importMap': v:null,
                    \       'codeLens': {
                    \           'implementations': v:true,
                    \           'references': v:true,
                    \           'referencesAllFunctions': v:true,
                    \           'test': v:true,
                    \           'testArgs': ['--allow-all'],
                    \       },
                    \       'suggest': {
                    \           'autoImports': v:true,
                    \           'completeFunctionCalls': v:true,
                    \           'names': v:true,
                    \           'paths': v:true,
                    \           'imports': {
                    \               'autoDiscover': v:false,
                    \               'hosts': {
                    \                   'https://deno.land/': v:true,
                    \               },
                    \           },
                    \       },
                    \       'config': v:null,
                    \       'internalDebug': v:false,
                    \   },
                    \   'config': { 'refresh_pattern': '\(\$[a-zA-Z0-9_:]*\|\k\+\)$' },
                    \   'workspace_config': {},
                    \   'semantic_highlight': {},
                    \ },
                    \ 'ruby-lsp': {
                    \   'name': 'rubylsp',
                    \   'extensions': ['rb'],
                    \   'initialization_options': {
                    \       'experimentalFeaturesEnabled': 'false',
                    \       'enabledFeatures': [
                    \           'codeActions',
                    \           'codeLens',
                    \           'completion',
                    \           'definition',
                    \           'diagnostics',
                    \           'documentHighlights',
                    \           'documentLink',
                    \           'documentSymbols',
                    \           'foldingRanges',
                    \           'formatting',
                    \           'hover',
                    \           'inlayHint',
                    \           'onTypeFormatting',
                    \           'selectionRanges',
                    \           'semanticHighlighting',
                    \       ],
                    \       'formatter': 'auto',
                    \   },
                    \   'workspace_config': {},
                    \   'semantic_highlight': {},
                    \ },
                    \ 'solargraph': {
                    \   'name': 'solargraph',
                    \   'extensions': ['rb'],
                    \   'initialization_options': {
                    \       'diagnostics': 'true'
                    \   },
                    \ },
                    \ 'gopls': {
                    \   'name': 'gopls',
                    \   'extensions': ['go'],
                    \   'filter': v:true,
                    \   'initialization_options': {
                    \       'completeUnimported': v:true,
                    \       'matcher': 'fuzzy',
                    \       'codelenses': {
                    \           'generate': v:true,
                    \           'test': v:true,
                    \       },
                    \   },
                    \ },
                    \ 'rust-analyzer': {
                    \   'name': 'rust',
                    \   'extensions': ['rust'],
                    \   'initialization_options': {
                    \       'completion': {
                    \           'autoimport': { 'enable': v:true },
                    \       },
                    \   },
                    \   'config': {},
                    \   'workspace_config': {},
                    \   'semantic_highlight': {},
                    \ },
                    \ })

        let g:easycomplete_lsp_source = {}

        function! EasyCompleteLspServerConstructor(opt, ctx) abort
            call easycomplete#RegisterLspServer(a:opt, g:easycomplete_lsp_source[a:opt['name']])
        endfunction

        function! EasyCompleteLspServerCompletor(opt, ctx) abort
            return easycomplete#DoLspComplete(a:opt, a:ctx)
        endfunction

        function! EasyCompleteLspServerGoToDefinition(opt, ctx) abort
            if has_key(a:opt, 'extensions')
                return easycomplete#DoLspDefinition(a:opt['extensions'])
            elseif index(a:opt['whitelist'], &filetype) >= 0
                return easycomplete#action#defination#LspRequest()
            endif
            return v:false
        endfunction

        function! s:SetupEasyCompleteLanguageServers() abort
            for l:name in g:zero_vim_enabled_language_servers
                let l:server = g:zero_vim_language_servers[l:name]

                let l:server_settings = extend(deepcopy(l:server), {
                            \ 'name':     get(l:server, 'name', l:name),
                            \ 'root_uri': {server_info->easycomplete#util#GetDefaultRootUri()},
                            \ })
                let l:server_settings['allowlist'] = remove(l:server_settings, 'filetypes')

                let g:easycomplete_lsp_source[l:server_settings['name']] = l:server_settings

                let l:lsp_source = {
                            \ 'name':           l:server_settings['name'],
                            \ 'whitelist':      l:server_settings['allowlist'],
                            \ 'constructor':    'EasyCompleteLspServerConstructor',
                            \ 'completor':      'EasyCompleteLspServerCompletor',
                            \ 'gotodefinition': 'EasyCompleteLspServerGoToDefinition',
                            \ 'command':        l:server_settings['cmd'][0],
                            \ }

                if has_key(l:server_settings, 'root_markers')
                    let l:lsp_source['root_uri_patterns'] = remove(l:server_settings, 'root_markers')
                endif

                if has_key(l:server_settings, 'extensions')
                    let l:lsp_source['extensions'] = remove(l:server_settings, 'extensions')
                endif

                call easycomplete#RegisterSource(l:lsp_source)
            endfor
        endfunction

        augroup MyAutoCmd
            autocmd User easycomplete_custom_plugin call <SID>SetupEasyCompleteLanguageServers()
        augroup END
    endif
endif

if Plugged('asyncomplete.vim')
    " https://github.com/prabirshrestha/asyncomplete.vim
    let g:asyncomplete_auto_popup  = 1
    let g:asyncomplete_popup_delay = 50
    let g:asyncomplete_matchfuzzy  = get(g:, 'asyncomplete_matchfuzzy', exists('*matchfuzzypos'))
    let g:asyncomplete_min_chars   = 1

    " Show autocomplete popup manually
    imap <C-x><C-x> <Plug>(asyncomplete_force_refresh)

    " <CR>: accept completion when popup menu is visible
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

    " <Tab>: completion
    function! s:CheckBackSpace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~# '\s'
    endfunction

    function! s:CleverTab() abort
        if vsnip#jumpable(1)
            return "\<Plug>(vsnip-jump-next)"
        elseif pumvisible()
            return "\<C-n>"
        elseif s:CheckBackSpace()
            return "\<Tab>"
        else
            return asyncomplete#force_refresh()
        endif
    endfunction

    inoremap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    function! s:CleverSTab() abort
        if vsnip#jumpable(-1)
            return "\<Plug>(vsnip-jump-prev)"
        elseif pumvisible()
            return "\<C-p>"
        else
            return "\<C-h>"
        endif
    endfunction

    inoremap <silent> <expr> <S-Tab> <SID>CleverSTab()

    function! s:SetupAsyncomplete() abort
        " https://github.com/prabirshrestha/asyncomplete-buffer.vim
        " https://github.com/phongnh/asyncomplete-buffer.vim
        call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
                    \ 'name':      'buffer',
                    \ 'allowlist': ['*'],
                    \ 'blocklist': ['go'],
                    \ 'completor': function('asyncomplete#sources#buffer#completor'),
                    \ }))

        " https://github.com/prabirshrestha/asyncomplete-file.vim
        " https://github.com/ferreum/asyncomplete-file.vim
        " https://github.com/notuxic/asyncomplete-file.vim
        call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
                    \ 'name':     'file',
                    \ 'allowlist': ['sh', 'zsh', 'fish'],
                    \ 'priority':  10,
                    \ 'completor': function('asyncomplete#sources#file#completor'),
                    \ }))

        " https://github.com/notuxic/asyncomplete-tags.vim
        let g:asyncomplete_tags_fuzzymatch = 1
        call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
                    \ 'name':     'tags',
                    \ 'allowlist': ['ruby', 'crystal', 'python', 'go', 'rust', 'erlang', 'elixir'],
                    \ 'completor': function('asyncomplete#sources#tags#completor'),
                    \ }))
    endfunction

    augroup MyAutoCmd
        autocmd User asyncomplete_setup call s:SetupAsyncomplete()
    augroup END

    " Integrate with vim-visual-multi plugin
    augroup MyAutoCmd
        autocmd User MultipleCursorsStart call asyncomplete#disable_for_buffer()
        autocmd User MultipleCursorsExit call asyncomplete#enable_for_buffer()
    augroup END
endif

if Plugged('vimcomplete')
    " https://github.com/girishji/vimcomplete
    " CTRL-N and CTRL-P select the menu items.
    let g:vimcomplete_tab_enable = 0
    let g:vimcomplete_ngram_enable = get(g:, 'vimcomplete_ngram_enable', v:true)
    let g:vimcomplete_bigram_enable = get(g:, 'vimcomplete_bigram_enable', v:false)

    " Show autocomplete popup manually
    inoremap <C-x><C-x> <Cmd>VimCompleteCmd<CR>

    " <CR>: expand snippet or accept completion
    function! s:CleverCR() abort
        if pumvisible()
            if vsnip#available(1)
                return "\<Plug>(vsnip-expand-or-jump)"
            elseif empty(v:completed_item) || complete_info(['selected']).selected == -1
                return "\<C-e>" . s:CR()
            else
                return "\<C-y>"
            endif
        elseif vsnip#jumpable(1)
            return "\<Plug>(vsnip-jump-next)"
        else
            return s:CR()
        endif
    endfunction

    inoremap <silent> <expr> <CR> <SID>CleverCR()

    " <Tab>: completion
    function! s:CheckBackSpace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~# '\s'
    endfunction

    function! s:CleverTab() abort
        if vsnip#jumpable(1)
            return "\<Plug>(vsnip-jump-next)"
        elseif pumvisible()
            return "\<C-n>"
        elseif s:CheckBackSpace()
            return "\<Tab>"
        else
            return ''
        endif
    endfunction

    inoremap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    function! s:CleverSTab() abort
        if vsnip#jumpable(-1)
            return "\<Plug>(vsnip-jump-prev)"
        elseif pumvisible()
            return "\<C-p>"
        else
            return "\<C-h>"
        endif
    endfunction

    inoremap <silent> <expr> <S-Tab> <SID>CleverSTab()

    function! s:SetupVimComplete() abort
        if g:vimcomplete_ngram_enable
            call plug#load('ngram-complete.vim')
        endif

        call g:VimCompleteOptionsSet({
                    \ 'completor': {
                    \   'sortByLength': v:false,
                    \   'recency': v:true,
                    \   'recentItemCount': 10,
                    \   'matchCase': v:true,
                    \   'shuffleEqualPriority': v:true,
                    \   'noNewlineInCompletion': v:false,
                    \   'alwaysOn': v:true,
                    \   'showSource': v:false,
                    \   'kindDisplayType': 'text',
                    \ },
                    \ 'path': {
                    \   'enable': v:true,
                    \   'bufferRelativePath': v:true,
                    \   'priority': 20,
                    \ },
                    \ 'lsp': {
                    \   'enable': Plugged('lsp') ? v:true : v:false,
                    \   'maxCount': 10,
                    \   'priority': 19,
                    \ },
                    \ 'vsnip': {
                    \   'enable': v:true,
                    \   'priority': 18,
                    \ },
                    \ 'omnifunc': {
                    \   'enable': v:false,
                    \   'filetypes': ['ruby', 'crystal', 'python', 'go', 'rust', 'erlang', 'elixir'],
                    \   'priority': 17,
                    \ },
                    \ 'ngram': {
                    \   'enable': g:vimcomplete_ngram_enable,
                    \   'bigram': g:vimcomplete_bigram_enable,
                    \   'filetypes': ['text', 'help', 'markdown'],
                    \   'filetypesComments': ['ruby', 'crystal', 'python', 'go', 'rust', 'erlang', 'elixir'],
                    \   'priority': 16,
                    \ },
                    \ 'buffer': {
                    \   'enable': v:true,
                    \   'otherBuffersCount': 5,
                    \   'urlComplete': v:true,
                    \   'envComplete': v:true,
                    \   'priority': 15,
                    \ },
                    \ })
    endfunction

    augroup MyAutoCmd
        autocmd VimEnter * call <SID>SetupVimComplete()
    augroup END

    " Integrate with vim-visual-multi plugin
    augroup MyAutoCmd
        autocmd User MultipleCursorsStart silent! VimCompleteDisable
        autocmd User MultipleCursorsExit silent! VimCompleteEnable
    augroup END
endif

if Plugged('vim-mucomplete')
    " https://github.com/lifepillar/vim-mucomplete
    let g:mucomplete#enable_auto_at_startup = 1
    let g:mucomplete#completion_delay       = 0
    let g:mucomplete#reopen_immediately     = 1
    let g:mucomplete#minimum_prefix_length  = 1
    let g:mucomplete#no_mappings            = 1

    let g:mucomplete#chains = {
                \ 'default': ['path', 'vsnip', 'c-n', 'dict', 'uspl'],
                \ 'vim': ['path', 'cmd', 'vsnip', 'c-n'],
                \ }

    if Enabled('lsp')
        let g:mucomplete#chains.default = ['path', 'omni', 'vsnip', 'c-n', 'dict', 'uspl']
    endif

    if Plugged('vim-lsc')
        " https://github.com/natebosch/vim-lsc
        let g:mucomplete#completion_delay   = 200
        let g:mucomplete#reopen_immediately = 0
    endif

    if Plugged('lsp')
        " https://github.com/yegappan/lsp
        let g:mucomplete#completion_delay   = 200
        let g:mucomplete#reopen_immediately = 0
    endif

    if Plugged('vim-lsp')
        " https://github.com/prabirshrestha/vim-lsp
        let g:lsp_async_completion = 0
    endif

    " Show autocomplete popup manually
    imap <expr> <C-x><C-x> pumvisible() ? "\<Plug>(MUcompleteCycFwd)" : "\<Plug>(MUcompleteFwd)"

    " CTRL-J: snippet jump forward or go to next completion chain
    function! s:CleverCtrlJ() abort
        if vsnip#jumpable(1)
            return "\<Plug>(vsnip-jump-next)"
        elseif pumvisible()
            return "\<Plug>(MUcompleteCycFwd)"
        else
            return ''
        endif
    endfunction

    imap <expr> <C-j> <SID>CleverCtrlJ()

    " CTRL-K: go to previous completion chain or expand snippet
    function! s:CleverCtrlK() abort
        if pumvisible()
            if empty(v:completed_item) || complete_info(['selected']).selected == -1
                return "\<Plug>(MUcompleteCycBwd)"
            elseif vsnip#available(1)
                return "\<Plug>(vsnip-expand-or-jump)"
            else
                return "\<Plug>(MUcompleteCycBwd)"
            endif
        elseif vsnip#available(1)
            return "\<Plug>(vsnip-expand-or-jump)"
        else
            return ''
        endif
    endfunction

    imap <expr> <C-k> <SID>CleverCtrlK()

    " <CR>: accept completion when popup menu is visible
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

    " <Tab>: completion
    function! s:CleverTab() abort
        if vsnip#jumpable(1)
            return "\<Plug>(vsnip-jump-next)"
        else
            return "\<Plug>(MUcompleteFwd)"
        endif
    endfunction

    imap <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    function! s:CleverSTab() abort
        if vsnip#jumpable(-1)
            return "\<Plug>(vsnip-jump-prev)"
        else
            return "\<Plug>(MUcompleteBwd)"
        endif
    endfunction

    imap <expr> <S-Tab> <SID>CleverSTab()

    " CTRL-Y: Extend completion
    " imap <expr> <C-y> mucomplete#extend_fwd("\<C-y>")

    " Integrate with vim-visual-multi plugin
    augroup MyAutoCmd
        autocmd User MultipleCursorsStart silent! MUcompleteAutoOff
        autocmd User MultipleCursorsExit silent! MUcompleteAutoOn
    augroup END
endif

if !Enabled('completion')
    " <CR>: accept completion
    function! s:CleverCR() abort
        if pumvisible()
            if empty(v:completed_item) || complete_info(['selected']).selected == -1
                return "\<C-e>" . s:CR()
            else
                return "\<C-y>" . "\<C-e>"
            endif
        else
            return s:CR()
        endif
    endfunction

    inoremap <silent> <expr> <CR> <SID>CleverCR()

    " <Tab>: completion
    function! s:CheckBackSpace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~# '\s'
    endfunction

    function! s:CleverTab() abort
        if pumvisible()
            return "\<C-n>"
        elseif s:CheckBackSpace()
            return "\<Tab>"
        else
            return "\<C-n>"
        endif
    endfunction

    inoremap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    function! s:CleverSTab() abort
        if pumvisible()
            return "\<C-p>"
        else
            return "\<C-h>"
        endif
    endfunction

    inoremap <silent> <expr> <S-Tab> <SID>CleverSTab()
endif

if Plugged('vim-autoformat')
    " https://github.com/vim-autoformat/vim-autoformat
    let g:autoformat_autoindent             = 0
    let g:autoformat_retab                  = 0
    let g:autoformat_remove_trailing_spaces = 0
    let g:autoformat_verbosemode            = 0

    " Terraform
    let g:formatdef_terraform_fmt = '"terraform fmt -no-color -"'
    let g:formatters_terraform    = ['terraform_fmt']

    nnoremap <silent> <Leader>b= <Cmd>Autoformat<Bar>update<CR>
    xnoremap <silent> <Leader>b= :Autoformat<Bar>update<CR>
    nnoremap <silent> <Leader>bu <Cmd>Autoformat<Bar>update<CR>
    xnoremap <silent> <Leader>bu :Autoformat<Bar>update<CR>
endif

if Plugged('neoformat')
    " https://github.com/sbdchd/neoformat
    " Try to use project-local version of format tool from node_modules/.bin
    let g:neoformat_try_node_exe = 1

    let g:neoformat_ruby_rubocop = {
                \ 'exe':    'bundle',
                \ 'args':   ['exec', 'rubocop', '--auto-correct', '--stdin', '"%:p"', '2>/dev/null', '|', 'sed "1,/^====================$/d"'],
                \ 'stdin':  1,
                \ 'stderr': 1
                \ }

    let g:neoformat_enabled_ruby = ['rubocop']

    nnoremap <silent> <Leader>b= <Cmd>Neoformat<Bar>update<CR>
    xnoremap <silent> <Leader>b= :Neoformat<Bar>update<CR>
    nnoremap <silent> <Leader>bu <Cmd>Neoformat<Bar>update<CR>
    xnoremap <silent> <Leader>bu :Neoformat<Bar>update<CR>
endif

if Plugged('neomake')
    " https://github.com/neomake/neomake
    let g:neomake_open_list         = 2
    let g:neomake_cursormoved_delay = 200

    let g:neomake_highlight_lines   = get(g:, 'neomake_highlight_lines', 0)
    let g:neomake_highlight_columns = !g:neomake_highlight_lines

    let g:neomake_error_sign   = { 'text': g:zero_vim_signs.error }
    let g:neomake_warning_sign = { 'text': g:zero_vim_signs.warning }
    let g:neomake_info_sign    = { 'text': g:zero_vim_signs.information }
    let g:neomake_message_sign = { 'text': g:zero_vim_signs.message }

    let g:neomake_virtualtext_prefix = g:zero_vim_signs.virtual_text . ' '

    if g:zero_vim_autolint
        let g:neomake_open_list = 0
        call neomake#configure#automake('w')
    endif

    let g:neomake_ruby_enabled_makers = ['mri', 'rubocop', 'reek']
    let g:neomake_ruby_rubocop_exe    = 'bundle'
    let g:neomake_ruby_rubocop_args   = ['exec', 'rubocop', '--format', 'emacs']
    let g:neomake_ruby_reek_exe       = 'bundle'
    let g:neomake_ruby_reek_args      = ['exec', 'reek', '--no-color', '--single-line']

    function! NeomakeRubyBrakemanMakerInitForJob(jobinfo) dict abort
        let maker = deepcopy(self)
        if a:jobinfo.file_mode
            let maker.args += ['--only-files']
        endif
        return maker
    endfunction

    function! NeomakeRubyBrakemanMakerProcessJSON(context) abort
        let l:entries = []
        for l:warning in get(a:context.json, 'warnings', [])
            call add(l:entries, {
                        \ 'maker_name': 'brakeman',
                        \ 'filename':   l:warning.file,
                        \ 'text':       l:warning.warning_type . ' ' . l:warning.message . ' (' . l:warning.confidence . ') ' . l:warning.link,
                        \ 'lnum':       l:warning.line != v:null ? l:warning.line : 1,
                        \ 'type':       'W',
                        \ })
        endfor
        return l:entries
    endfunction

    let g:neomake_ruby_brakeman_maker = {
                \ 'exe':           'bundle',
                \ 'args':          ['exec', 'brakeman', '-f', 'json', '-q'],
                \ 'errorformat':   '%m',
                \ 'apppend_file':  1,
                \ 'output_stream': 'stdout',
                \ 'InitForJob':    function('NeomakeRubyBrakemanMakerInitForJob'),
                \ 'process_json':  function('NeomakeRubyBrakemanMakerProcessJSON'),
                \ }

    nnoremap <silent> <Leader>bc <Cmd>Neomake<Bar>echo neomake#statusline#LoclistStatus()<CR>

    function! s:NeomakeSetMakers(bang, ...) abort
        if a:bang
            for ft in neomake#utils#get_config_fts(&filetype)
                unlet! b:neomake_{ft}_enabled_makers
            endfor
        elseif a:0 > 0
            for ft in neomake#utils#get_config_fts(&filetype)
                let b:neomake_{ft}_enabled_makers = a:000
            endfor
        endif
    endfunction

    function! s:NeomakeRun(bang, sh_command, ...) abort
        let maker = neomake#utils#MakerFromCommand(a:sh_command)
        let maker.name = 'sh: ' . a:sh_command
        let maker.errorformat = '%f:%l:%c: %t: %m,%f:%l:%c: %m,%E%f:%l: %m'
        let maker.default_entry_type = 'M'
        let options = { 'enabled_makers': [maker], 'file_mode': 1 }
        call neomake#ShCommand(a:bang, a:sh_command, options)
    endfunction

    command! -bar -bang -nargs=* -complete=customlist,neomake#cmd#complete_makers NeomakeSetMakers call <SID>NeomakeSetMakers(<bang>0, <f-args>)
    command! -bar -bang -nargs=+ -complete=shellcmd NeomakeRun call <SID>NeomakeRun(<bang>0, <q-args>)

    nnoremap <silent> [g <Cmd>NeomakePrevLoclist<CR>
    nnoremap <silent> ]g <Cmd>NeomakeNextLoclist<CR>

    augroup MyAutoCmd
        autocmd FileType ruby
                    \   nnoremap <buffer> <silent> <Leader>ru <Cmd>Neomake rubocop<CR>
                    \ | nnoremap <buffer> <silent> <Leader>re <Cmd>Neomake reek<CR>
    augroup END
endif

if Plugged('ale')
    " https://github.com/dense-analysis/ale
    let g:ale_lint_on_text_changed     = 0
    let g:ale_lint_on_insert_leave     = 0
    let g:ale_lint_on_enter            = g:zero_vim_autolint
    let g:ale_lint_on_save             = g:zero_vim_autolint
    let g:ale_lint_on_filetype_changed = g:zero_vim_autolint
    let g:ale_open_list                = !g:zero_vim_autolint
    let g:ale_fix_on_save              = g:zero_vim_autofix

    let g:ale_floating_preview   = get(g:, 'ale_floating_preview', 1)
    let g:ale_cursor_detail      = g:ale_floating_preview
    let g:ale_virtualtext_cursor = !g:ale_floating_preview
    let g:ale_echo_delay         = 200
    let g:ale_echo_cursor        = g:ale_virtualtext_cursor
    let g:ale_set_highlights     = get(g:, 'ale_set_highlights', g:ale_virtualtext_cursor)

    let g:ale_close_preview_on_insert     = 1
    let g:ale_floating_window_border      = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
    let g:ale_floating_preview_popup_opts = { 'close': 'click', 'highlight': 'NormalFloat:Normal' }

    let g:ale_sign_error         = g:zero_vim_signs.error
    let g:ale_sign_warning       = g:zero_vim_signs.warning
    let g:ale_sign_style_error   = g:zero_vim_signs.style_error
    let g:ale_sign_style_warning = g:zero_vim_signs.style_warning
    let g:ale_sign_info          = g:zero_vim_signs.information
    let g:ale_virtualtext_prefix = g:zero_vim_signs.virtual_text . ' '

    let g:ale_linters = {
                \ 'ruby': ['ruby', 'rubocop', 'reek'],
                \ }

    let g:ale_fixers  = {
                \ '*': ['remove_trailing_lines', 'trim_whitespace'],
                \ }

    let g:ale_ruby_brakeman_executable = 'bundle'
    let g:ale_ruby_rubocop_executable  = 'bundle'
    let g:ale_ruby_reek_executable     = 'bundle'
    let g:ale_ruby_reek_show_context   = 1
    let g:ale_ruby_reek_show_wiki_link = 0

    " Don't auto-format files inside `node_modules`, minified files and jquery
    let g:ale_pattern_options_enabled = 1
    let g:ale_pattern_options = {
                \ '\.min\.(js\|css)$': {
                \   'ale_linters': [],
                \   'ale_fixers': [],
                \ },
                \ 'jquery.*': {
                \   'ale_linters': [],
                \   'ale_fixers': [],
                \ },
                \ 'node_modules/.*': {
                \   'ale_linters': [],
                \   'ale_fixers': [],
                \ },
                \ 'package.json': {
                \   'ale_fixers': ['remove_trailing_lines', 'trim_whitespace'],
                \ },
                \}

    nnoremap <silent> <Leader>bc <Cmd>ALELint<CR>
    nnoremap <silent> <Leader>b= <Cmd>ALEFix<CR>

    function! s:ListALELinters(...) abort
        try
            if exists('b:ale_linters') | let b:current_ale_linters = b:ale_linters | endif
            unlet! b:ale_linters
            return join(map(copy(ale#linter#Get(&filetype)), 'v:val.name'), "\n")
        finally
            if exists('b:current_ale_linters') | let b:ale_linters = b:current_ale_linters | endif
            unlet! b:current_ale_linters
        endtry
    endfunction

    function! s:ALESetLinters(bang, ...) abort
        if a:bang
            unlet! b:ale_linters
        elseif a:0 > 0
            let b:ale_linters = a:000
        endif
    endfunction

    command! -bar -bang -nargs=* -complete=custom,<SID>ListALELinters ALESetLinters call <SID>ALESetLinters(<bang>0, <f-args>)

    nmap [g <Plug>(ale_previous_wrap)
    nmap ]g <Plug>(ale_next_wrap)
endif

" https://github.com/vim-test/vim-test
if has('terminal')
    let g:test#vim#term_position = 'botright 15'
    let g:test#strategy          = 'vimterminal'
endif

if Plugged('vim-tmuxify')
    let g:test#preserve_screen = 0
    let g:test#strategy        = 'tmuxify'
endif

if has('gui_running') && has('gui_macvim')
    let g:test#strategy = 'terminal'
endif

nmap              <Leader>tt <Leader>tf
nnoremap <silent> <Leader>tn <Cmd>TestNearest<CR>
nnoremap <silent> <Leader>tf <Cmd>TestFile<CR>
nnoremap <silent> <Leader>tl <Cmd>TestLast<CR>
nnoremap <silent> <Leader>ts <Cmd>TestSuite<CR>
nnoremap <silent> <Leader>tv <Cmd>TestVisit<CR>

" https://github.com/tyru/open-browser-github.vim

if Plugged('vim-fugitive')
    " https://github.com/tpope/vim-fugitive
    let g:fugitive_legacy_commands = 0

    nnoremap          <Leader>gi <Cmd>Git add -p %<CR>
    nnoremap          <Leader>ga <Cmd>Git add -p<CR>
    nnoremap <silent> <Leader>gs <Cmd>Git<CR>
    nnoremap <silent> <Leader>gd <Cmd>Gdiffsplit<CR>
    nnoremap <silent> <Leader>gc <Cmd>Git commit -v<CR>
    nnoremap <silent> <Leader>gb <Cmd>Git blame<CR>
    nnoremap          <Leader>ge :Gedit<Space>
    nnoremap <silent> <Leader>gr <Cmd>Gread<CR>
    nnoremap <silent> <Leader>gw <Cmd>Gwrite<CR>
    nnoremap <silent> <Leader>gx <Cmd>Gwq<Bar>redraw<CR>
    nnoremap <silent> <Leader>gf <Cmd>Git fetch<CR>
    nnoremap <silent> <Leader>gp <Cmd>Git push<CR>
    nnoremap <silent> <Leader>gu <Cmd>Git pull --rebase<CR>
    nnoremap <silent> <Leader>go <Cmd>GBrowse<CR>
    xnoremap <silent> <Leader>go :GBrowse<CR>

    nnoremap <silent> <Leader>gy :Gwrite<Bar>Git commit -m <C-r>=printf("'Update: %s'", strftime('%a, %d %b %Y %H:%M:%S %z'))<CR><CR>

    augroup MyAutoCmd
        autocmd BufReadPost fugitive://* set bufhidden=delete
        " Disable rhubarb#Complete
        autocmd BufEnter *.git/*MSG setlocal omnifunc=
    augroup END
endif

if Plugged('gv.vim')
    " https://github.com/junegunn/gv.vim
    nnoremap <silent> <Leader>gl <Cmd>GV<CR>
    nnoremap <silent> <Leader>gv <Cmd>GV!<CR>
    nnoremap <silent> <Leader>g? <Cmd>GV?<CR>
endif

if Plugged('git-messenger.vim')
    " https://github.com/rhysd/git-messenger.vim
    let g:git_messenger_always_into_popup = v:true
    let g:git_messenger_no_default_mappings = v:true

    nmap <Leader>gm <Plug>(git-messenger)
endif

if Plugged('vim-signify')
    " https://github.com/mhinz/vim-signify
    let g:signify_skip = {
                \ 'vcs': { 'allow': ['git', 'hg'] },
                \ 'pattern': [
                \   'Gemfile.lock$',
                \   'yarn.lock$',
                \ ],
                \ }

    let g:signify_skip_filetype = {
                \ '':              1,
                \ 'terminal':      1,
                \ 'diff':          1,
                \ 'git':           1,
                \ 'gitcommit':     1,
                \ 'ctrlsf':        1,
                \ 'qf':            1,
                \ 'help':          1,
                \ 'fugitive':      1,
                \ 'fugitiveblame': 1,
                \ 'fzf':           1,
                \ 'startify':      1,
                \ 'netrw':         1,
                \ 'nerdtree':      1,
                \ 'fern':          1,
                \ 'tagbar':        1,
                \ 'railslog':      1,
                \ }

    let g:signify_sign_show_count = 1

    let g:signify_sign_add               = '+'
    let g:signify_sign_delete            = '_'
    let g:signify_sign_delete_first_line = '‾'
    let g:signify_sign_change            = '~'
    let g:signify_sign_change_delete     = '~'

    augroup MyAutoCmd
        autocmd User SignifyAutocmds autocmd! signify WinEnter
    augroup END

    nmap ]h <Plug>(signify-next-hunk)
    nmap [h <Plug>(signify-prev-hunk)
    nmap ]H 9999]h
    nmap [H 9999[h

    xmap ah <Plug>(signify-motion-outer-visual)
    omap ah <Plug>(signify-motion-outer-pending)
    xmap ih <Plug>(signify-motion-inner-visual)
    omap ih <Plug>(signify-motion-inner-pending)

    nnoremap <silent> ghd <Cmd>SignifyDiff<CR>
    nnoremap <silent> ghp <Cmd>SignifyHunkDiff<CR>
    nnoremap <silent> ghu <Cmd>SignifyHunkUndo<CR>

    nnoremap <silent> yog <Cmd>SignifyToggle<CR>
endif

if Plugged('vim-gitgutter')
    " https://github.com/airblade/vim-gitgutter
    let g:gitgutter_enabled  = 1
    let g:gitgutter_map_keys = 0

    if executable('rg')
        let g:gitgutter_grep = 'rg --color=never'
    endif

    let g:gitgutter_sign_added                   = '+'
    let g:gitgutter_sign_modified                = '~'
    let g:gitgutter_sign_removed                 = '_'
    let g:gitgutter_sign_removed_first_line      = '‾'
    let g:gitgutter_sign_removed_above_and_below = '_‾'
    let g:gitgutter_sign_modified_removed        = '~'

    nmap ]h <Plug>(GitGutterNextHunk)
    nmap [h <Plug>(GitGutterPrevHunk)
    nmap ]H 9999]h
    nmap [H 9999[h

    xmap ah <Plug>(GitGutterTextObjectOuterVisual)
    omap ah <Plug>(GitGutterTextObjectOuterPending)
    xmap ih <Plug>(GitGutterTextObjectInnerVisual)
    omap ih <Plug>(GitGutterTextObjectInnerPending)

    nmap ghp <Plug>(GitGutterPreviewHunk)
    nmap ghs <Plug>(GitGutterStageHunk)
    nmap ghu <Plug>(GitGutterUndoHunk)

    nnoremap <silent> yog <Cmd>GitGutterToggle<CR>
endif

if Plugged('vim-which-key')
    " https://github.com/liuchengxu/vim-which-key
    let g:which_key_display_names = {
                \ ' ':     'SPC',
                \ '<C-h>': 'BS',
                \ '<C-i>': 'TAB',
                \ '<Tab>': 'TAB',
                \ '<CR>':  'RET',
                \ }

    let g:which_key_map = {
                \ 'n': 'open-selected-region',
                \ 'S': 'search-prompt',
                \ 'B': 'buffer-search-prompt',
                \ 'R': 'replace-prompt',
                \ 'a': 'all-files',
                \ 'f': 'files',
                \ 'p': 'buffer-project',
                \ 'o': 'mru-in-cwd-and-opening-buffers',
                \ 'O': 'recent-files',
                \ 'd': 'files-in-buffer-dir',
                \ '\': 'tags',
                \ ';': 'command-palette',
                \ ':': 'command-history',
                \ '?': 'search-history',
                \ 'l': 'location-list',
                \ 'q': 'quickfix',
                \ '/': 'live-grep',
                \ }

    let g:which_key_map.b = {
                \ 'name': '+buffer',
                \ 'w': 'save-buffer',
                \ 'x': 'save-and-close-buffer',
                \ 'u': 'save-and-format-buffer',
                \ 'm': 'maximize-buffer',
                \ 'k': 'delete-buffer',
                \ 'y': 'copy-buffer-to-clipboard',
                \ 'n': 'open-selected-region',
                \ 'b': 'opening-buffers',
                \ 'd': 'files-in-buffer-dir',
                \ 'p': 'buffer-project',
                \ 't': 'buffer-tags',
                \ 'o': 'buffer-outline',
                \ 'l': 'buffer-lines',
                \ 'a': 'buffer-alternative',
                \ 'r': 'buffer-related',
                \ ';': 'buffer-search-cword-prompt',
                \ 's': 'buffer-search-cword',
                \ '.': 'buffer-search-word',
                \ 'g': 'buffer-git-grep-cword',
                \ }

    if Plugged('nerdtree') || Plugged('vim-fern')
        call extend(g:which_key_map, {
                    \ 'e': 'toggle-explorer',
                    \ 'E': 'open-explorer-in-cwd',
                    \ })
        let g:which_key_map.b.f = 'find-buffer-in-explorer'
    else
        call extend(g:which_key_map, {
                    \ 'e': 'netrw-explorer',
                    \ 'E': 'toggle-netrw-drawer',
                    \ })
        let g:which_key_map.b.f = 'open-buffer-dir-in-netrw-explorer'
    endif

    if Plugged('ctrlp.vim')
        call extend(g:which_key_map, {
                    \ 'y': 'yanks',
                    \ 'Y': 'registers',
                    \ })
    endif

    if Plugged('scope.vim') || Plugged('fzf')
        call extend(g:which_key_map, {
                    \ "'": 'marks',
                    \ 'Y': 'registers',
                    \ })
    endif

    if Plugged('goyo.vim')
        call extend(g:which_key_map, {
                    \ '<CR>': 'toggle-distraction-free-writing',
                    \ 'L':    'toggle-hyperfocus-writing',
                    \ })
    endif

    if Plugged('vim-mundo') || Plugged('gundo.vim') || Plugged('undotree')
        let g:which_key_map.U = 'toggle-undo-tree'
    endif

    if Plugged('tagbar')
        let g:which_key_map.T = 'toggle-tags-tree'
    endif

    if Plugged('vim-indent-guides') || Plugged('indentLine')
        let g:which_key_map.b.i = 'toggle-indent-guides'
    endif

    let g:which_key_map.s = {
                \ 'name': '+search/replace',
                \ ';': 'search-cword-prompt',
                \ 's': 'search-cword',
                \ '.': 'search-word',
                \ 'd': 'search-cword-in-buffer-dir',
                \ 'g': 'git-grep-cword',
                \ 'i': 'search-fuzzy',
                \ 'c': 'search-cword-fuzzy-interactive',
                \ 'r': 'replace-cword-prompt',
                \ 'x': 'replace-cword-boundary-prompt',
                \ }

    if Plugged('vim-abolish')
        let g:which_key_map.V   = 'subvert-prompt'
        let g:which_key_map.s.v = 'subvert-cword-prompt'
    endif

    if Plugged('ctrlsf.vim')
        let g:which_key_map.F = 'ctrlsf-search-prompt'
        call extend(g:which_key_map.s, {
                    \ 'f': 'ctrlsf-search-cword',
                    \ 'w': 'ctrlsf-search-word',
                    \ 'p': 'ctrlsf-search-cword-in-project',
                    \ 'u': 'ctrlsf-search-update',
                    \ 'o': 'toggle-ctrlsf-search-result',
                    \ })
    endif

    if Plugged('any-jump.vim')
        call extend(g:which_key_map.s, {
                    \ 'name': '+search/any-jump/replace',
                    \ 'a': 'any-jump',
                    \ 'b': 'any-jump-back',
                    \ 'l': 'any-jump-last-results',
                    \ })
    endif

    if Plugged('vim-autoformat') || Plugged('neoformat')
        call extend(g:which_key_map.b, {
                    \ '=': 'format-buffer',
                    \ 'u': 'format-buffer',
                    \ })
    endif

    if Plugged('ale') || Plugged('neomake')
        let g:which_key_map.b.c = 'check-buffer-syntax'
    endif

    if Plugged('ale')
        let g:which_key_map.b['='] = 'ale-fix-buffer'
    endif

    let g:which_key_map.t = {
                \ 'name': '+test',
                \ 't': 'run-test-nearest-to-current-cursor',
                \ 'n': 'run-test-nearest-to-current-cursor',
                \ 'f': 'run-all-tests-in-current-file',
                \ 'l': 'run-last-test',
                \ 's': 'run-whole-test-suite',
                \ 'v': 'visit-last-test',
                \ }

    if Plugged('vim-tmuxify')
        let g:which_key_map.m = {
                    \ 'name': '+tmuxify',
                    \ 'b': 'send-<ctrl-c>',
                    \ 'c': 'send-<ctrl-l>',
                    \ 'n': 'create-and-associate-with-pane',
                    \ 'p': 'associate-with-existing-pane',
                    \ 'q': 'close-associated-pane',
                    \ 'r': 'run-command',
                    \ 't': 'set-run-command',
                    \ 'i': 'send-text-prompt',
                    \ 's': 'send-paragraph',
                    \ 'l': 'send-line',
                    \ 'v': 'send-linewise-visual',
                    \ 'w': 'send-word',
                    \ 'k': 'send-key-prompt',
                    \ 'a': 'send-last-text',
                    \ 'f': 'send-clear',
                    \ 'd': 'send-quit',
                    \ }
    endif

    let g:which_key_map.g = {}

    if Plugged('vim-fugitive')
        call extend(g:which_key_map.g, {
                    \ 'name': '+git',
                    \ 'i': 'stage-current-file-interactive',
                    \ 'a': 'stage-all-files-interactive',
                    \ 's': 'status',
                    \ 'd': 'diff',
                    \ 'c': 'commit',
                    \ 'b': 'blame',
                    \ 'e': 'edit-prompt',
                    \ 'r': 'reset-file',
                    \ 'w': 'save-and-stage-current-file',
                    \ 'x': 'save-and-stage-current-file-and-quit',
                    \ 'f': 'fetch',
                    \ 'p': 'push',
                    \ 'u': 'pull-and-rebase',
                    \ 'o': 'open-in-browser',
                    \ 'l': 'commit-browser',
                    \ 'v': 'commit-browser-for-current-file',
                    \ '?': 'current-file-revisions',
                    \ })
    endif

    if Plugged('gv.vim')
        call extend(g:which_key_map.g, {
                    \ 'name': '+git',
                    \ 'l': 'commit-browser',
                    \ 'v': 'commit-browser-for-current-file',
                    \ '?': 'current-file-revisions',
                    \ })
    endif

    if Plugged('git-messenger.vim')
        call extend(g:which_key_map.g, {
                    \ 'name': '+git',
                    \ 'm': 'git-messenger',
                    \ })
    endif

    call which_key#register('<Space>', 'g:which_key_map')

    nnoremap <silent> <Leader> <Cmd>WhichKey '<Space>'<CR>
    vnoremap <silent> <Leader> <Cmd>WhichKeyVisual '<Space>'<CR>
endif

" https://github.com/tpope/vim-markdown
let g:markdown_fenced_languages = [
            \ 'bash=sh',
            \ 'javascript',
            \ 'js=javascript',
            \ 'json',
            \ 'lua',
            \ 'python',
            \ 'ruby',
            \ 'vim',
            \ 'yaml',
            \ ]

" https://github.com/pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow  = 0

" https://github.com/othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = get(g:, 'used_javascript_libs', 'underscore,react,vue,d3')

" https://github.com/elzr/vim-json
let g:vim_json_syntax_conceal = 0

" $VIMRUNTIME/syntax/json.vim
let g:vim_json_conceal = 0

" Ruby speedup
" let g:ruby_no_expensive              = 1
let g:rubycomplete_buffer_loading    = 0
let g:rubycomplete_classes_in_global = 0
let g:rubycomplete_rails             = 0

" Disable custom rails syntax highlighting
" let g:rails_syntax = 0

" Opererator syntax highlighting
" let g:ruby_operators = 1

if Plugged('vim-projectionist')
    " https://github.com/tpope/vim-projectionist
    let g:projectionist_ignore_ = 1
endif

if Plugged('vim-rake')
    " https://github.com/tpope/vim-rake
    augroup MyAutoCmd
        autocmd User Rake
                    \   nnoremap <buffer> <silent> <Leader>ba <Cmd>AE<CR>
                    \ | nnoremap <buffer> <silent> <Leader>br <Cmd>RE<CR>
    augroup END
endif

if Plugged('vim-rails')
    " https://github.com/tpope/vim-rails
    let g:Tlist_Ctags_Cmd = g:zero_vim_ctags_bin

    let g:rails_projections = {
                \ 'app/controllers/*_controller.rb': {
                \   'alternate': [
                \       'spec/requests/{}_spec.rb',
                \       'spec/requests/{}_request_spec.rb',
                \       'spec/requests/{}_controller_spec.rb',
                \       'spec/controllers/{}_controller_spec.rb',
                \   ],
                \ },
                \ 'app/scopes/*_scopes.rb': {
                \   'command': 'scope',
                \   'template': ['class {camelcase|capitalize|colons}Scopes', 'end'],
                \   'related': [
                \       'app/models/{}.rb',
                \   ],
                \   'test': [
                \       'spec/scopes/{}_scopes_spec.rb',
                \       'spec/models/{}_spec.rb',
                \   ],
                \ },
                \ 'spec/requests/*_request_spec.rb': {
                \   'alternate': [
                \       'app/controllers/{}_controller.rb',
                \   ]
                \ },
                \ 'spec/requests/*_spec.rb': {
                \   'alternate': [
                \       'app/controllers/{}.rb',
                \       'app/controllers/{}_controller.rb',
                \   ]
                \ },
                \ 'spec/routing/*_routing_spec.rb': {
                \   'alternate': [
                \       'app/controllers/{}_controller.rb',
                \   ]
                \ },
                \ 'spec/routing/*_spec.rb': {
                \   'alternate': [
                \       'app/controllers/{}.rb',
                \       'app/controllers/{}_controller.rb',
                \   ]
                \ },
                \ }

    augroup MyAutoCmd
        autocmd User Rails
                    \   nnoremap <buffer> <silent> <Leader>ba <Cmd>AE<CR>
                    \ | nnoremap <buffer> <silent> <Leader>br <Cmd>RE<CR>
    augroup END
endif

if Plugged('vim-rubocop')
    " https://github.com/phongnh/vim-rubocop
    let g:vimrubocop_keymap = 0

    nnoremap <silent> <Leader>rp <Cmd>RuboCopProject<CR>

    augroup MyAutoCmd
        autocmd FileType ruby nnoremap <buffer> <silent> <Leader>ru <Cmd>RuboCop<CR>
    augroup END
endif

if Plugged('vim-reek')
    " https://github.com/phongnh/vim-reek
    let g:reek_always_show = 1
    let g:reek_line_limit  = 1000
    let g:reek_on_loading  = 0

    augroup MyAutoCmd
        autocmd FileType ruby nnoremap <buffer> <silent> <Leader>re <Cmd>RunReek<CR>
    augroup END
endif

" https://github.com/vim-crystal/vim-crystal
let g:crystal_enable_completion = 0

if Plugged('vim-go')
    " https://github.com/fatih/vim-go
    let g:go_fmt_command       = get(g:, 'go_fmt_command', 'gopls') " goimports
    let g:go_fmt_fail_silently = 1

    " Toggle more highlight options
    let g:go_highlights_enabled = 0

    " These highlights are enabled by default
    " let g:go_highlight_string_spellcheck   = 1
    " let g:go_highlight_format_strings      = 1
    " let g:go_highlight_diagnostic_errors   = 1
    " let g:go_highlight_diagnostic_warnings = 1
    " let g:go_highlight_debug               = 1

    function! s:ToggleGoHighlights() abort
        let g:go_highlights_enabled                  = !g:go_highlights_enabled
        " let g:go_highlight_array_whitespace_error    = g:go_highlights_enabled
        " let g:go_highlight_chan_whitespace_error     = g:go_highlights_enabled
        let g:go_highlight_extra_types               = g:go_highlights_enabled
        " let g:go_highlight_space_tab_error           = g:go_highlights_enabled
        " let g:go_highlight_trailing_whitespace_error = g:go_highlights_enabled
        " let g:go_highlight_operators                 = g:go_highlights_enabled
        let g:go_highlight_functions                 = g:go_highlights_enabled
        let g:go_highlight_function_parameters       = g:go_highlights_enabled
        let g:go_highlight_function_calls            = g:go_highlights_enabled
        let g:go_highlight_fields                    = g:go_highlights_enabled
        let g:go_highlight_types                     = g:go_highlights_enabled
        let g:go_highlight_build_constraints         = g:go_highlights_enabled
        let g:go_highlight_generate_tags             = g:go_highlights_enabled
        " let g:go_highlight_variable_assignments      = g:go_highlights_enabled
        " let g:go_highlight_variable_declarations     = g:go_highlights_enabled
        confirm edit
        redraw!
        echo printf('%s highlights!', g:go_highlights_enabled ? 'Enabled' : 'Disabled')
    endfunction

    command! ToggleGoHighlights call <SID>ToggleGoHighlights()

    function! s:BuildGoFiles() abort
        let l:file = expand('%')
        if l:file =~# '^\f\+_test\.go$'
            call go#test#Test(0, 1)
        elseif l:file =~# '^\f\+\.go$'
            call go#cmd#Build(0)
        endif
    endfunction

    function! s:SetupVimGo() abort
        " :GoAlternate  commands :A, :AV, :AS and :AT
        command! -buffer -bang A  call go#alternate#Switch(<bang>0, 'edit')
        command! -buffer -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
        command! -buffer -bang AS call go#alternate#Switch(<bang>0, 'split')
        command! -buffer -bang AT call go#alternate#Switch(<bang>0, 'tabe')

        nnoremap <buffer> <silent> <Plug>(go-smart-build) <Cmd>call <SID>BuildGoFiles()<CR>

        if empty(mapcheck('<Plug>(go-run-split)'))
            nnoremap <buffer> <silent> <Plug>(go-run-split) <Cmd>GoRun!<CR><Cmd>redraw!<CR>
        endif

        nmap <buffer> <Leader>ru <Plug>(go-run)
        nmap <buffer> <Leader>rs <Plug>(go-run-split)
        nmap <buffer> <Leader>rb <Plug>(go-smart-build)
        nmap <buffer> <Leader>rt <Plug>(go-test)
        nmap <buffer> <Leader>rf <Plug>(go-test-func)
        nmap <buffer> <Leader>rc <Plug>(go-coverage-toggle)

        nmap <buffer> <Leader>ri <Plug>(go-info)

        nmap <buffer> <Leader>re <Plug>(go-rename)

        if Plugged('ctrlp.vim') || Plugged('fzf.vim')
            nmap <buffer> <Leader>ro <Plug>(go-decls-dir)
        endif

        nmap <buffer> <Leader>r] <Plug>(go-def)
        nmap <buffer> <Leader>r[ <Plug>(go-def-type)
        nmap <buffer> <Leader>rd <Plug>(go-doc-vertical)
        nmap <buffer> <Leader>rx <Plug>(go-doc-split)
        nmap <buffer> <Leader>rg <Plug>(go-doc-browser)
        nmap <buffer> <Leader>rl <Plug>(go-metalinter)

        nmap <buffer> <Leader>ra <Plug>(go-alternate-edit)
        nmap <buffer> <Leader>ba <Plug>(go-alternate-edit)
        nmap <buffer> <Leader>b= <Plug>(go-imports)

        nnoremap <buffer> g< :GoImport<Space>
        nnoremap <buffer> g> :GoDrop<Space>

        nnoremap <buffer>          <Leader>rk :GoDocBrowser<Space>
        nnoremap <buffer> <silent> <Leader>rh <Cmd>ToggleGoHighlights<CR>
    endfunction

    function! s:SetupVimGoMod() abort
        nnoremap <buffer> <silent> <Leader>bu <Cmd>update<CR><Cmd>GoModFmt<CR>
    endfunction

    augroup MyAutoCmd
        autocmd BufEnter go.mod if &filetype ==# 'lprolog' | setfiletype gomod | endif
        autocmd FileType gomod call s:SetupVimGoMod()
        autocmd FileType go call s:SetupVimGo()
    augroup END
endif

" https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave = get(g:, 'rustfmt_autosave', 0)

if !g:rustfmt_autosave
    augroup MyAutoCmd
        autocmd FileType rust nnoremap <buffer> <silent> <Leader>bu <Cmd>RustFmt<Bar>update<CR>
    augroup END
endif

if Plugged('zig.vim')
    " https://github.com/ziglang/zig.vim
    let g:zig_fmt_autosave = get(g:, 'zig_fmt_autosave', 0)

    augroup MyAutoCmd
        autocmd FileType zig command! -buffer -bar ZigFmt call zig#fmt#Format()
        if !g:zig_fmt_autosave
            autocmd FileType zig nnoremap <buffer> <silent> <Leader>bu <Cmd>ZigFmt<Bar>update<CR>
        endif
    augroup END
endif

" https://github.com/elixir-editors/vim-elixir

" https://github.com/andyl/vim-textobj-elixir
let g:textobj_elixir_no_default_key_mappings = 1

augroup MyAutoCmd
    autocmd FileType elixir
                \   xmap <buffer> ae <Plug>(textobj-elixir-any-a)
                \ | omap <buffer> ae <Plug>(textobj-elixir-any-a)
                \ | xmap <buffer> ie <Plug>(textobj-elixir-any-i)
                \ | omap <buffer> ie <Plug>(textobj-elixir-any-i)
augroup END

" https://github.com/hashivim/vim-terraform
let g:terraform_fold_sections = 1
let g:hcl_fold_sections       = 1

augroup MyAutoCmd
    autocmd FileType terraform nnoremap <buffer> <silent> <Leader>bu <Cmd>TerraformFmt<CR><Cmd>update<CR>
augroup END

if exists('#User#ZeroVimSetup')
    doautocmd <nomodeline> User ZeroVimSetup
endif

" Zero Vim Profile settings
if !exists('g:zero_vim_profile') && !exists('g:zero_vim_colorscheme')
    if !empty($ZERO_VIM_PROFILE)
        let g:zero_vim_profile = $ZERO_VIM_PROFILE
    elseif !empty($TERM_PROFILE)
        let g:zero_vim_profile = $TERM_PROFILE
    elseif !empty($ITERM_PROFILE)
        let g:zero_vim_profile = $ITERM_PROFILE
    endif
endif

if exists('g:zero_vim_profile')
    let g:zero_vim_background = get(g:, 'zero_vim_background', g:zero_vim_profile =~? 'Light' || $TERM_PROFILE =~? 'Light' || $ITERM_PROFILE =~? 'Light' ? 'light' : 'dark')

    if g:zero_vim_profile =~? 'Solarized'
        let g:zero_vim_colorscheme = (g:zero_vim_profile =~? 'Low' ? 'solarized8_low' : 'solarized8')
        let g:solarized_statusline = 'flat'
    elseif g:zero_vim_profile =~? 'Gruvbox Material'
        let g:zero_vim_colorscheme = 'gruvbox-material'
    elseif g:zero_vim_profile =~? 'Gruvbox'
        let g:zero_vim_colorscheme = 'retrobox'
    elseif g:zero_vim_profile =~? 'Everforest'
        let g:zero_vim_colorscheme = 'everforest'
    endif
endif

" Transparent Colorschemes
let g:zero_vim_transparent_colorschemes = get(g:, 'zero_vim_transparent_colorschemes', {})

" https://github.com/lifepillar/vim-solarized8
let g:solarized_use16           = 1
let g:solarized_italics         = 1
let g:solarized_termtrans       = get(g:, 'solarized_termtrans', get(g:zero_vim_transparent_colorschemes, 'solarized8', g:zero_vim_transparent_background))
let g:solarized_extra_hi_groups = get(g:, 'solarized_extra_hi_groups', 0)

" https://github.com/lifepillar/vim-gruvbox8
let g:gruvbox_contrast_dark      = get(g:, 'gruvbox_contrast_dark', 'hard')
let g:gruvbox_contrast_light     = get(g:, 'gruvbox_contrast_light', 'hard')
let g:gruvbox_italic             = 1
let g:gruvbox_transp_bg          = get(g:, 'gruvbox_transp_bg', get(g:zero_vim_transparent_colorschemes, 'gruvbox8', g:zero_vim_transparent_background))
let g:gruvbox_filetype_hi_groups = get(g:, 'gruvbox_filetype_hi_groups', 0)
let g:gruvbox_plugin_hi_groups   = get(g:, 'gruvbox_plugin_hi_groups', 0)

" https://github.com/sainnhe/gruvbox-material
let g:gruvbox_material_background             = get(g:, 'gruvbox_material_background', 'hard')
let g:gruvbox_material_palette                = get(g:, 'gruvbox_material_palette', 'material') " material | mix | original
let g:gruvbox_material_enable_italic          = 1
let g:gruvbox_material_disable_italic_comment = 0
let g:gruvbox_material_transparent_background = get(g:, 'gruvbox_material_transparent_background', get(g:zero_vim_transparent_colorschemes, 'gruvbox-material', g:zero_vim_transparent_background))

" https://github.com/sainnhe/everforest
let g:everforest_background             = get(g:, 'everforest_background', 'hard')
let g:everforest_enable_italic          = 1
let g:everforest_disable_italic_comment = 0
let g:everforest_transparent_background = get(g:, 'everforest_transparent_background', get(g:zero_vim_transparent_colorschemes, 'everforest', g:zero_vim_transparent_background))

" Default colorscheme
try
    if exists('g:zero_vim_colorscheme')
        if exists('g:zero_vim_background')
            execute 'set background=' . g:zero_vim_background
        endif
        execute 'colorscheme ' . g:zero_vim_colorscheme
    elseif &termguicolors
        set background=dark
        colorscheme gruvbox-material
    else
        set background=dark
        colorscheme habamax
    endif
catch
    set background=dark
    colorscheme retrobox
endtry

set secure

