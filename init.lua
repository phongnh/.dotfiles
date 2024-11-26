-- Vim Settings
if vim.fn.has("nvim-0.9") ~= 1 then
  vim.api.nvim_echo({
    { "ZeroVim requires Neovim >= 0.9.0\n", "ErrorMsg" },
    { "Press any key to exit", "MoreMsg" },
  }, true, {})
  vim.fn.getchar()
  vim.cmd([[quit]])
end

-- if vim.fn.has("vim_starting") == 1 then
--     vim.o.encoding = "utf-8"
-- end
-- vim.scriptencoding = "utf-8"

if string.match(vim.o.shell, "fish$") then
  if vim.fn.executable("zsh") == 1 then
    vim.o.shell = vim.fn.exepath("zsh")
  elseif vim.fn.executable("bash") == 1 then
    vim.o.shell = vim.fn.exepath("bash")
  end
end

-- stylua: ignore start
vim.o.ttimeout = true                              -- Time out for key codes
vim.o.ttimeoutlen = 50                             -- Wait up to 50ms after Esc for special key
vim.o.timeoutlen = 500                             -- Time out on mapings after 500ms

vim.o.visualbell = true                            -- Use visual bell instead of beeping

vim.o.updatetime = 250                             -- 250ms to save swap file and trigger CursorHold autocommand event

vim.o.mouse = "a"                                  -- Enable mouse in every mode
vim.o.mousemodel = "popup"                         -- Right mouse button pops up a menu

if vim.fn.has("nvim-0.10") == 1 then
    vim.o.smoothscroll = true
end

vim.o.fileformat = "unix"
vim.opt.fileformats = { "unix", "dos" }

vim.o.tabpagemax = 20
vim.o.lazyredraw = true                            -- Do not redraw while macro executing
vim.o.redrawtime = 0                               -- Time in milliseconds for redrawing the display
-- vim.o.shortmess = "aoOtTIcC"                       -- Print current file name, cursor position and file status (press CTRL-G)
-- https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages#messages-and-notifications-in-neovim
vim.opt.shortmess:append({
    W = true,
    I = true,
    c = true,
    C = true,
})
-- vim.o.laststatus = 2                               -- Always display statusline
vim.o.laststatus = 3                               -- Always statusline and ONLY in the last window
vim.opt.display:append({ "lastline" })             -- When a line is long, do not omit it in @
vim.o.cmdheight = 2                                -- Height of command-line (easy-readable)
vim.o.history = 250                                -- Store lots of command lines in history
vim.o.showcmd = false                              -- Do not show (partial) command in the last line of the screen
vim.o.ruler = false                                -- Do not show the line and column number of the cursor position (press CTRL-G or g CTRL-G)

vim.o.foldenable = false                           -- Disable fold by default
vim.opt.foldopen:append({ "insert", "jump" })      -- Folds will be opened for insert and jump commands as well
vim.o.foldmethod = "indent"                        -- Lines with equal indent form a fold
vim.o.foldlevel = 2                                -- Starting fold at level 2

vim.o.modeline = false                             -- Disable modeline

vim.opt.nrformats:remove({ "octal" })
vim.opt.backspace = { "indent", "eol", "nostop" }  -- Enable backspace delete indent and newline
vim.o.virtualedit = "block"                        -- Enable virtualedit in visual block mode
vim.o.whichwrap = "b,s,h,l,<,>,[,]"                -- Allow wrap only when Backspace, h, l and cursor keys are used
vim.o.startofline = false                          -- The cursor is kept in the same column (if possible)
vim.o.scrolloff = 1                                -- Minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 5                            -- The minimal number of screen columns to keep to the left and to the right of the cursor
vim.o.splitbelow = true                            -- Splitting a window will put the new window below the current one
vim.o.splitright = true                            -- Splitting a window will put the new window right the current one
vim.o.splitkeep = "screen"                         -- Keep the text on the same screen line
vim.o.winminwidth = 5                              -- Hard minimal width of a window
-- vim.o.equalalways = false                          -- No equal window size

vim.o.confirm = true                               -- Confirm to save changes before exiting modified buffer
-- vim.o.hidden = true                                -- Allow buffer switching without saving
vim.o.autowrite = true                             -- Enable auto write
-- vim.o.autoread = true                              -- Auto-reload if file is saved externally

-- vim.o.infercase = true                             -- Ignore case on insert completion
vim.o.ignorecase = true                            -- Ignore case search for normal letters
vim.o.smartcase = true                             -- Do case-sensitive search if pattern contains upper case letters
vim.o.incsearch = true                             -- Enable incremental search
-- vim.o.inccommand = "split"                         -- Show preview of :substitute in split window
vim.o.hlsearch = true                              -- Highlight search matches
-- vim.o.matchtime = 1                                -- 100 miliseconds to show the matching paren
-- vim.opt.matchpairs:append({ "<:>" })               -- Highlight <>
-- vim.opt.cpoptions:remove({ "m" })                  -- A showmatch will wait a matchtime or until a character is typed

-- Default indent settings
vim.o.shiftwidth = 2
vim.o.shiftround = true

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true                             -- Expand tab to space
-- vim.o.smarttab = true                              -- Smart insert / delete tab

-- vim.o.textwidth = 120
-- vim.o.colorcolumn = "+1"
-- vim.o.cursorline = true
-- vim.o.cursorlineopt = "number"

-- Use better separators
-- :help 'fillchars'
vim.opt.fillchars:append({ eob = " ", fold = " ", diff = "╱" })

-- Display tabs and trailing spaces
-- :help 'listchars'
-- vim.o.listchars = "tab:» ,leadmultispace:│ ,trail:·,nbsp:•,extends:›,precedes:‹,eol:§"
vim.opt.listchars = {
    tab = "» ",
    trail = "…",
    nbsp = "•",
    extends = "›",
    precedes = "‹",
    eol = "§",
}

vim.o.conceallevel = 2
vim.o.concealcursor = "n"

vim.o.wrap = false                                 -- Disable wrapping long lines by default
vim.o.linebreak = true                             -- Wrap long lines at a character in 'breakat'
vim.o.showbreak = "↪ "                             -- String to put at the start of lines that have been wrapped.
-- vim.o.breakat = " \t!;:,?"
vim.o.breakindent = true
vim.opt.cpoptions:append({ n = true })             -- showbreak appears in between line numbers

vim.o.backup = false
vim.o.writebackup = false                          -- Do not create backup
vim.o.swapfile = false                             -- Do not use swapfile for buffer
vim.o.undofile = true

-- :help fo-table
-- t: Auto-wrap text using 'textwidth'
-- c: Auto-wrap comments using 'textwidth', inserting the current comment leader automatically
-- 1: Don't break a line after a one-letter word
-- j: Remove a comment leader when joining lines
vim.opt.formatoptions:append({
    t = true,
    c = true,
    ["1"] = true,
    j = true,
})

vim.o.tagbsearch = false                           -- Use linear search
vim.o.tagcase = "match"                            -- Use match case when searching tags

vim.opt_global.tags:remove({ "./tags", "./tags;" })
vim.opt_global.tags:prepend({ "./tags;" })

-- Completion settings
-- vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- CTRL-P / CTRN-N keyword completion
-- . scan the current buffer ('wrapscan' is ignored)
-- w scan buffers from other windows
-- b scan other loaded buffers that are in the buffer list
-- u scan the unloaded buffers that are in the buffer list
vim.opt.complete = { ".", "w", "b", "u" }

vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"               -- Command-line completion mode
vim.opt.wildoptions = { "pum", "tagfile" }
-- vim.cmd([[set wildcharm=<C-s>]])
-- vim.o.wildcharm = string.byte(vim.api.nvim_replace_termcodes("<C-s>", true, true, true))
vim.o.wildcharm = vim.api.nvim_replace_termcodes("<C-s>", true, true, true):byte()

vim.o.pumheight = 10                               -- Maximum number of entries in a popup

-- Ignore the following file patterns when expanding wildcards, completing file or directory names
vim.opt.wildignore:append({
    "*/.git/*",
    "*/tmp/*",
    "*/__pycache__/*",
    "*/node_modules/*",
    "*/.next/*",
    "*/.terraform/*",
    "*/.shards/*",
    "*/_build/*",
    "*/.elixir_ls/*",
    "*.o",
    "*.obj",
    "*.dwarf",
    "*.pyc",
    "*.rbc",
    "*.rbo",
    "*.luac",
    "*.class",
    "*.gem",
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.gif",
    "*.bmp",
    "*.pdf",
    "*.zip",
    "*.rar",
    "*.7z",
    "*.tar",
    "*.gz",
    "*.bz2",
    "*.xz",
    "*.dmg",
    "*.pkg",
    "*.dll",
    "*.exe",
    "*.lnk",
    "*.ini",
    "*.dat",
    "*.DS_Store",
    "*.swp",
    "*~",
    "._*",
})

-- https://vimways.org/2018/death-by-a-thousand-files/
-- Ignore /usr/include folder from search path
vim.opt.path:remove({ "/usr/include" })

vim.opt.viewoptions:remove({ "options" })

if vim.fn.has("diff") == 1 then
    -- Use the new internal diff feature with options:
    -- - indent-heuristic: uses indentation to improve diffs
    -- - algorithm:patience: patience diff algorithm
    -- - algorithm:histogram: an improved patience algorithm as used in Git
    -- vim.opt.diffopt:append({ "internal", "algorithm:histogram", "indent-heuristic", "vertical", "context:8" })
    vim.opt.diffopt:append({ "internal", "algorithm:histogram", "vertical", "context:8" })
end
-- stylua: ignore end

-- Don't try to highlight lines longer than 500 characters
vim.o.synmaxcol = 500
-- vim.cmd("syntax sync minlines=256")

-- True Color settings
if (vim.env.COLORTERM == "truecolor" or vim.env.COLORTERM == "24bit") and vim.fn.has("termguicolors") == 1 then
  vim.o.termguicolors = true
end

-- Python 3
if vim.fn.executable("python3") == 1 then
  vim.g.python3_host_prog = vim.fn.exepath("python3")
end

-- Disable Ruby support
vim.g.loaded_ruby_provider = 0

-- Disable NodeJS support
vim.g.loaded_node_provider = 0

-- Disable perl support
vim.g.loaded_perl_provider = 0

-- Disable system plugins
vim.g.loaded_gzip = 1
vim.g.loaded_less = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

-- Disable sql mappings
vim.g.omni_sql_no_default_maps = 1

-- Correctly highlight $() and other modern affordances in filetype=sh.
if vim.g.is_posix == nil and vim.g.is_bash == nil and vim.g.is_kornshell == nil and vim.g.is_dash == nil then
  vim.g.is_posix = 1
end

vim.filetype.add({
  extension = {
    ["inky-haml"] = "haml",
  },
  filename = {
    [".gemrc"] = "yaml",
    ["tigrc"] = "tig",
    [".init.lua.local"] = "lua",
    ["init.lua.local"] = "lua",
    [".editor.lua.local"] = "lua",
    ["__CtrlSFPreview__"] = "ctrlsf-preview",
  },
  pattern = {
    [".*%.html%.inky"] = "eruby.html",
    [".*%.tigrc"] = "tigrc",
    [".*%.tmux%.conf"] = "tmux",
    [".*%.env%..*"] = "sh",
  },
})

-- Set augroup
vim.api.nvim_create_augroup("MyAutoCmd", { clear = true })

-- Share the histories
-- vim.api.nvim_create_autocmd("CursorHold", {
--     group = "MyAutoCmd",
--     pattern = "*",
--     command = "rshada | wshada",
-- })

-- -- Start insert when entering in term buffer
-- vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
--     group = "MyAutoCmd"
--     pattern = "term://*",
--     command = "startinsert",
-- })

-- -- Stop insert when leaving in term buffer
-- vim.api.nvim_create_autocmd("BufLeave", {
--     group = "MyAutoCmd"
--     pattern = "term://*",
--     command = "stopinsert",
-- })

-- Transparent WinSeparator
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "MyAutoCmd",
  pattern = "*",
  command = "highlight WinSeparator ctermbg=NONE guibg=NONE",
})

-- Set filetype for terminal buffer to enable lualine's terminal extension
vim.api.nvim_create_autocmd("TermOpen", {
  group = "MyAutoCmd",
  pattern = "*",
  callback = function(event)
    if
      vim.bo[event.buf].buftype == "terminal"
      and (vim.bo[event.buf].filetype == nil or vim.bo[event.buf].filetype == "")
    then
      vim.bo[event.buf].filetype = "terminal"
    end
  end,
})

-- Filetype Settings
vim.api.nvim_create_augroup("ZeroVimFiletypes", { clear = true })

-- Enable cursorline
vim.api.nvim_create_autocmd("FileType", {
  group = "ZeroVimFiletypes",
  pattern = { "qf", "help", "fugitiveblame", "gitcommit", "gitrebase", "pullrequest" },
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

-- Enable spell
vim.api.nvim_create_autocmd("FileType", {
  group = "ZeroVimFiletypes",
  pattern = { "gitcommit", "pullrequest" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "ZeroVimFiletypes",
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.textwidth = 72
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "ZeroVimFiletypes",
  pattern = "gitconfig",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "ZeroVimFiletypes",
  pattern = "tigrc",
  callback = function()
    vim.opt_local.commentstring = "# %s"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "ZeroVimFiletypes",
  pattern = "json",
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

if vim.fn.executable("jq") == 1 then
  vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "json",
    callback = function(event)
      vim.api.nvim_buf_create_user_command(event.buf, "FormatJSON", function()
        local cmd = string.format(
          ":%%!jq -e -M --indent %d .",
          vim.fn.exists("*shiftwidth") == 1 and vim.fn.shiftwidth() or vim.opt_local.shiftwidth
        )
        vim.cmd(cmd)
      end, { bar = true })
    end,
  })
elseif vim.fn.executable("python3") == 1 then
  vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "json",
    callback = function(event)
      vim.api.nvim_buf_create_user_command(event.buf, "FormatJSON", ":%!python3 -m json.tool", { bar = true })
    end,
  })
elseif vim.fn.executable("python") == 1 then
  vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "json",
    callback = function(event)
      vim.api.nvim_buf_create_user_command(event.buf, "FormatJSON", ":%!python -m json.tool", { bar = true })
    end,
  })
end

if vim.fn.executable("xmllint") == 1 then
  vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "xml",
    callback = function(event)
      vim.api.nvim_buf_create_user_command(event.buf, "FormatXML", function()
        local cmd = string.format(
          [[silent! :%%!env XMLLINT_INDENT="%s" xmllint --format --recover - 2>/dev/null]],
          string.rep(" ", vim.fn.exists("*shiftwidth") == 1 and vim.fn.shiftwidth() or vim.opt_local.shiftwidth)
        )
        vim.cmd(cmd)
      end, { bar = true })
    end,
  })
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("ZeroVimCloseWithQ", { clear = true }),
  pattern = { "qf", "help", "grug-far", "grug-far-history", "fugitive", "fugitiveblame" },
  callback = function(event)
    vim.b.matchup_matchparen_fallback = 0
    vim.b.matchup_matchparen_enabled = 0
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = "MyAutoCmd",
  pattern = "*",
  callback = function()
    vim.opt_global.showtabline = 1

    if vim.fn.maparg("gb", "n"):len() == 0 then
      vim.keymap.set("n", "gb", "<Leader>bb", { remap = true })
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = "ZeroVimFiletypes",
      pattern = "ruby",
      callback = function()
        if vim.bo.omnifunc == "syntaxcomplete#Complete" then
          vim.bo.omnifunc = ""
        end
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = "ZeroVimFiletypes",
      pattern = { "sql" },
      callback = function()
        vim.bo.omnifunc = ""
      end,
    })
  end,
})

-- Highlight on yank
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = vim.api.nvim_create_augroup("ZeroVimHighlightYank", { clear = true }),
--   callback = function()
--     vim.highlight.on_yank({ timeout = 250 })
--   end,
-- })

_G.ZeroVim = {}

ZeroVim.spec = {}

-- ZeroVim.find_commands = {
--   fd = "fd --type file --color never --hidden",
--   rg = "rg --files --color never --ignore-dot --ignore-parent --hidden",
--   git = "git ls-files --exclude-standard",
-- }
--
-- ZeroVim.find_all_commands = {
--   fd = "fd --type file --color never --no-ignore --hidden --follow",
--   rg = "rg --files --color never --no-ignore --hidden --follow",
--   git = "git ls-files --exclude-standard --cached --others",
-- }
--
function LazySpec(...)
  vim.list_extend(ZeroVim.spec, { ... })
end

-- Get plugin from lazy.vim spec
function LazyPlugin(plugin)
  return require("lazy.core.config").spec.plugins[plugin]
end

-- Check if a plugin is added into lazy.vim spec or not
function LazyHas(plugin)
  return LazyPlugin(plugin) ~= nil
end

-- Helpers
-- Find and source init.lua from root to current folder
-- ~/projects/hello $
-- .
-- └── /home/phong
--     ├── init.lua
--     └── projects
--         ├── init.lua
--         └── hello
--             ├── init.lua
--             └── ...
--
-- Files are sourced in order for the call Source("init.lua"):
--   /home/phong/init.lua
--   /home/phong/projects/init.lua
--   /home/phong/projects/hello/init.lua
function Source(name)
  local vimrcs = vim.fn.findfile(name, vim.fn.expand("~"), -1)
  vim.list_extend(vimrcs, vim.fn.reverse(vim.fn.findfile(name, ";", -1)))
  for _, vimrc in ipairs(vim.fn.uniq(vimrcs)) do
    vim.cmd("luafile " .. vim.fn.fnamemodify(vimrc, ":p"))
  end
end

-- Check if a plugin is enabled or not
function Enabled(plugin, ...)
  local current = vim.g.zero_vim_plugins[plugin] or 0
  local enabled = vim.fn.empty(current) == 0
  if enabled and select("#", ...) > 0 then
    return string.lower(tostring(current)) == string.lower(tostring(select(1, ...)))
  end
  return enabled
end

-- Check if a group is enabled or not
function EnabledGroup(group)
  return vim.fn.index(vim.g.zero_vim_groups, group) > -1
end

-- Helper to setup plugins
function ZeroVimPlugins(opts)
  if type(opts) == "table" and not vim.islist(opts) then
    vim.g.zero_vim_plugins = vim.g.zero_vim_plugins or vim.empty_dict()
    vim.g.zero_vim_plugins = vim.tbl_extend("force", vim.g.zero_vim_plugins, opts)
  end
end

-- Helper to setup groups
function ZeroVimGroups(opts)
  if type(opts) == "table" and vim.islist(opts) then
    vim.g.zero_vim_groups = vim.g.zero_vim_groups or {}
    vim.g.zero_vim_groups = vim.list_extend(vim.g.zero_vim_groups, opts)
    vim.g.zero_vim_groups = vim.fn.uniq(vim.fn.sort(vim.g.zero_vim_groups))
  elseif type(opts) == "table" then
    for group, enabled in pairs(opts) do
      if vim.fn.empty(enabled) == 0 then
        vim.g.zero_vim_groups = vim.tbl_filter(function(current)
          return current ~= group
        end, vim.g.zero_vim_groups)
      else
        table.insert(vim.g.zero_vim_groups, group)
      end
    end
    vim.g.zero_vim_groups = vim.fn.uniq(vim.fn.sort(vim.g.zero_vim_groups))
  end
end

-- Helper to setup open folder mappings
function ZeroVimOpenFolderMappings(opts)
  if type(opts) == "table" and not vim.islist(opts) then
    vim.g.zero_vim_open_folder_mappings = vim.g.zero_vim_open_folder_mappings or vim.empty_dict()
    vim.g.zero_vim_open_folder_mappings = vim.tbl_extend("force", vim.g.zero_vim_open_folder_mappings, opts)
  end
end

-- Default files
vim.g.zero_vim_local_file = vim.g.zero_vim_local_file or ".init.lua.local"

-- Default plugins
-- stylua: ignore start
vim.g.zero_vim_default_plugins = vim.g.zero_vim_default_plugins or {
    startuptime = 0,
    statusline = 0,
    dashboard = 1,
    ["buffer-explorer"] = 0,
    explorer = "mini.files",
    finder = 1,
    ctrlsf = 1,
    ["any-jump"] = 1,
    sneak = 0,
    editorconfig = 1,
    autoindent = 0,
    whitespace = 1,
    comment = 0,
    surround = 0,
    align = 0,
    ["change-case"] = 1,
    splitjoin = 0,
    matchup = 1,
    foldtext = 1,
    ["indent-guides"] = "mini.indentscope",
    zen = 0,
    undotree = 1,
    ctags = 1,
    tagbar = 0,
    ["auto-pairs"] = 1,
    lsp = 0,
    completion = "cmp",
    formatting = 1,
    linting = 1,
    dap = 0,
    github = 1,
    git = 1,
    ["git-messenger"] = 0,
    ["git-gutter"] = 1,
    solarized = 0,
    ["which-key"] = 0,
}
-- stylua: ignore end

-- Find and source .init.lua.local from root to current folder
Source(vim.g.zero_vim_local_file)

-- Plugin settings
vim.g.zero_vim_plugins =
  vim.tbl_extend("force", vim.deepcopy(vim.g.zero_vim_default_plugins), vim.g.zero_vim_plugins or vim.empty_dict())

-- Enabled groups
vim.g.zero_vim_groups = vim.g.zero_vim_groups or {}

function vim.bool2num(value)
  if type(value) == "boolean" then
    return value and 1 or 0
  end
  return value
end

vim.g.zero_vim_nerdfont = vim.bool2num(vim.g.zero_vim_nerdfont or 0)
vim.g.zero_vim_transparent_background = vim.bool2num(vim.g.zero_vim_transparent_background or 0)
vim.g.zero_vim_powerline_fonts = vim.bool2num(vim.g.zero_vim_powerline_fonts or vim.g.zero_vim_nerdfont)
vim.g.zero_vim_powerline_style = vim.g.zero_vim_powerline_style or "default"
vim.g.zero_vim_git_branch = vim.g.zero_vim_git_branch or 0
vim.g.zero_vim_indent_guides = vim.g.zero_vim_indent_guides or 0
vim.g.zero_vim_grep_no_ignore_vcs = vim.g.zero_vim_grep_no_ignore_vcs or 0
vim.g.zero_vim_find_tool = vim.g.zero_vim_find_tool or "fd"
vim.g.zero_vim_find_no_ignore_vcs = vim.g.zero_vim_find_no_ignore_vcs or 0
vim.g.zero_vim_follow_links = vim.g.zero_vim_follow_links or 1
vim.g.zero_vim_autolint = vim.g.zero_vim_autolint or 0
vim.g.zero_vim_autofix = vim.g.zero_vim_autofix or 0
vim.g.zero_vim_ctags_bin = vim.g.zero_vim_ctags_bin or "ctags"
vim.g.zero_vim_ctags_ignore = vim.g.zero_vim_ctags_ignore or vim.fn.expand("~/.config/ctags/ignore")

-- Default signs
vim.g.zero_vim_signs = vim.tbl_extend("force", {
  error = "🅔",
  style_error = "ⓔ",
  warning = "🅦",
  style_warning = "ⓦ",
  information = "🅘",
  hint = "🅗",
  message = "🅜",
  virtual_text = "❯",
}, vim.g.zero_vim_signs or vim.empty_dict())

-- stylua: ignore start
vim.g.zero_vim_logo = [[
███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
]]
-- stylua: ignore end

-- Map leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- :help default-mappings

-- Space: Leader
vim.keymap.set("n", "<Space>", "", { remap = true })
vim.keymap.set("x", "<Space>", "", { remap = true })

-- F1: Help
-- vim.keymap.set("n", "<F1>", ":help<Space>")
-- vim.keymap.set("i", "<F1>", "<Esc><F1>", { remap = true })

-- CTRL-Space: Show history
vim.keymap.set("c", "<C-@>", "<C-f>")

-- CTRL-V: Paste from clipboard
vim.keymap.set("c", "<C-v>", "<C-r>+")

-- Reset Esc
vim.keymap.set("i", "<Esc>", "<Esc>", { nowait = true })
-- vim.keymap.set({ "n", "i"}, "<Esc>", "<Cmd>nohlsearch<CR><Esc>", { nowait = true })

-- Enable undo for CTRL-W (Delete word) and CTRL-U (Delete line)
-- vim.keymap.set("i", "<C-w>", "<C-g>u<C-w>")
-- vim.keymap.set("i", "<C-u>", "<C-g>u<C-u>")

-- Add undo break-points
vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", ";", ";<C-g>u")

-- CTRL-T: Insert tab
-- vim.keymap.set("i", "<C-t>", "<C-v><Tab>", { silent = true })

-- CTRL-L: Redraw
-- if vim.fn.has("diff") == 1 then
--     vim.keymap.set("n", "<C-l>", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-l><CR>", { silent = true })
-- else
--     vim.keymap.set("n", "<C-l>", "<Cmd>nohlsearch<Bar>normal! <C-l><CR>", { silent = true })
-- end

-- ig: inner entire / whole buffer
vim.keymap.set({ "x", "o" }, "ig", ":<C-u>mark '<Bar>keepjumps normal! gg^vGg_<CR>", { silent = true })
-- ag: an entire / whole buffer
vim.keymap.set({ "x", "o" }, "ag", ":<C-u>mark '<Bar>keepjumps normal! gg0vG$<CR>", { silent = true })

-- iv: inner line
vim.keymap.set({ "x", "o" }, "iv", ":<C-u>mark '<Bar>keepjumps normal! ^vg_<CR>", { silent = true })
-- av: a line
vim.keymap.set({ "x", "o" }, "av", ":<C-u>mark '<Bar>keepjumps normal! 0v$<CR>", { silent = true })

-- Q: Disable Ex-mode. qq to record, Q to replay (remapped)
vim.keymap.set("n", "Q", "@q", { remap = true })

-- Q: Use Q in Visual mode to execute a macro on each line of the selection
-- vim.keymap.set(
--     "x",
--     "Q",
--     "mode() == 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'",
--     { silent = true, expr = true }
-- )

-- gQ: Q (remapped)
vim.keymap.set("n", "gQ", "Q")

-- &: Use the same flags as the previous substitution
-- vim.keymap.set("n", "&", "<Cmd>&&<CR>")

-- .: repeats the last command on every line
vim.keymap.set("x", ".", ":normal .<CR>")

-- @: repeats macro on every line
-- vim.keymap.set("x", "@", ":normal @")
-- vim.keymap.set(
--     "x",
--     "@",
--     "mode() == 'V' ? ':normal! @' . getcharstr() . '<CR>' : '@'",
--     { silent = true, expr = true }
-- )

-- After indenting code, does not exit Visual mode
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

-- Tab / Shift-Tab: Indent code in Visual mode
vim.keymap.set("x", "<Tab>", ">", { remap = true })
vim.keymap.set("x", "<S-Tab>", "<", { remap = true })

-- Indent whole file
vim.keymap.set("n", "g=", "gg=G``")

-- gi already moves to "last place you exited insert mode"
-- gI: Move to last change (remapped)
vim.keymap.set("n", "gI", "`.`")

-- gV: Select the text that was last edited/pasted (remapped)
-- http://vimcasts.org/episodes/bubbling-text/
-- vim.keymap.set("n", "gV", "`[v`]", { remap = true })
vim.keymap.set(
  "n",
  "gV",
  "'`[' . strpart(getregtype(), 0, 1) . '`]'",
  { silent = true, expr = true, replace_keycodes = false }
)

-- g/: Search inside visually highlighted text
vim.keymap.set("x", "g/", "<Esc>/\\%V")

-- Search visually selected text
if vim.fn.has("nvim-0.10") == 0 then
  vim.keymap.set("x", "*", [[y/\V<C-r>=escape(@", '/\')<CR><CR>]], { silent = true })
  vim.keymap.set("x", "#", [[y?\V<C-r>=escape(@", '?\')<CR><CR>]], { silent = true })
end

-- U: Redo (remapped)
vim.keymap.set("n", "U", "<Cmd>redo<CR>")

-- Y: Yank to end line (remapped)
-- vim.keymap.set("n", "Y", "y$")

-- Copy / cut to clipboard
vim.keymap.set("n", "cy", [["+y]], { remap = true })
vim.keymap.set("n", "cd", [["+d]], { remap = true })

vim.keymap.set("x", "gy", [["+y]], { remap = true })
vim.keymap.set("x", "gd", [["+d]], { remap = true })

-- Copy <cfile> (filename or url) under cursor to clipboard
vim.keymap.set(
  "n",
  "cu",
  [[<Cmd>let [@+, @*] = [expand('<cfile>'), expand('<cfile>')]<Bar>echo 'Copied: ' @*<CR>]],
  { silent = true }
)

-- Copy yanked text to clipboard
vim.keymap.set("n", "cY", [[<Cmd>let [@+, @*] = [@", @"]<CR>]], { silent = true })

-- Paste from clipboard
vim.keymap.set("n", "cp", [["+p]], { silent = true })
vim.keymap.set("n", "cP", [["+P]], { silent = true })
vim.keymap.set("n", "cgp", [["+gp]], { silent = true })
vim.keymap.set("n", "cgP", [["+gP]], { silent = true })
vim.keymap.set("n", "c=p", [[o<Esc>"+pm``[=`]``^]], { silent = true })
vim.keymap.set("n", "c=P", [[O<Esc>"+Pm``[=`]``^]], { silent = true })
vim.keymap.set("n", "c=v", [[<Cmd>set paste<CR>"+p<Cmd>set nopaste<CR>]], { silent = true })
vim.keymap.set("n", "c=V", [[<Cmd>set paste<CR>"+P<Cmd>set nopaste<CR>]], { silent = true })

-- CTRL-V: Bracketed Paste in Insert mode
vim.keymap.set("i", "<C-v>", "<C-g>u<Cmd>set paste<CR><C-r>+<Cmd>set nopaste<CR>", { silent = true })
-- vim.keymap.set("i", "<C-v>", "<C-g>u<C-r><C-o>+", { silent = true })

-- Search and Replace
vim.keymap.set("n", "<Leader>R", ":%s//gc<Left><Left><Left>")
vim.keymap.set("n", "<Leader>sr", ":%s/<C-r><C-w>//gc<Left><Left><Left>")
vim.keymap.set("n", "<Leader>sx", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]])

vim.keymap.set("x", "<Leader>R", [[:s/\%V/gc<Left><Left><Left>]])
vim.keymap.set(
  "x",
  "<Leader>sr",
  [["vy:%s/<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>//gc<Left><Left><Left>]]
)
vim.keymap.set(
  "x",
  "<Leader>sx",
  [["vy:%s/\<<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>\>//gc<Left><Left><Left>]]
)

--- Search and Replace entries with same mappings in quickfix/locationlist with :cfdo and :lfdo
vim.api.nvim_create_autocmd("FileType", {
  group = "MyAutoCmd",
  pattern = "qf",
  callback = function(event)
    local cmd = ":silent " .. (vim.fn.getwininfo(vim.fn.win_getid())[1]["loclist"] == 1 and "lfdo" or "cfdo")

    vim.keymap.set("n", "<Leader>R", cmd .. " %s//eg<Left><Left><Left>", { buffer = event.buf })
    vim.keymap.set("n", "<Leader>sr", cmd .. " %s/<C-r><C-w>//eg<Left><Left><Left>", { buffer = event.buf })
    vim.keymap.set("n", "<Leader>sr", cmd .. [[ %s/\<<C-r><C-w>\>//eg<Left><Left><Left>]], { buffer = event.buf })
    vim.keymap.set(
      "x",
      "<Leader>sr",
      [["vy]]
        .. cmd
        .. [[ %s/<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>//eg<Left><Left><Left>]],
      { buffer = event.buf }
    )
    vim.keymap.set(
      "x",
      "<Leader>sx",
      [["vy]]
        .. cmd
        .. [[ %s/\<<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>\>//eg<Left><Left><Left>]],
      { buffer = event.buf }
    )
    vim.keymap.set("x", "<Leader>R", "<Leader>sr", { buffer = event.buf, remap = true })
  end,
})

-- Open Quickfix & LocationList
-- vim.keymap.set("n", "<Leader>Q", "<Cmd>copen<CR>", { silent = true })
-- vim.keymap.set("n", "<Leader>W", "<Cmd>cwindow<CR>", { silent = true })

-- Buffer-related mappings
-- gl: Go to Last buffer
vim.keymap.set("n", "gl", "<Cmd>buffer#<CR>", { silent = true })

-- Edit file from buffer folder
vim.keymap.set("n", "<C-w><C-e>", ":edit <C-r>=fnameescape(expand('%:p:~:.:h')) . '/'<CR>")

-- Edit buffer
vim.keymap.set("n", "<C-w>e", ":edit<Space>")

-- Yank whole buffer to clipboard
vim.keymap.set("n", "<Leader>by", "<Cmd>%y+<CR>", { silent = true })

-- Reload buffer
-- vim.keymap.set("n", "<Leader>be", "<Cmd>confirm edit<CR>", { silent = true })

-- Save/Write buffer
-- vim.keymap.set({ "n", "v" }, "<Leader>w", "<Cmd>update<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "<Leader>bw", "<Cmd>update<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "<Leader>bu", "<Cmd>update<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "<C-s>", "<Cmd>update<CR>", { silent = true })
vim.keymap.set("i", "<C-s>", "<Cmd>update<CR><Esc>", { remap = true })

-- Save and Quit buffer
-- vim.keymap.set({ "n", "v" }, "<Leader>x", "<Cmd>xit<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "<Leader>bx", "<Cmd>xit<CR>", { silent = true })

-- Unload buffer and delete it from the buffer list
vim.keymap.set("n", "<Leader>bk", "<Cmd>confirm bdelete<CR>", { silent = true })

-- Exit Vim. Bring up a prompt when some buffers have been changed
-- vim.keymap.set("n", "ZE", "<Cmd>confirm qall<CR>", { silent = true })

-- Insert date/time
vim.keymap.set("i", "<C-x>d", "<C-r>=strftime('%Y-%m-%d')<CR>", { silent = true })
vim.keymap.set("i", "<C-x>c", "<C-r>=strftime('%c')<CR>", { silent = true })
-- RFC822 Format
vim.keymap.set("i", "<C-x>r", "<C-r>=strftime('%a, %d %b %Y %H:%M:%S %z')<CR>", { silent = true })
-- ISO8601 / W3C Format
vim.keymap.set("i", "<C-x>t", "<C-r>=strftime('%Y-%m-%dT%T%z')<CR>", { silent = true })

-- https://vimways.org/2018/death-by-a-thousand-files/
vim.keymap.set("n", "<C-w>e", ":find **/*")
vim.keymap.set("n", "<C-w>E", ":edit **/*")

-- :help :DiffOrig
if vim.fn.exists(":DiffOrig") ~= 2 then
  vim.api.nvim_create_user_command(
    "DiffOrig",
    [[vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis]],
    {}
  )
end

-- Trim trailing whitespace
vim.api.nvim_create_user_command(
  "TrimWhitespace",
  [[silent execute (&readonly ? 'echo' : printf('keeppatterns keepjumps keepalt %s,%ssubstitute/\s\+$//e', <line1>, <line2>))]],
  { bar = true, range = "%" }
)
vim.keymap.set("n", "<Leader>bw", "<Cmd>TrimWhitespace<Bar>update<CR>", { silent = true })
vim.keymap.set("v", "<Leader>bw", ":TrimWhitespace<Bar>update<CR>gv", { silent = true })

-- Handle large file
vim.g.zero_vim_large_file = vim.g.zero_vim_large_file or (1024 * 1024 * 1) -- 1 MB
vim.g.zero_vim_undoreload = vim.go.undoreload

vim.api.nvim_create_autocmd("BufReadPre", {
  group = "MyAutoCmd",
  pattern = "*",
  callback = function(opts)
    vim.opt_global.eventignore:remove("FileType")
    vim.opt_global.undoreload = vim.g.zero_vim_undoreload

    local bufnr = opts.buf or vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local ok, stats = pcall(vim.loop.fs_stat, bufname)
    local fsize = (ok and stats and stats.size) or 0

    if
      string.match(bufname, "[-_.]min%.js$")
      or string.match(bufname, "[-_.]min%.css$")
      or string.match(bufname, "[-_.]min%.scss$")
      or fsize > vim.g.zero_vim_large_file
    then
      vim.opt_global.eventignore:append("FileType")
      vim.opt_global.undoreload = 0

      vim.cmd("syntax clear")

      vim.api.nvim_buf_set_option(bufnr, "swapfile", false)
      vim.api.nvim_buf_set_option(bufnr, "bufhidden", "unload")
      vim.api.nvim_buf_set_option(bufnr, "undolevels", -1)
      vim.api.nvim_buf_set_option(bufnr, "syntax", "OFF")
      vim.api.nvim_buf_set_option(bufnr, "filetype", "")

      local winid = vim.fn.bufwinid(bufnr)
      vim.api.nvim_win_set_option(winid, "foldenable", false)
      vim.api.nvim_win_set_option(winid, "foldmethod", "manual")
      vim.api.nvim_win_set_option(winid, "wrap", false)
      vim.api.nvim_win_set_option(winid, "list", false)
    end
  end,
})

-- Find project dir from buffer based on root markers
vim.g.zero_vim_file_root_markers = {
  "Gemfile",
  "rebar.config",
  "mix.exs",
  "Cargo.toml",
  "shard.yml",
  "go.mod",
  ".root",
}

vim.g.zero_vim_vcs_root_markers = { ".git", ".hg", ".svn", ".bzr", "_darcs" }

vim.g.zero_vim_root_markers =
  vim.list_extend(vim.deepcopy(vim.g.zero_vim_vcs_root_markers), vim.g.zero_vim_file_root_markers)

vim.g.zero_vim_ignored_root_dirs = {
  "/",
  "/root",
  "/Users",
  "/home",
  "/usr",
  "/usr/local",
  "/opt",
  "/etc",
  "/var",
  vim.fn.expand("~"),
}

function ZeroVim.find_project_dir(starting_dir)
  if vim.fn.empty(starting_dir) == 1 then
    return ""
  end

  local root_dir = ""

  for _, root_marker in ipairs(vim.g.zero_vim_root_markers) do
    if vim.fn.index(vim.g.zero_vim_file_root_markers, root_marker) > -1 then
      root_dir = vim.fn.findfile(root_marker, starting_dir .. ";")
    else
      root_dir = vim.fn.finddir(root_marker, starting_dir .. ";")
    end

    if root_dir == root_marker then
      root_dir = "."
    else
      root_dir = vim.fn.substitute(root_dir, root_marker .. "$", "", "")
    end

    if vim.fn.strlen(root_dir) > 0 then
      root_dir = vim.fn.fnamemodify(root_dir, ":p:h")
      break
    end
  end

  if vim.fn.empty(root_dir) == 1 or vim.fn.index(vim.g.zero_vim_ignored_root_dirs, root_dir) > -1 then
    if vim.fn.index(vim.g.zero_vim_ignored_root_dirs, vim.fn.getcwd()) > -1 then
      root_dir = starting_dir
    elseif vim.fn.stridx(starting_dir, vim.fn.getcwd()) == 0 then
      root_dir = vim.fn.getcwd()
    else
      root_dir = starting_dir
    end
  end

  root_dir = vim.fn.fnamemodify(root_dir, ":p:h")

  return vim.fn.fnamemodify(root_dir, ":p:h:~")
end

function ZeroVim.find_buffer_project_dir()
  return ZeroVim.find_project_dir(vim.fn.expand("%:p:h"))
end

-- <C-r><C-h>: Innsert buffer project dir
vim.keymap.set({ "i", "c" }, "<C-r><C-h>", "<C-r>=v:lua.ZeroVim.find_buffer_project_dir()<CR>")

-- Setup mappings to open specific folders
vim.g.zero_vim_open_folder_mappings = vim.g.zero_vim_open_folder_mappings or vim.empty_dict()

vim.api.nvim_create_autocmd("VimEnter", {
  group = "MyAutoCmd",
  pattern = "*",
  callback = function()
    local cmd

    if vim.fn.exists(":TelescopeFiles") == 2 then
      cmd = "TelescopeFiles"
    elseif vim.fn.exists(":FzfLuaFiles") == 2 then
      cmd = "FzfLuaFiles"
    else
      cmd = "Files"
    end

    for mapping, folder in pairs(vim.g.zero_vim_open_folder_mappings) do
      vim.keymap.set("n", mapping, string.format("<Cmd>%s %s<CR>", cmd, folder), { silent = true })
    end
  end,
})

ZeroVim.find_files = function()
  if LazyHas("telescope.nvim") then
    vim.cmd("Telescope find_files")
  elseif LazyHas("fzf-lua") then
    vim.cmd("FzfLua files")
  else
    vim.cmd("Files")
  end
end

ZeroVim.recent_files = function()
  if LazyHas("telescope.nvim") then
    vim.cmd("Telescope oldfiles")
  elseif LazyHas("fzf-lua") then
    vim.cmd("FzfLua oldfiles")
  else
    vim.cmd("Mru")
  end
end

ZeroVim.live_grep = function()
  if LazyHas("telescope.nvim") then
    vim.cmd("Telescope live_grep")
  elseif LazyHas("fzf-lua") then
    vim.cmd("FzfLua live_grep")
  else
    vim.cmd("Rg!")
  end
end

ZeroVim.open_project = function(path)
  if LazyHas("telescope.nvim") then
    vim.cmd("TelescopeFiles " .. path)
  elseif LazyHas("fzf-lua") then
    vim.cmd("FzfLuaFiles " .. path)
  else
    vim.cmd("Files " .. path)
  end
end

LazySpec({
  {
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    -- https://github.com/nvim-lua/plenary.nvim
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- {
  --   -- Library of 40+ independent Lua modules improving overall Neovim (version 0.8 and higher) experience with minimal effort
  --   -- https://github.com/echasnovski/mini.nvim
  --   "echasnovski/mini.nvim",
  -- },

  -- Core
  {
    -- Make Vim handle line and column numbers in file names with a minimum of fuss
    "wsdjeg/vim-fetch",
    lazy = false,
  },

  {
    -- Helpers for UNIX
    "tpope/vim-eunuch",
    event = "VeryLazy",
    init = function()
      vim.g.eunuch_no_maps = 1
    end,
  },

  {
    -- My Vim helpers
    "phongnh/zero.vim",
    lazy = false,
    event = "VeryLazy",
  },

  {
    -- rsi.vim: Readline style insertion
    "tpope/vim-rsi",
    event = "VeryLazy",
  },

  {
    -- Enable repeating supported plugin maps with "."
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  {
    -- Go forward/backward with square brackets
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    opts = {
      comment = { suffix = "k", options = {} },
      conflict = { suffix = "n", options = {} },
      file = { suffix = "a", options = {} },
      window = { suffix = "" },
    },
  },
})

LazySpec({
  {
    -- A fancy, configurable, notification manager for NeoVim
    -- https://github.com/rcarriga/nvim-notify
    "rcarriga/nvim-notify",
    init = function()
      if not LazyHas("noice.nvim") then
        vim.api.nvim_create_autocmd("User", {
          pattern = "VeryLazy",
          callback = function()
            vim.notify = require("notify")
          end,
        })
      end
    end,
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require("notify")
    end,
  },

  {
    -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
    -- https://github.com/folke/noice.nvim
    "folke/noice.nvim",
    dependencies = {
      -- UI Component Library for Neovim.
      -- https://github.com/MunifTanjim/nui.nvim
      "MunifTanjim/nui.nvim",
    },
    enabled = function()
      return Enabled("noice")
    end,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    init = function()
      vim.o.lazyredraw = false
    end,
  },
})

LazySpec({
  -- Icon provider. Part of 'mini.nvim' library.
  -- https://github.com/echasnovski/mini.icons
  "echasnovski/mini.icons",
  lazy = true,
  enabled = function()
    return vim.g.zero_vim_nerdfont == 1
  end,
  opts = {
    file = {
      [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
      ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      [".code.ignore"] = { glyph = "󰒓", hl = "MiniIconsPurple" },
      [".fdignore"] = { glyph = "󰒓", hl = "MiniIconsPurple" },
      [".ignore"] = { glyph = "󰒓", hl = "MiniIconsPurple" },
      ["ignore"] = { glyph = "󰒓", hl = "MiniIconsPurple" },
      [".env.sample"] = { glyph = "", hl = "MiniIconsPurple" },
      [".envrc"] = { glyph = "", hl = "MiniIconsPurple" },
      ["envrc"] = { glyph = "", hl = "MiniIconsPurple" },
      ["vimrc"] = { glyph = "", hl = "MiniIconsGreen" },
      ["gvimrc"] = { glyph = "", hl = "MiniIconsGreen" },
      ["vimrc.local"] = { glyph = "", hl = "MiniIconsGreen" },
      [".vimrc.local"] = { glyph = "", hl = "MiniIconsGreen" },
      [".editor.vimrc.local"] = { glyph = "", hl = "MiniIconsGreen" },
      ["init.lua.local"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
      [".init.lua.local"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
      [".editor.lua.local"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
    },
    filetype = {
      dotenv = { glyph = "", hl = "MiniIconsYellow" },
    },
  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
})

LazySpec({
  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  -- https://github.com/nvim-lualine/lualine.nvim
  "nvim-lualine/lualine.nvim",
  dependencies = {
    {
      -- A snazzy bufferline for Neovim
      -- https://github.com/akinsho/bufferline.nvim
      "akinsho/bufferline.nvim",
      opts = {
        options = {
          mode = "tabs",
          themable = false,
          diagnostics = false,
          show_duplicate_prefix = false,
          -- separator_style = "slant",
          -- enforce_regular_tabs = true,
          -- always_show_bufferline = false,
          -- auto_toggle_bufferline = false,
        },
      },
    },
    {
      -- My lualine settings
      -- https://github.com/phongnh/lualine-settings.nvim
      "phongnh/lualine-settings.nvim",
      opts = function()
        return {
          show_devicons = vim.g.zero_vim_nerdfont == 1,
        }
      end,
    },
  },
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till statusline loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end

    -- Integrate with vim-visual-multi plugin
    vim.api.nvim_create_autocmd("User", {
      group = "MyAutoCmd",
      pattern = "visual_multi_start",
      callback = function()
        require("lualine").hide({ place = { "statusline" } })
      end,
    })
    vim.api.nvim_create_autocmd("User", {
      group = "MyAutoCmd",
      pattern = "visual_multi_exit",
      callback = function()
        require("lualine").hide({ place = { "statusline" }, unhide = true })
      end,
    })
  end,
  opts = function()
    vim.o.laststatus = vim.g.lualine_laststatus

    vim.g.lualine_powerline_fonts = vim.g.zero_vim_powerline_fonts == 1
    vim.g.lualine_powerline_style = vim.g.lualine_powerline_style or vim.g.zero_vim_powerline_style
    vim.g.lualine_show_branch = vim.g.zero_vim_git_branch == 1
    vim.g.lualine_show_linenr = vim.g.lualine_show_linenr or false
    vim.g.lualine_show_devicons = vim.g.zero_vim_nerdfont == 1

    if not vim.g.lualine_powerline_fonts and not vim.g.lualine_show_devicons then
      vim.g.lualine_powerline_style = "||"
    end

    -- stylua: ignore start
    vim.g.lualine_section_separator_styles = {
      default  = { left = "", right = "" },
      angle    = { left = "", right = "" },
      curvy    = { left = "", right = "" },
      slant    = { left = "", right = "" },
      ["><"]   = { left = "", right = "" },
      [">("]   = { left = "", right = "" },
      [">\\"]  = { left = "", right = "" },
      [">/"]   = { left = "", right = "" },
      [")("]   = { left = "", right = "" },
      [")<"]   = { left = "", right = "" },
      [")\\"]  = { left = "", right = "" },
      [")/"]   = { left = "", right = "" },
      ["\\\\"] = { left = "", right = "" },
      ["\\/"]  = { left = "", right = "" },
      ["\\<"]  = { left = "", right = "" },
      ["\\("]  = { left = "", right = "" },
      ["//"]   = { left = "", right = "" },
      ["/\\"]  = { left = "", right = "" },
      ["/<"]   = { left = "", right = "" },
      ["/("]   = { left = "", right = "" },
      ["||"]   = { left = "",  right = ""  },
    }
    -- stylua: ignore end

    -- stylua: ignore start
    vim.g.lualine_component_separator_styles = {
      default  = { left = "", right = "" },
      angle    = { left = "", right = "" },
      curvy    = { left = "", right = "" },
      slant    = { left = "", right = "" },
      ["><"]   = { left = "", right = "" },
      [">("]   = { left = "", right = "" },
      [">\\"]  = { left = "", right = "" },
      [">/"]   = { left = "", right = "" },
      [")("]   = { left = "", right = "" },
      [")<"]   = { left = "", right = "" },
      [")\\"]  = { left = "", right = "" },
      [")/"]   = { left = "", right = "" },
      ["\\\\"] = { left = "", right = "" },
      ["\\/"]  = { left = "", right = "" },
      ["\\<"]  = { left = "", right = "" },
      ["\\("]  = { left = "", right = "" },
      ["//"]   = { left = "", right = "" },
      ["/\\"]  = { left = "", right = "" },
      ["/<"]   = { left = "", right = "" },
      ["/("]   = { left = "", right = "" },
      ["||"]   = { left = "|", right = "|" },
    }
    -- stylua: ignore end

    -- Disable lualine's require
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local opts = {
      options = {
        icon_enabled = vim.g.lualine_show_devicons,
        theme = "auto",
        component_separators = vim.g.lualine_component_separator_styles[vim.g.lualine_powerline_style],
        section_separators = vim.g.lualine_section_separator_styles[vim.g.lualine_powerline_style],
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "alpha", "dashboard", "ministarter" } },
      },
      sections = {
        lualine_a = {
          "mode",
          "clipboard",
          "paste",
          "spell",
        },
        lualine_b = vim.g.lualine_show_branch and { "branch" } or {},
        lualine_c = vim.list_extend(vim.g.lualine_show_devicons and {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        } or {}, {
          { "filename", path = 1, shorting_target = 40 },
        }),
        lualine_x = { "fileencoding" },
        lualine_y = vim.list_extend(vim.g.lualine_show_linenr and {
          {
            "progress",
            cond = function()
              return vim.api.nvim_win_get_width(0) >= 100
            end,
            -- fmt = function(text, _context)
            --     return vim.api.nvim_win_get_width(0) >= 100 and text or ""
            -- end,
            separator = " ",
            padding = { left = 1, right = 0 },
          },
          {
            "location",
            cond = function()
              return vim.api.nvim_win_get_width(0) >= 100
            end,
            padding = { left = 0, right = 1 },
          },
        } or {}, { "indent" }),
        lualine_z = {
          { "filetype", icons_enabled = false },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filename", path = 3, shorting_target = 40 },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {
        "nrrwrgn",
        "netrw",
        "oil",
        "nvim-tree",
        "neo-tree",
        "fugitive",
        "fugitiveblame",
        "gv",
        "gitcommit",
        "fzf",
        "undotree",
        "diff",
        "tagbar",
        "ctrlsf",
        "ctrlsf-preview",
        "mason",
        "lazy",
        "man",
        "quickfix",
        "help",
        "terminal",
      },
      tabline = LazyHas("bufferline.nvim") and {} or {
        lualine_a = {
          {
            "tabs",
            tab_max_length = 30,
            max_length = function()
              return vim.o.columns * 2 / 3
            end,
            mode = 2,
            path = 0,
            use_mode_colors = false,
            tabs_color = {
              active = "lualine_a_normal",
              inactive = "lualine_b_normal",
            },
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }

    return opts
  end,
})

LazySpec({
  -- A Lua powered greeter like vim-startify / dashboard-nvim
  -- https://github.com/goolord/alpha-nvim
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = function()
    return Enabled("dashboard", "alpha")
  end,
  opts = function()
    local startify = require("alpha.themes.startify")
    startify.section.header.val = {}
    -- startify.section.mru.val = { { type = "padding", val = 0 } }
    startify.file_icons.enabled = vim.g.zero_vim_nerdfont == 1
    startify.mru_opts.ignore = function(path, ext)
      if vim.tbl_contains({ "fugitiveblame", "gitcommit", "gitrebase", "help" }, ext) then
        return true
      end
      for _, pattern in ipairs({
        "^/usr/",
        "^/opt/",
        "^/etc/",
        "^/var/",
        "^/tmp/",
        "^/private/",
        "[.]git/",
        "/?[.]gems/",
        "[.]vim/plugged/",
        "[.]fugitiveblame$",
        "COMMIT_EDITMSG$",
        "git-rebase-todo$",
      }) do
        if string.find(path, pattern) then
          return true
        end
      end
      return false
    end
    return startify.config
  end,
  config = function(_, opts)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(opts)
  end,
})

LazySpec({
  -- Vim dashboard
  -- https://github.com/nvimdev/dashboard-nvim
  "nvimdev/dashboard-nvim",
  lazy = false,
  enabled = function()
    return not Enabled("dashboard", "alpha") and not Enabled("dashboard", "mini.starter") and Enabled("dashboard")
  end,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      group = "MyAutoCmd",
      pattern = { "dashboard" },
      callback = function()
        vim.b.miniindentscope_disable = true
        vim.opt_local.ruler = false
      end,
    })
  end,
  opts = function()
    local build_shortcuts = function()
      local icons = {
        new_file = " ",
        recent_files = " ",
        find_files = " ",
        live_grep = " ",
        lazy = " ",
        update = " ",
        quit = " ",
      }
      if vim.g.zero_vim_nerdfont == 1 then
        icons = {
          new_file = "  ",
          recent_files = "  ",
          find_files = "  ",
          live_grep = "  ",
          lazy = "󰒲  ",
          update = "󰊳  ",
          quit = "  ",
        }
      end
      local shortcuts = {
        -- stylua: ignore start
        { desc = "New File",     icon = icons.new_file,     action = "enew",                       key = "e" },
        { desc = "Find Files",   icon = icons.find_files,   action = "lua ZeroVim.find_files()",   key = "f" },
        { desc = "Recent Files", icon = icons.recent_files, action = "lua ZeroVim.recent_files()", key = "r" },
        { desc = "Live Grep",    icon = icons.live_grep,    action = "lua ZeroVim.live_grep()",    key = "g" },
        { desc = "Lazy",         icon = icons.lazy,         action = "Lazy",                       key = "l" },
        { desc = "Update",       icon = icons.update,       action = "Lazy update",                key = "u" },
        { desc = "Quit",         icon = icons.quit,         action = "qa",                         key = "q" },
        -- stylua: ignore end
      }
      local length = vim.g.zero_vim_nerdfont == 1 and 40 or 42
      for _, button in ipairs(shortcuts) do
        button.desc = button.desc .. string.rep(" ", length - #button.desc)
        button.key_format = " %s"
      end
      return shortcuts
    end

    return {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(string.rep("\n", 5) .. vim.g.zero_vim_logo .. "\n\n", "\n"),
        center = build_shortcuts(),
        -- footer = {},
      },
    }
  end,
})

LazySpec({
  -- Neovim Lua plugin with fast and flexible start screen. Part of 'mini.nvim' library.
  -- https://github.com/echasnovski/mini.starter
  "echasnovski/mini.starter",
  event = "VimEnter",
  enabled = function()
    return Enabled("dashboard", "mini.starter")
  end,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      group = "MyAutoCmd",
      pattern = { "MiniStarterOpened" },
      callback = function(event)
        vim.b.miniindentscope_disable = true
        vim.keymap.set("n", "j", function()
          MiniStarter.update_current_item("next")
        end, { buffer = event.buf, silent = true })
        vim.keymap.set("n", "k", function()
          MiniStarter.update_current_item("prev")
        end, { buffer = event.buf, silent = true })
      end,
    })
  end,
  opts = function()
    local starter = require("mini.starter")

    return {
      evaluate_single = true,
      header = vim.g.zero_vim_logo,
      footer = string.rep(" ", 12) .. os.date(),
      items = {
        -- stylua: ignore start
        { name = "Find Files",    action = "lua ZeroVim.find_files()",   section = "Quick links" },
        { name = "Recent Files",  action = "lua ZeroVim.recent_files()", section = "Quick links" },
        { name = "Grep Text",     action = "lua ZeroVim.live_grep()",    section = "Quick links" },
        { name = "Lazy",          action = "Lazy",                       section = "Quick links" },
        { name = "Update",        action = "Lazy update",                section = "Quick links" },
        { name = "Edit New File", action = "enew",                       section = "Built-in"    },
        { name = "Quit",          action = "qa",                         section = "Built-in"    },
        -- stylua: ignore end
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning("center", "center"),
      },
    }
  end,
  config = function(_, opts)
    -- close Lazy and re-open when starter is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local starter = require("mini.starter")
    starter.setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function(event)
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local pad_footer = string.rep(" ", 2)
        starter.config.footer = pad_footer
          .. "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        -- INFO: based on @echasnovski's recommendation (thanks a lot!!!)
        if vim.bo[event.buf].filetype == "ministarter" then
          pcall(starter.refresh)
        end
      end,
    })
  end,
})

LazySpec({
  -- BufExplorer Plugin for Vim
  -- https://github.com/jlanzarotta/bufexplorer
  "jlanzarotta/bufexplorer",
  enabled = function()
    return Enabled("buffer-explorer")
  end,
  cmd = { "ToggleBufExplorer" },
  keys = {
    { "gb", "<Cmd>ToggleBufExplorer<CR>", desc = "Toggle BufExplorer" },
  },
  init = function()
    vim.g.bufExplorerDisableDefaultKeyMapping = 1
    vim.g.bufExplorerShowDirectories = 0
    vim.g.bufExplorerShowRelativePath = 1
  end,
})

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_winsize = -35
vim.g.netrw_preview = 1
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+,(^\\|\\ss\\)ntuser\\.\\S\\+"

vim.api.nvim_create_autocmd("FileType", {
  group = "MyAutoCmd",
  pattern = "netrw",
  callback = function(event)
    vim.keymap.set(
      "n",
      "<Plug>NetrwChgwinCheck",
      "<Cmd>let g:netrw_chgwin = get(t:, 'netrw_lexbufnr', -1) == bufnr() ? 2 : -1<CR>",
      { buffer = event.buf, silent = true }
    )
    vim.keymap.set("n", "gq", function()
      if #vim.api.nvim_list_tabpages() == 1 and #vim.api.nvim_tabpage_list_wins(0) == 1 then
        return "<Cmd>SmartQ<CR>"
      elseif vim.t.netrw_lexbufnr == vim.api.nvim_get_current_buf() then
        return "<Cmd>close<CR>"
      else
        return "<Cmd>silent! buffer #<CR>"
      end
    end, { buffer = event.buf, silent = true, expr = true, nowait = true })
    vim.keymap.set("n", "gl", function()
      if vim.t.netrw_lexbufnr == vim.api.nvim_get_current_buf() then
        return "<Cmd>SmartQ<CR>"
      else
        return "<Cmd>silent! buffer #<CR>"
      end
    end, { buffer = event.buf, silent = true, expr = true, nowait = true })
    vim.keymap.set("n", "qq", "gq", { buffer = event.buf, remap = true })
    vim.keymap.set("n", "q", "gq", { buffer = event.buf, remap = true })
    vim.keymap.set("n", "H", "u", { buffer = event.buf, remap = true })
    vim.keymap.set("n", "h", "-^", { buffer = event.buf, remap = true })
    vim.keymap.set("n", "l", "<CR>", { buffer = event.buf, remap = true })
  end,
})

vim.keymap.set("n", "<Leader>e", "<Cmd>Lexplore<CR>", { silent = true })
vim.keymap.set("n", "<Leader>E", "<Cmd>Explore .<CR>", { silent = true })
vim.keymap.set("n", "<Leader>bf", "<Cmd>Explore<CR>", { silent = true })

LazySpec({
  -- Neovim file explorer: edit your filesystem like a buffer
  -- https://github.com/stevearc/oil.nvim
  "stevearc/oil.nvim",
  enabled = function()
    return Enabled("explorer", "oil")
  end,
  cmd = { "Oil" },
  keys = {
    { "<Leader>e", "<Cmd>Oil .<CR>", desc = "Toggle Oil" },
    { "<Leader>E", "<Cmd>Oil <C-r>=fnameescape(getcwd())<CR><CR>", desc = "Explorer Oil (cwd)" },
    { "<Leader>bf", "<Cmd>Oil<CR>", desc = "Reveal buffer in Oil" },
  },
  opts = {
    keymaps = {
      ["q"] = "actions.close",
      ["gq"] = "actions.close",
      ["gy"] = "actions.copy_entry_path",
      ["g:"] = "actions.open_cmdline",
      ["<C-d>"] = "actions.preview_scroll_down",
      ["<C-u>"] = "actions.preview_scroll_up",
    },
  },
})

LazySpec({
  -- Navigate and manipulate file system. Part of 'mini.nvim' library.
  -- https://github.com/echasnovski/mini.nvim
  "echasnovski/mini.files",
  enabled = function()
    return Enabled("explorer", "mini.files")
  end,
  keys = {
    {
      "<Leader>e",
      function()
        require("mini.files").open(vim.fn.getcwd(), true)
      end,
    },
    {
      "<Leader>E",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
    },
    {
      "<Leader>bf",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
    },
  },
  opts = {
    windows = {
      preview = false,
      width_focus = 30,
      width_preview = 30,
    },
  },
})

LazySpec({
  -- Neovim plugin to manage the file system and other tree like structures.
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    "nvim-lua/plenary.nvim",
    -- UI Component Library for Neovim.
    "MunifTanjim/nui.nvim",
    {
      -- This plugins prompts the user to pick a window and returns the window id of the picked window
      -- https://github.com/s1n7ax/nvim-window-picker
      "s1n7ax/nvim-window-picker",
      event = "VeryLazy",
      opts = {
        hint = "statusline-winbar",
        picker_config = {
          statusline_winbar_picker = {
            selection_display = function(char, windowid)
              return "%#Pmenu#%=" .. char .. ": %f" .. "%="
            end,
            use_winbar = "smart",
          },
        },
        filter_rules = {
          autoselect_one = true,
          include_current_win = false,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "qf" },
            buftype = { "terminal", "quickfix" },
          },
        },
      },
    },
  },
  enabled = function()
    return not Enabled("explorer", "oil")
      and not Enabled("explorer", "mini.files")
      and not Enabled("explorer", "nvim-tree")
      and Enabled("explorer")
  end,
  cmd = { "Neotree" },
  keys = {
    { "<Leader>e", "<Cmd>Neotree left toggle<CR>", desc = "Toggle NeoTree" },
    { "<Leader>E", "<Cmd>Neotree float toggle<CR>", desc = "Toggle floating NeoTree" },
    { "<Leader>bf", "<Cmd>Neotree reveal<CR>", desc = "Reveal buffer in NeoTree" },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
  end,
  opts = {
    sources = { "filesystem", "buffers", "git_status" },
    enable_git_status = false,
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    default_component_configs = {
      indent = {
        with_expanders = true,
      },
    },
    commands = {
      copy_path_to_clipboard = function(state)
        local node = state.tree:get_node()
        if node.type == "message" then
          return
        end
        local path = node:get_id()
        vim.fn.setreg("+", path, "c")
        require("neo-tree.log").info("Copied '" .. path .. "' to clipboard")
      end,
    },
    window = {
      mappings = {
        ["<Space>"] = "none",
        ["l"] = "open",
        ["h"] = "close_node",
        -- ["<Tab>"] = "next_source",
        -- ["<S-Tab>"] = "prev_source",
        ["O"] = { "toggle_preview", config = { use_float = false } },
        ["Y"] = "copy_path_to_clipboard",
      },
    },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        never_show = {
          ".DS_Store",
        },
      },
    },
  },
})

LazySpec({
  -- https://github.com/nvim-telescope/telescope.nvim
  -- Find, Filter, Preview, Pick. All lua, all the time.
  "nvim-telescope/telescope.nvim",
  dependencies = {
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    "nvim-lua/plenary.nvim",
    {
      -- FZF sorter for telescope written in c
      "nvim-telescope/telescope-fzf-native.nvim",
      -- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      build = "make",
    },
    {
      -- FZY style sorter that is compiled
      "nvim-telescope/telescope-fzy-native.nvim",
      enabled = function()
        return false
      end,
    },
    {
      -- Integration with github cli
      "nvim-telescope/telescope-github.nvim",
      enabled = function()
        return false
      end,
    },
    -- Fly through your tabs in NeoVim
    "LukasPietzschmann/telescope-tabs",
  },
  enabled = function()
    return Enabled("finder", "telescope")
  end,
  init = function()
    vim.g.telescope_find_tool = vim.g.zero_vim_find_tool
    vim.g.telescope_find_tool = (vim.g.telescope_find_tool == "rg" and vim.fn.executable("rg")) and "rg" or "fd"
    vim.g.telescope_find_no_ignore_vcs = vim.g.zero_vim_find_no_ignore_vcs
    vim.g.telescope_follow_links = vim.g.zero_vim_follow_links
    vim.g.telescope_grep_no_ignore_vcs = vim.g.zero_vim_grep_no_ignore_vcs

    function ZeroVim.build_telescope_find_command()
      local find_commands = {
        fd = { "fd", "--type", "file", "--color", "never", "--hidden" },
        rg = { "rg", "--files", "--color", "never", "--ignore-dot", "--ignore-parent", "--hidden" },
      }

      if vim.g.telescope_find_tool == "rg" then
        vim.g.telescope_find_command = find_commands["rg"]
      else
        vim.g.telescope_find_command = find_commands["fd"]
      end

      if vim.g.telescope_follow_links == 1 then
        table.insert(vim.g.telescope_find_command, "-L")
      end
      if vim.g.telescope_find_no_ignore_vcs == 1 then
        table.insert(vim.g.telescope_find_command, "--no-ignore-vcs")
      end

      return vim.g.telescope_find_command
    end

    function ZeroVim.build_telescope_find_all_command()
      local find_all_commands = {
        fd = { "fd", "--type", "file", "--color", "never", "--no-ignore", "--hidden", "--follow" },
        rg = { "rg", "--files", "--color", "never", "--no-ignore", "--hidden", "--follow" },
      }

      if vim.g.telescope_find_tool == "rg" then
        vim.g.telescope_find_all_command = find_all_commands["rg"]
      else
        vim.g.telescope_find_all_command = find_all_commands["fd"]
      end

      return vim.g.telescope_find_all_command
    end

    function ZeroVim.build_telescope_vimgrep_arguments()
      local vimgrep_arguments = {
        "rg",
        "--color=never",
        "-H",
        "--no-heading",
        "-n",
        "--column",
        "-S",
        "--hidden",
        "--trim",
      }

      if vim.g.telescope_follow_links == 1 then
        table.insert(vimgrep_arguments, "-L")
      end
      if vim.g.telescope_grep_no_ignore_vcs == 1 then
        table.insert(vimgrep_arguments, "--no-ignore-vcs")
      end

      vim.g.telescope_vimgrep_arguments = vimgrep_arguments
      return vim.g.telescope_vimgrep_arguments
    end

    vim.api.nvim_create_user_command("TelescopeFiles", function(opts)
      require("telescope.builtin").find_files({ cwd = opts.args })
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("TelescopeAllFiles", function(opts)
      require("telescope.builtin").all_files({ cwd = opts.args })
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("TelescopeRoot", function()
      require("telescope.builtin").root()
    end, {})

    vim.api.nvim_create_user_command("ToggleTelescopeFollowLinks", function()
      if vim.g.telescope_follow_links == 0 then
        vim.g.telescope_follow_links = 1
        print("telescope.nvim follows symlinks!")
      else
        vim.g.telescope_follow_links = 0
        print("telescope.nvim does not follow symlinks!")
      end

      require("telescope").setup({
        defaults = {
          vimgrep_arguments = ZeroVim.build_telescope_vimgrep_arguments(),
        },
        pickers = {
          find_files = {
            find_command = ZeroVim.build_telescope_find_command(),
          },
        },
      })
    end, {})

    require("telescope.builtin").all_files = function(opts)
      opts = opts or {}
      opts.find_command = vim.g.telescope_find_all_command
      require("telescope.builtin").find_files(opts)
    end

    require("telescope.builtin").root = function(opts)
      opts = opts or {}
      opts.cwd = ZeroVim.find_buffer_project_dir()
      require("telescope.builtin").find_files(opts)
    end

    require("telescope.builtin").buffer_dir = function(opts)
      opts = opts or {}
      opts.cwd = "%" .. vim.fn["repeat"](":h", vim.v.count1)
      require("telescope.builtin").find_files(opts)
    end

    vim.keymap.set("n", "yoa", "<Cmd>ToggleTelescopeFollowLinks<CR>", { silent = true })

    vim.keymap.set("n", "<Leader><Leader>", "<Leader>f", { remap = true })

    vim.keymap.set("n", "<Leader>f", "<Cmd>Telescope find_files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>a", "<Cmd>Telescope all_files<CR>", { silent = true })
    vim.keymap.set("n", "<C-p>", "<Cmd>Telescope root<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>p", "<Cmd>Telescope git_files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>o", "<Cmd>Telescope old_files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>O", "<Cmd>Telescope old_files only_cwd=true<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>d", "<Cmd>Telescope buffer_dir<CR>", { silent = true })

    vim.keymap.set("n", [[<Leader>\]], "<Cmd>Telescope tags<CR>", { silent = true })

    -- Buffer-related mappings
    vim.keymap.set("n", "<Leader>bb", "<Cmd>Telescope buffers<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bd", "<Leader>d", { remap = true })
    vim.keymap.set("n", "<Leader>bp", "<Leader>p", { remap = true })
    vim.keymap.set("n", "<Leader>bl", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bt", "<Cmd>Telescope current_buffer_tags<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bo", "<Cmd>Telescope current_buffer_tags<CR>", { silent = true })

    vim.keymap.set("n", "<C-w><C-a>", function()
      require("telescope-tabs").list_tabs()
    end, { silent = true })

    vim.keymap.set("n", "<Leader>;", "<Cmd>Telescope commands<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>:", "<Cmd>Telescope command_history<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>?", "<Cmd>Telescope search_history<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>'", "<Cmd>Telescope marks<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>Y", "<Cmd>Telescope registers<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>q", "<Cmd>cclose<CR><Cmd>Telescope quickfix<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>q", "<Cmd>lclose<CR><Cmd>Telescope loclist<CR>", { silent = true })

    vim.keymap.set(
      "n",
      "<Leader>si",
      [[:<C-u>lua require("telescope.builtin").grep_string({ search = "" })<Left><Left><Left><Left>]]
    )
    vim.keymap.set("n", "<Leader>sc", function()
      require("telescope.builtin").grep_string({ use_regex = true, search = vim.fn["zero#CCword"]() })
    end, { silent = true })
    vim.keymap.set(
      "x",
      "<Leader>sc",
      [[:<C-u>lua require("telescope.builtin").grep_string({ search = vim.fn["zero#Vword"]() })<CR>]],
      { silent = true }
    )
    vim.keymap.set("n", "<Leader>/", "<Cmd>Telescope live_grep<CR>", { silent = true })
    vim.keymap.set(
      "x",
      "<Leader>/",
      [[:<C-u>lua require("telescope.builtin").grep_string({ search = vim.fn["zero#Vword"]() })<CR>]],
      { silent = true }
    )

    vim.api.nvim_create_autocmd("FileType", {
      group = "MyAutoCmd",
      pattern = "TelescopeResults",
      command = "setlocal startofline",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = "MyAutoCmd",
      pattern = "TelescopePrompt",
      callback = function() end,
    })
  end,
  opts = function()
    ZeroVim.build_telescope_find_command()
    ZeroVim.build_telescope_find_all_command()
    ZeroVim.build_telescope_vimgrep_arguments()
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local sorters = require("telescope.sorters")
    local previewers = require("telescope.previewers")
    return {
      defaults = {
        vimgrep_arguments = vim.g.telescope_vimgrep_arguments,
        prompt_prefix = " ❯ ",
        selection_caret = "» ",
        entry_prefix = "  ",
        layout_strategy = "flex",
        layout_config = {
          width = 0.8,
          height = 0.8,
          horizontal = {
            mirror = false,
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
            preview_height = 0.5,
            preview_cutoff = 35,
          },
          flex = {
            flip_columns = 135,
          },
        },
        cycle_layout_list = { "vertical", "flex" },
        preview = {
          hide_on_startup = vim.g.telescope_preview_hide_on_startup or false,
        },
        winblend = 0,
        disable_devicons = vim.g.zero_vim_nerdfont ~= 1,
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        file_sorter = sorters.get_fuzzy_file,
        file_ignore_patterns = {},
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        buffer_previewer_maker = previewers.buffer_previewer_maker,
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-g>"] = actions.close,
            ["<C-o>"] = { "<Esc>", type = "command" },
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-s>"] = action_layout.cycle_layout_next,
            [";"] = action_layout.toggle_preview,
            ["<C-\\>"] = action_layout.toggle_preview,
            ["<C-y>"] = actions.preview_scrolling_up,
            ["<C-e>"] = actions.preview_scrolling_down,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          },
          n = {
            ["<Esc>"] = actions.close,
            ["<C-g>"] = actions.close,
            ["<C-o>"] = { "i", type = "command" },
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<C-p>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-s>"] = action_layout.cycle_layout_next,
            ["<C-\\>"] = action_layout.toggle_preview,
            ["<C-y>"] = actions.preview_scrolling_up,
            ["<C-e>"] = actions.preview_scrolling_down,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = vim.g.telescope_find_command,
        },
        buffers = {
          sort_lastused = true,
          mappings = {
            i = {
              ["<C-q>"] = actions.delete_buffer,
              ["<C-d>"] = actions.delete_buffer,
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
      },
    }
  end,
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
    if LazyHas("telescope-fzy-native.nvim") then
      require("telescope").load_extension("fzy_native")
    end
    if LazyHas("noice.nvim") then
      require("telescope").load_extension("noice")
    end
  end,
})

LazySpec({
  -- Improved fzf.vim written in lua
  -- https://github.com/ibhagwan/fzf-lua
  "ibhagwan/fzf-lua",
  dependencies = {
    -- A command-line fuzzy finder written in Go
    "junegunn/fzf",
    build = "./install --bin",
  },
  enabled = function()
    return Enabled("finder", "fzf-lua")
  end,
  cmd = { "FzfLua" },
  init = function()
    vim.g.fzf_find_tool = vim.g.zero_vim_find_tool
    vim.g.fzf_find_tool = (vim.g.fzf_find_tool == "rg" and vim.fn.executable("rg") == 1) and "rg" or "fd"
    vim.g.fzf_find_no_ignore_vcs = vim.g.zero_vim_find_no_ignore_vcs
    vim.g.fzf_follow_links = vim.g.zero_vim_follow_links
    vim.g.fzf_grep_no_ignore_vcs = vim.g.zero_vim_grep_no_ignore_vcs

    function ZeroVim.build_fzf_find_command()
      local find_commands = {
        fd = "fd --type file --color never --hidden",
        rg = "rg --files --color never --ignore-dot --ignore-parent --hidden",
      }

      if vim.g.fzf_find_tool == "rg" then
        vim.g.fzf_find_command = find_commands["rg"]
      elseif vim.fn.executable("fd") == 1 then
        vim.g.fzf_find_command = find_commands["fd"]
      elseif vim.fn.executable("rg") == 1 then
        vim.g.fzf_find_command = find_commands["rg"]
        vim.g.fzf_find_tool = "rg"
      end

      vim.g.fzf_find_command = vim.g.fzf_find_command .. (vim.g.fzf_follow_links == 1 and " --follow" or "")
      vim.g.fzf_find_command = vim.g.fzf_find_command
        .. (vim.g.fzf_find_no_ignore_vcs == 1 and " --no-ignore-vcs" or "")

      return vim.g.fzf_find_command
    end

    function ZeroVim.build_fzf_find_all_command()
      local find_all_commands = {
        fd = "fd --type file --color never --no-ignore --hidden --follow",
        rg = "rg --files --color never --no-ignore --hidden --follow",
      }

      if vim.g.fzf_find_tool == "rg" then
        vim.g.fzf_find_all_command = find_all_commands["rg"]
      elseif vim.fn.executable("fd") == 1 then
        vim.g.fzf_find_all_command = find_all_commands["fd"]
      else
        vim.g.fzf_find_all_command = find_all_commands["fd"]
      end

      return vim.g.fzf_find_all_command
    end

    function ZeroVim.build_fzf_rg_opts()
      vim.g.fzf_rg_opts = "--color always -H --no-heading --line-number --smart-case --hidden --max-columns=4096"
      vim.g.fzf_rg_opts = vim.g.fzf_rg_opts .. (vim.g.fzf_follow_links == 1 and " --follow" or "")
      vim.g.fzf_rg_opts = vim.g.fzf_rg_opts .. (vim.g.fzf_grep_no_ignore_vcs == 1 and " --no-ignore-vcs" or "")
      return vim.g.fzf_rg_opts
    end

    require("fzf-lua").all_files = function(opts)
      opts = opts or {}
      opts.cmd = vim.g.fzf_find_all_command
      opts.toggle_ignore_flag = "--no-ignore"
      opts.cwd = vim.fn.empty(opts.cwd) ~= 1 and opts.cwd or vim.fn.getcwd()
      require("fzf-lua").files(opts)
    end

    require("fzf-lua").root = function(opts)
      opts = opts or {}
      opts.cwd = ZeroVim.find_buffer_project_dir()
      opts.cwd = vim.fn.empty(opts.cwd) ~= 1 and opts.cwd or vim.fn.getcwd()
      require("fzf-lua").files(opts)
    end

    require("fzf-lua").buffer_dir = function(opts)
      opts = opts or {}
      opts.cwd = "%" .. vim.fn["repeat"](":h", vim.v.count1)
      require("fzf-lua").files(opts)
    end

    vim.api.nvim_create_user_command("FzfLuaFiles", function(opts)
      require("fzf-lua").files({ cwd = vim.fn.empty(opts.args) ~= 1 and opts.args or vim.fn.getcwd() })
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("FzfLuaAllFiles", function(opts)
      require("fzf-lua").all_files({ cwd = opts.args })
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("FzfLuaRoot", function()
      require("fzf-lua").root()
    end, {})

    vim.api.nvim_create_user_command("ToggleFzfFollowLinks", function()
      if vim.g.fzf_follow_links == 0 then
        vim.g.fzf_follow_links = 1
        print("fzf-lua follows symlinks!")
      else
        vim.g.fzf_follow_links = 0
        print("fzf-lua does not follow symlinks!")
      end

      require("fzf-lua").setup({
        files = {
          cmd = ZeroVim.build_fzf_find_command(),
        },
        grep = {
          rg_opts = ZeroVim.build_fzf_rg_opts(),
        },
      })
    end, {})

    vim.keymap.set("n", "<Leader><Leader>", "<Cmd>FzfLua files formatter=path.filename_first<CR>", { silent = true })

    vim.keymap.set("n", "yoa", "<Cmd>ToggleFzfFollowLinks<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>f", "<Cmd>FzfLua files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>a", "<Cmd>FzfLua all_files<CR>", { silent = true })
    vim.keymap.set("n", "<C-p>", "<Cmd>FzfLua root<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>p", "<Cmd>FzfLua git_files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>o", "<Cmd>FzfLua oldfiles<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>O", "<Cmd>FzfLua oldfiles cwd_only=true<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>d", "<Cmd>FzfLua buffer_dir<CR>", { silent = true })
    vim.keymap.set("n", [[<Leader>\]], "<Cmd>FzfLua tags<CR>", { silent = true })

    -- Buffer-related mappings
    vim.keymap.set("n", "<Leader>bb", "<Cmd>FzfLua buffers<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bd", "<Leader>d", { remap = true })
    vim.keymap.set("n", "<Leader>bp", "<Leader>p", { remap = true })
    vim.keymap.set("n", "<Leader>bl", "<Cmd>FzfLua blines<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bt", "<Cmd>FzfLua btags<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bo", function()
      require("fzf-lua").btags({
        ctags_bin = vim.g.zero_vim_ctags_bin,
        ctags_autogen = true,
        ctags_args = "-f - --sort=no --excmd=combine",
      })
    end, { silent = true })

    vim.keymap.set("n", "<C-w><C-a>", "<Cmd>FzfLua tabs<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>;", "<Cmd>FzfLua commands<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>:", "<Cmd>FzfLua command_history<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>?", "<Cmd>FzfLua search_history<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>'", "<Cmd>FzfLua marks<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>Y", "<Cmd>FzfLua registers<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>q", "<Cmd>cclose<CR><Cmd>FzfLua quickfix<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>l", "<Cmd>lclose<CR><Cmd>FzfLua loclist<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>si", "<Cmd>FzfLua live_grep_glob<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>sc", "<Cmd>FzfLua grep_cword<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sc", ":FzfLua grep_visual<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>/", "<Cmd>FzfLua live_grep<CR>", { silent = true })
    vim.keymap.set(
      "x",
      "<Leader>/",
      [[:<C-u>lua require("fzf-lua").live_grep({ search = vim.fn["zero#Vword"]() })<CR>]],
      { silent = true }
    )
  end,
  opts = function()
    ZeroVim.build_fzf_find_command()
    ZeroVim.build_fzf_find_all_command()
    ZeroVim.build_fzf_rg_opts()
    return {
      defaults = {
        git_icons = false,
      },
      winopts = {
        width = 0.85,
        height = 0.75,
        preview = {
          -- default = "bat",
          hidden = "hidden",
        },
      },
      fzf_opts = {
        ["--layout"] = "default",
      },
      files = {
        cwd_header = false,
        cwd_prompt = true,
        cmd = vim.g.fzf_find_command,
        fd_opts = "--type file --color never --hidden --follow",
        rg_opts = "--files --color never --ignore-dot --ignore-parent --hidden --follow",
        -- formatter = "path.filename_first",
        formatter = "path.dirname_first",
        toggle_ignore_flag = "--no-ignore-vcs",
      },
      grep = {
        rg_opts = vim.g.fzf_rg_opts,
      },
      keymap = {
        builtin = {
          ["<C-z>"] = "toggle-fullscreen",
          ["<C-y>"] = "toggle-preview-cw",
          [":"] = "toggle-preview-wrap",
          [";"] = "toggle-preview",
          ["<F1>"] = "toggle-help",
          ["<F2>"] = "toggle-fullscreen",
          ["<F3>"] = "toggle-preview-wrap",
          ["<F4>"] = "toggle-preview",
          ["<F5>"] = "toggle-preview-ccw",
          ["<F6>"] = "toggle-preview-cw",
          ["<S-Down>"] = "preview-page-down",
          ["<S-Up>"] = "preview-page-up",
          ["<S-Left>"] = "preview-page-reset",
        },
        fzf = {
          [":"] = "toggle-preview-wrap",
          [";"] = "toggle-preview",
        },
      },
    }
  end,
  config = function(_, opts)
    require("fzf-lua").setup(opts)
  end,
})

LazySpec({
  -- fzf ❤️ vim
  -- https://github.com/junegunn/fzf.vim
  "junegunn/fzf.vim",
  dependencies = {
    {
      -- A command-line fuzzy finder written in Go
      -- https://github.com/junegunn/fzf
      "junegunn/fzf",
      build = "./install --bin",
    },
    -- https://github.com/phongnh/fzf-settings.vim
    "phongnh/fzf-settings.vim",
  },
  enabled = function()
    return not Enabled("finder", "telescope") and not Enabled("finder", "fzf-lua")
  end,
  init = function()
    vim.g.fzf_find_tool = vim.g.zero_vim_find_tool
    vim.g.fzf_find_no_ignore_vcs = vim.g.zero_vim_find_no_ignore_vcs
    vim.g.fzf_follow_links = vim.g.zero_vim_follow_links
    vim.g.fzf_grep_no_ignore_vcs = vim.g.zero_vim_grep_no_ignore_vcs
    vim.g.fzf_ctags_bin = vim.g.zero_vim_ctags_bin
    vim.g.fzf_ctags_ignore = vim.g.zero_vim_ctags_ignore

    vim.api.nvim_create_user_command("PFiles", function(opts)
      if opts.bang then
        vim.cmd("Files! " .. ZeroVim.find_buffer_project_dir())
      else
        vim.cmd("Files " .. ZeroVim.find_buffer_project_dir())
      end
    end, { bang = true })

    vim.keymap.set("n", "<Leader><Leader>", "<Leader>f", { remap = true })

    vim.keymap.set("n", "yoa", "<Cmd>ToggleFzfFollowLinks<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>f", "<Cmd>Files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>a", "<Cmd>AFiles<CR>", { silent = true })
    vim.keymap.set("n", "<C-p>", "<Cmd>PFiles<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>p", "<Cmd>GitFiles<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>o", "<Cmd>Mru<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>O", "<Cmd>MruCwd<CR>", { silent = true })
    vim.keymap.set(
      "n",
      "<Leader>d",
      ":<C-u>Files <C-r>=expand('%' . repeat(':h', v:count1))<CR><CR>",
      { silent = true }
    )

    vim.keymap.set("n", [[<Leader>\]], "<Cmd>Tags!<CR>", { silent = true })

    -- Buffer-related mappings
    vim.keymap.set("n", "<Leader>bb", "<Cmd>Buffers<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bd", "<Leader>d", { remap = true })
    vim.keymap.set("n", "<Leader>bp", "<Leader>p", { remap = true })
    vim.keymap.set("n", "<Leader>bl", "<Cmd>BLines<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bt", "<Cmd>BTags<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bo", "<Cmd>BOutline<CR>", { silent = true })

    vim.keymap.set("n", "<C-w><C-a>", "<Cmd>Windows<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>;", "<Cmd>Commands<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>:", "<Cmd>History:<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>?", "<Cmd>History/<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>'", "<Cmd>Marks<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>Y", "<Cmd>Registers<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>q", "<Cmd>Quickfix<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>l", "<Cmd>LocationList<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>si", ":<C-u>RgRaw!<Space>")
    vim.keymap.set("n", "<Leader>sc", ":<C-u>RgRaw! -- <C-r>=zero#shell#CCword()<CR><CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sc", ":<C-u>RgRaw! -- <C-r>=zero#shell#Vword()<CR><CR>", { silent = true })
    vim.keymap.set("n", "<Leader>/", "<Cmd>Rg!<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>/", ":<C-u>RgRaw! -- <C-r>=zero#shell#Vword()<CR><CR>", { silent = true })
  end,
})

LazySpec({
  -- Find And Replace plugin for neovim
  -- https://github.com/MagicDuck/grug-far.nvim
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    { "<Leader>st", "<Cmd>GrugFarToggle<CR>" },
    { "<Leader>sc", "<Cmd>GrugFarCword<CR>" },
    { "<Leader>sc", ":GrugFarVword<CR>", mode = { "v" } },
    { "<Leader>sn", "<Cmd>GrugFarFileType<CR>", mode = { "n", "v" } },
  },
  init = function()
    vim.g.grug_far_main_instance = "main"

    vim.api.nvim_create_user_command("GrugFarToggle", function()
      local grug_far = require("grug-far")
      if not grug_far.has_instance(vim.g.grug_far_main_instance) then
        grug_far.open({ instanceName = vim.g.grug_far_main_instance, startInInsertMode = true })
      else
        grug_far.toggle_instance({ instanceName = vim.g.grug_far_main_instance })
      end
    end, {})

    vim.api.nvim_create_user_command("GrugFarCCword", function(opts)
      local grug_far = require("grug-far")
      local prefills = { search = vim.fn["zero#grepper#Cword"](), paths = opts.args, flags = "--word-regexp" }
      if not grug_far.has_instance(vim.g.grug_far_main_instance) then
        grug_far.open({ instanceName = vim.g.grug_far_main_instance, startInInsertMode = false, prefills = prefills })
      else
        grug_far.update_instance_prefills(vim.g.grug_far_main_instance, prefills, true)
        grug_far.open_instance(vim.g.grug_far_main_instance)
      end
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("GrugFarCword", function(opts)
      local grug_far = require("grug-far")
      local prefills = { search = vim.fn["zero#grepper#Cword"](), paths = opts.args }
      if not grug_far.has_instance(vim.g.grug_far_main_instance) then
        grug_far.open({ instanceName = vim.g.grug_far_main_instance, startInInsertMode = false, prefills = prefills })
      else
        grug_far.update_instance_prefills(vim.g.grug_far_main_instance, prefills, true)
        grug_far.open_instance(vim.g.grug_far_main_instance)
      end
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("GrugFarVword", function(opts)
      local grug_far = require("grug-far")
      local prefills = {
        search = grug_far.get_current_visual_selection(),
        paths = opts.args,
        flags = "--fixed-strings",
      }
      if not grug_far.has_instance(vim.g.grug_far_main_instance) then
        grug_far.open({ instanceName = vim.g.grug_far_main_instance, startInInsertMode = false, prefills = prefills })
      else
        grug_far.update_instance_prefills(vim.g.grug_far_main_instance, prefills, true)
        grug_far.open_instance(vim.g.grug_far_main_instance)
      end
    end, { nargs = "*", range = true, complete = "dir" })

    vim.api.nvim_create_user_command("GrugFarFileType", function(opts)
      local grug_far = require("grug-far")
      local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
      grug_far.open({
        staticTitle = "Find and Replace with File Extension",
        transient = true,
        prefills = {
          filesFilter = ext and ext ~= "" and "*." .. ext or nil,
        },
      })
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_autocmd("FileType", {
      group = "MyAutoCmd",
      pattern = { "grug-far" },
      callback = function(event)
        vim.keymap.set("n", "<LocalLeader>uf", function()
          local state = unpack(require("grug-far").toggle_flags({ "--fixed-strings" }))
          vim.notify(string.format("grug-far: %s `--fixed-strings`", state and "Enabled" or "Disabled"))
        end, { buffer = event.buf, silent = true })
        vim.keymap.set("n", "<LocalLeader>uw", function()
          local state = unpack(require("grug-far").toggle_flags({ "--word-regexp" }))
          vim.notify(string.format("grug-far: %s `--word-regexp`", state and "Enabled" or "Disabled"))
        end, { buffer = event.buf, silent = true })
      end,
    })
  end,
  opts = function()
    return {
      staticTitle = "Find and Replace",
      maxSearchCharsInTitles = 80,
      windowCreationCommand = "leftabove vsplit",
      icons = {
        enabled = vim.g.zero_vim_nerdfont == 1,
      },
      engines = {
        ripgrep = {
          extraArgs = "--smart-case --hidden",
        },
      },
    }
  end,
})

LazySpec({
  -- Helps you win at grep.
  -- https://github.com/mhinz/vim-grepper
  "mhinz/vim-grepper",
  init = function()
    vim.g.grepper = {
      open = 1,
      switch = 1,
      jump = 0,
      prompt = 1,
      prompt_mapping_tool = "<C-\\>",
      stop = 2000,
      repo = vim.list_extend(vim.deepcopy(vim.g.zero_vim_vcs_root_markers), vim.g.zero_vim_file_root_markers),
      tools = { "rg", "git" },
      rg = {
        grepprg = "rg -H --no-heading -n -S --hidden"
          .. (vim.g.zero_vim_follow_links == 1 and " -L" or "")
          .. (vim.g.zero_vim_grep_no_ignore_vcs == 1 and " --no-ignore-vcs" or ""),
        escape = "\\^$.*+?()[]{}|-",
        grepformat = "%f:%l:%c:%m,%f:%l:%m",
      },
    }

    local default_opts = { nargs = "*", complete = "customlist,grepper#complete" }
    local opts = vim.tbl_extend("force", default_opts, { bang = true })
    local visual_opts = vim.tbl_extend("force", opts, { range = true })

    vim.api.nvim_create_user_command("PGrepper", "Grepper -dir repo,filecwd,cwd <args>", default_opts)
    vim.api.nvim_create_user_command("DGrepper", "Grepper -dir file,repo,cwd <args>", default_opts)
    vim.api.nvim_create_user_command("LGrepper", "Grepper -noquickfix <args>", default_opts)
    vim.api.nvim_create_user_command("BGrepper", "LGrepper -buffer <args>", default_opts)

    vim.api.nvim_create_user_command(
      "GrepperCCword",
      "execute 'Grepper' (<bang>0 ? '-noprompt' : '') '-cword' <q-args>",
      opts
    )
    vim.api.nvim_create_user_command(
      "GrepperCword",
      "execute 'Grepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Cword()",
      opts
    )
    vim.api.nvim_create_user_command(
      "GrepperWord",
      "execute 'Grepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Word()",
      opts
    )
    vim.api.nvim_create_user_command(
      "GrepperVword",
      "execute 'Grepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Vword()",
      visual_opts
    )

    vim.api.nvim_create_user_command(
      "LGrepperCCword",
      "execute 'LGrepper' (<bang>0 ? '-noprompt' : '') '-cword' <q-args>",
      opts
    )
    vim.api.nvim_create_user_command(
      "LGrepperCword",
      "execute 'LGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Cword()",
      opts
    )
    vim.api.nvim_create_user_command(
      "LGrepperWord",
      "execute 'LGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Word()",
      opts
    )
    vim.api.nvim_create_user_command(
      "LGrepperVword",
      "execute 'LGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Vword()",
      visual_opts
    )

    vim.api.nvim_create_user_command(
      "PGrepperCCword",
      "execute 'PGrepper' (<bang>0 ? '-noprompt' : '') '-cword' <q-args>",
      opts
    )
    vim.api.nvim_create_user_command(
      "PGrepperCword",
      "execute 'PGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Cword()",
      opts
    )
    vim.api.nvim_create_user_command(
      "PGrepperWord",
      "execute 'PGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Word()",
      opts
    )
    vim.api.nvim_create_user_command(
      "PGrepperVword",
      "execute 'PGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Vword()",
      visual_opts
    )

    vim.keymap.set("n", "<Leader>S", "<Cmd>Grepper<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>S", ":GrepperVword<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>se", "<Cmd>Grepper<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>se", ":GrepperVword<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>s;", "<Cmd>GrepperCCword<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>s;", ":GrepperVword<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>ss", "<Cmd>GrepperCCword!<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>ss", ":GrepperVword!<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>s.", "<Cmd>GrepperWord!<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>sg", "<Cmd>PGrepperCCword! -tool git -grepprg git grep -nIP<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sg", ":PGrepperVword! -tool git<CR>", { silent = true })
    -- Grepper with current buffer dir
    vim.keymap.set("n", "<Leader>sd", "<Cmd>LGrepperCCword! -dir file,repo,cwd<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sd", ":LGrepperVword! -dir file,repo,cwd<CR>", { silent = true })

    -- Buffer search
    vim.keymap.set("n", "<Leader>B", "<Cmd>PGrepper -noquickfix<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>B", ":PGrepperVword -noquickfix<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>b;", "<Cmd>PGrepperCCword -noquickfix<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>b;", ":PGrepperVword -noquickfix<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bs", "<Cmd>PGrepperCCword! -noquickfix<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>bs", ":PGrepperVword! -noquickfix<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>b.", "<Cmd>PGrepperWord! -noquickfix<CR>", { silent = true })
    vim.keymap.set(
      "n",
      "<Leader>bg",
      "<Cmd>PGrepperCCword! -noquickfix -tool git -grepprg git grep -nIP<CR>",
      { silent = true }
    )
    vim.keymap.set("x", "<Leader>bg", ":PGrepperVword! -noquickfix -tool git<CR>", { silent = true })
  end,
})

LazySpec({
  -- An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
  -- https://github.com/dyng/ctrlsf.vim
  "dyng/ctrlsf.vim",
  enabled = function()
    return Enabled("ctrlsf")
  end,
  init = function()
    vim.g.ctrlsf_default_root = "cwd"
    vim.g.ctrlsf_extra_root_markers = {
      ".git",
      ".hg",
      ".svn",
      ".bzr",
      "_darcs",
      "Gemfile",
      "rebar.config",
      "mix.exs",
      "Cargo.toml",
      "shard.yml",
      "go.mod",
    }
    vim.g.ctrlsf_follow_symlinks = vim.g.zero_vim_follow_links
    vim.g.ctrlsf_populate_qflist = vim.g.ctrlsf_populate_qflist or 0
    vim.g.ctrlsf_preview_position = "inside"
    vim.g.ctrlsf_auto_focus = {
      at = "start",
    }

    -- Prefer rg
    if vim.fn.executable("rg") == 1 then
      vim.g.ctrlsf_backend = "rg"
      vim.g.ctrlsf_extra_backend_args = {
        rg = vim.g.zero_vim_grep_no_ignore_vcs == 1 and "--no-ignore-vcs" or "",
      }
    end

    vim.cmd([[
    function! PCtrlSF(...) abort
        try
            let l:current = g:ctrlsf_default_root
            let g:ctrlsf_default_root = 'project+fw'
            call ctrlsf#Search(join(a:000, ' '))
        finally
            let g:ctrlsf_default_root = l:current
        endtry
    endfunction
    ]])

    local opts = { nargs = "*", complete = "customlist,ctrlsf#comp#Completion" }
    local visual_opts = vim.tbl_extend("force", opts, { range = true })

    vim.api.nvim_create_user_command("CtrlSFCCword", "execute 'CtrlSF' <q-args> zero#ctrlsf#CCword()", opts)
    vim.api.nvim_create_user_command("CtrlSFCword", "execute 'CtrlSF' <q-args> zero#ctrlsf#Cword()", opts)
    vim.api.nvim_create_user_command("CtrlSFWord", "execute 'CtrlSF' <q-args> zero#ctrlsf#Word()", opts)
    vim.api.nvim_create_user_command("CtrlSFVword", "execute 'CtrlSF' <q-args> zero#ctrlsf#Vword()", visual_opts)

    vim.api.nvim_create_user_command("PCtrlSF", "call PCtrlSF(<f-args>)", opts)
    vim.api.nvim_create_user_command("PCtrlSFCCword", "call PCtrlSF(<q-args>, zero#ctrlsf#CCword())", opts)
    vim.api.nvim_create_user_command("PCtrlSFCword", "call PCtrlSF(<q-args>, zero#ctrlsf#Cword())", opts)
    vim.api.nvim_create_user_command("PCtrlSFWord", "call PCtrlSF(<q-args>, zero#ctrlsf#Word())", opts)
    vim.api.nvim_create_user_command("PCtrlSFVword", "call PCtrlSF(<q-args>, zero#ctrlsf#Vword())", visual_opts)

    vim.keymap.set("c", "<C-r><C-i>", "<C-r>=zero#InsertInput()<CR>")

    vim.keymap.set("n", "<Leader>F", ":CtrlSF<Space>")
    vim.keymap.set("x", "<Leader>F", ":CtrlSFVword<Space>")
    vim.keymap.set("n", "<Leader>sf", "<Cmd>CtrlSFCCword<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sf", ":CtrlSFVword<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>sw", "<Cmd>CtrlSFWord<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>so", "<Cmd>CtrlSFToggle<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>su", "<Cmd>CtrlSFUpdate<CR>", { silent = true })
    -- CtrlSF with current buffer project / repo
    vim.keymap.set("n", "<Leader>sp", "<Cmd>PCtrlSFCCword<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sp", ":PCtrlSFVword<CR>", { silent = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = "MyAutoCmd",
      pattern = "ctrlsf",
      callback = function(event)
        local move_ctrlsf_main_window = function(position)
          return function()
            vim.g.ctrlsf_position = position
            vim.fn["ctrlsf#Quit"]()
            vim.fn["ctrlsf#Open"]()
            vim.print(string.format("CtrlSF Position: %s!", vim.g.ctrlsf_position))
          end
        end

        vim.keymap.set("n", "<C-w>H", move_ctrlsf_main_window("left"), { buffer = event.buf, silent = true })
        vim.keymap.set("n", "<C-w>J", move_ctrlsf_main_window("bottom"), { buffer = event.buf, silent = true })
        vim.keymap.set("n", "<C-w>K", move_ctrlsf_main_window("top"), { buffer = event.buf, silent = true })
        vim.keymap.set("n", "<C-w>L", move_ctrlsf_main_window("right"), { buffer = event.buf, silent = true })
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = "MyAutoCmd",
      pattern = "ctrlsf-preview",
      callback = function(event)
        vim.schedule(function()
          vim.bo[event.buf].syntax = vim.filetype.match({ filename = vim.b[event.buf].ctrlsf_file }) or ""
        end)
      end,
    })
  end,
})

LazySpec({
  -- Jump to any definition and references IDE madness without overhead
  -- https://github.com/pechorin/any-jump.vim
  "pechorin/any-jump.vim",
  enabled = function()
    return Enabled("any-jump") and vim.fn.executable("rg") == 1
  end,
  cmd = { "AnyJump", "AnyJumpVisual", "AnyJumpBack", "AnyJumpLastResults" },
  init = function()
    -- Disable default any-jump keybindings
    vim.g.any_jump_disable_default_keybindings = true

    -- Any-jump window size & position options
    vim.g.any_jump_window_width_ratio = 0.85
    vim.g.any_jump_window_height_ratio = 0.75
    vim.g.any_jump_window_top_offset = 4

    -- Hide Help section
    vim.g.any_jump_show_help_section = false

    -- Disable search engine ignore vcs untracked files
    vim.g.any_jump_disable_vcs_ignore = false

    -- Custom ignore files
    vim.g.any_jump_ignored_files = vim.g.any_jump_ignored_files or {}

    vim.keymap.set("n", "<Leader>sa", "<Cmd>AnyJump<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sa", ":AnyJumpVisual<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>sb", "<Cmd>AnyJumpBack<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>sl", "<Cmd>AnyJumpLastResults<CR>", { silent = true })
  end,
})

LazySpec({
  -- Navigate your code with search labels, enhanced character motions and Treesitter integration
  -- https://github.com/folke/flash.nvim
  "folke/flash.nvim",
  event = "VeryLazy",
  enabled = function()
    return Enabled("sneak")
  end,
  keys = {
    {
      "s",
      function()
        require("flash").jump()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash",
    },
    {
      "S",
      function()
        require("flash").treesitter()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash Treesitter",
    },
    {
      "r",
      function()
        require("flash").remote()
      end,
      mode = "o",
      desc = "Remote Flash",
    },
    {
      "R",
      function()
        require("flash").treesitter_search()
      end,
      mode = { "x", "o" },
      desc = "Treesitter Search",
    },
  },
  init = function()
    vim.api.nvim_create_user_command("ToggleFlash", function()
      require("flash").toggle()
    end, {})
  end,
  opts = {},
})

LazySpec({
  -- Automatic indentation style detection for Neovim
  -- https://github.com/NMAC427/guess-indent.nvim
  "NMAC427/guess-indent.nvim",
  enabled = function()
    return Enabled("autoindent")
  end,
  opts = {},
})

LazySpec({
  -- Vim plugin for handling tmux panes.
  -- https://github.com/jebaum/vim-tmuxify
  "jebaum/vim-tmuxify",
  enabled = function()
    return vim.env.TMUX ~= nil
  end,
  init = function()
    vim.g.tmuxify_custom_command = "tmux split-window -d -l 30%"
    vim.g.tmuxify_map_prefix = "<Leader>m"
    vim.g.tmuxify_global_maps = 1

    vim.cmd([[
    function! TmuxifySendKeys(keys, bang) abort
        let keys = empty(a:keys) ? input('TxSendKeys> ') : a:keys
        for key in split(keys)
            call tmuxify#pane_send_raw(key, a:bang)
        endfor
    endfunction
    ]])

    -- TxSendText: Send current line or selected lines
    vim.api.nvim_create_user_command(
      "TxSendText",
      "<line1>,<line2>yank m | TxSend<bang>(@m)",
      { bar = true, bang = true, range = true }
    )

    vim.api.nvim_create_user_command("TxSendBuffer", "%TxSendText<bang>", { bar = true, bang = true })
    vim.api.nvim_create_user_command("TxSendLastText", "TxSend<bang>(@m)", { bar = true, bang = true })
    vim.api.nvim_create_user_command(
      "TxSendClear",
      "call tmuxify#pane_send(<q-bang>, 'clear')",
      { bar = true, bang = true }
    )
    vim.api.nvim_create_user_command(
      "TxSendQuit",
      "call TmuxifySendKeys('C-u q C-u C-d C-u C-\\ C-u', <q-bang>) | redraw!",
      { bar = true, bang = true }
    )

    vim.keymap.set("n", "<Leader>mf", "<Cmd>TxSendClear!<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>md", "<Cmd>TxSendQuit!<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>ma", "<Cmd>TxSendLastText!<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>mi", "<Cmd>TxSend!<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>ml", "mm^vg_<Leader>ms`m", { remap = true })
    vim.keymap.set("n", "<Leader>mv", "mmV<Leader>ms`m", { remap = true })
    vim.keymap.set("n", "<Leader>mw", "mmviw<Leader>ms`m", { remap = true })
  end,
  config = function()
    -- Overwrite TxClear and TxSendKey commands
    vim.api.nvim_create_user_command(
      "TxClear",
      "call TmuxifySendKeys('C-u C-l C-u', <q-bang>) | redraw!",
      { bar = true, bang = true }
    )
    vim.api.nvim_create_user_command(
      "TxSendKey",
      "call TmuxifySendKeys(<q-args>, <q-bang>)",
      { nargs = "?", bar = true, bang = true }
    )

    -- Overwrite <Leader>ms to send inner paragraph to Tmux pane
    vim.keymap.set("n", "<Leader>ms", "mmvip<Leader>ms`m", { remap = true, silent = true })
  end,
})

LazySpec({
  -- Open URI with your favorite browser from your most favorite editor
  -- https://github.com/tyru/open-browser.vim
  "tyru/open-browser.vim",
  cmd = {
    "OpenBrowser",
    "OpenBrowserSearch",
    "OpenBrowserSmartSearch",
  },
  keys = {
    {
      "gx",
      "<Plug>(openbrowser-smart-search)",
      mode = { "n", "v" },
      remap = true,
      desc = "Open url or search text in browser",
    },
  },
  init = function()
    vim.g.openbrowser_message_verbosity = 1
    vim.g.openbrowser_allowed_schemes = { "http", "https", "ftp" }

    if vim.fn.empty(vim.env.BROWSER) == 0 then
      vim.g.openbrowser_browser_commands = {
        {
          name = vim.env.BROWSER,
          args = { "{browser}", "{uri}" },
        },
      }
    end

    vim.g.netrw_nogx = 1
  end,
})

LazySpec({
  -- enhanced increment/decrement plugin for Neovim.
  -- https://github.com/monaqa/dial.nvim
  "monaqa/dial.nvim",
  keys = function(_, keys)
    local dial_manipulate = function(direction, mode)
      return function()
        require("dial.map").manipulate(direction, mode)
      end
    end
    return {
      { "<C-a>", dial_manipulate("increment", "normal") },
      { "<C-x>", dial_manipulate("decrement", "normal") },
      { "g<C-a>", dial_manipulate("increment", "gnormal") },
      { "g<C-x>", dial_manipulate("decrement", "gnormal") },
      { "<C-a>", dial_manipulate("increment", "visual"), mode = "v" },
      { "<C-x>", dial_manipulate("decrement", "visual"), mode = "v" },
      { "g<C-a>", dial_manipulate("increment", "gvisual"), mode = "v" },
      { "g<C-x>", dial_manipulate("decrement", "gvisual"), mode = "v" },
    }
  end,
  config = function()
    local augend = require("dial.augend")

    require("dial.config").augends:register_group({
      -- default augends used when no group name is specified
      default = {
        augend.integer.alias.decimal_int,
        augend.constant.alias.bool,
        augend.integer.alias.hex,
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%m/%d/%Y"],
        augend.date.new({
          pattern = "%b %-d %Y",
          default_kind = "day",
          only_valid = true,
        }),
        augend.date.new({
          pattern = "%b %d, %Y",
          default_kind = "day",
          only_valid = true,
        }),
        augend.date.new({
          pattern = "%B %d, %Y",
          default_kind = "day",
          only_valid = true,
        }),
        augend.date.alias["%H:%M:%S"],
        augend.date.alias["%H:%M"],
        augend.date.new({
          pattern = "%a, %d %b %Y %H:%M:%S",
          default_kind = "day",
          only_valid = true,
        }),
        augend.date.new({
          pattern = "%Y-%m-%dT%H:%M:%S",
          default_kind = "day",
          only_valid = true,
        }),
      },
    })
  end,
})

LazySpec({
  -- Better quickfix window in Neovim, polish old quickfix window.
  -- https://github.com/kevinhwang91/nvim-bqf
  "kevinhwang91/nvim-bqf",
  ft = { "qf" },
  opts = {
    auto_resize_height = true,
    preview = {
      auto_preview = false,
      -- border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
      delay_syntax = 80,
      win_height = 12,
      win_vheight = 12,
      winblend = 0,
    },
  },
})

LazySpec({
  -- Maximize current buffer
  -- https://github.com/phongnh/ZoomWin
  "phongnh/ZoomWin",
  event = "VeryLazy",
  keys = {
    { "<C-w>m", "<Plug>ZoomWin", remap = true },
    { "<C-w>m", "<Esc><C-w>mgv", mode = "v", remap = true },
    { "<Leader>bm", "<C-w>m", mode = { "n", "v" }, remap = true },
  },
})

LazySpec({
  -- Master key for exiting or deleting nvim/vim buffers with respect to window splits and tabs.
  -- https://github.com/marklcrns/vim-smartq
  "marklcrns/vim-smartq",
  cmd = { "SmartQ", "SmartQSave", "SmartQWipeEmpty", "SmartQCloseSplits" },
  keys = {
    { "<C-w>q", "<Plug>(smartq_this_force)", remap = true, desc = "Smart quit" },
    { "<Leader>bk", "<Plug>(smartq_this)", remap = true, desc = "Smart quit!" },
  },
  init = function()
    vim.g.smartq_default_mappings = 0
    vim.g.smartq_no_exit = 1
  end,
})

LazySpec({
  {
    -- Better whitespace highlighting for vim
    -- https://github.com/ntpeters/vim-better-whitespace
    "ntpeters/vim-better-whitespace",
    enabled = function()
      return Enabled("whitespace")
    end,
    init = function()
      vim.g.better_whitespace_operator = ""
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 0
      vim.g.strip_whitespace_confirm = 0
      vim.g.strip_only_modified_lines = 1

      vim.g.better_whitespace_filetypes_blacklist = {
        "",
        "terminal",
        "diff",
        "git",
        "gitcommit",
        "ctrlsf",
        "qf",
        "help",
        "markdown",
        "fugitive",
        "fugitiveblame",
        "aerial",
        "alpha",
        "dashboard",
        "ministarter",
        "checkhealth",
        "cmp_menu",
        "lazy",
        "lspinfo",
        "man",
        "mason",
        "TelescopePrompt",
        "toggleterm",
        "Trouble",
        "WhichKey",
      }

      vim.keymap.set("n", "yo<Space>", "<Cmd>ToggleWhitespace<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>bw", "<Cmd>StripWhitespace<CR><Cmd>update<CR>", { silent = true })
      vim.keymap.set("v", "<Leader>bw", ":StripWhitespace<CR><Cmd>update<CR>gv", { silent = true })
    end,
  },
})

LazySpec({
  {
    -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
    config = function(_, opts)
      require("ts_context_commentstring").setup(opts)

      -- if vim.fn.has("nvim-0.10") == 1 then
      --   vim.get_filetype_option = vim.filetype.get_option
      --   vim.filetype.get_option = function(filetype, option)
      --     return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
      --       or vim.get_filetype_option(filetype, option)
      --   end
      -- end
    end,
  },

  {
    -- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
    -- https://github.com/numToStr/Comment.nvim
    "numToStr/Comment.nvim",
    dependencies = {
      -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    enabled = function()
      return Enabled("comment")
    end,
    opts = function()
      return {
        padding = true,
        sticky = true,
        toggler = {
          line = "gcc",
          block = "gbc",
        },
        opleader = {
          line = "gc",
          block = "gb",
        },
        mappings = {
          basic = true,
          extra = false,
          extended = false,
        },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    -- Neovim Lua plugin for fast and familiar per-line commenting. Part of 'mini.nvim' library.
    -- https://github.com/echasnovski/mini.comment
    "echasnovski/mini.comment",
    dependencies = {
      -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    enabled = function()
      return not Enabled("comment")
    end,
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
      mappings = {
        textobject = "gc",
      },
    },
  },

  {
    -- Clarify and beautify your comments using boxes and lines.
    -- https://github.com/LudoPinelli/comment-box.nvim
    "LudoPinelli/comment-box.nvim",
    cmd = {
      "CBllbox",
      "CBlcbox",
      "CBlrbox",
      "CBclbox",
      "CBccbox",
      "CBcrbox",
      "CBrlbox",
      "CBrcbox",
      "CBrrbox",
      "CBd",
      "CBy",
      "CBline",
      "CBlline",
      "CBcline",
      "CBrline",
      "CBllline",
      "CBlcline",
      "CBlrline",
      "CBclline",
      "CBccline",
      "CBcrline",
      "CBrlline",
      "CBrcline",
      "CBrrline",
      "CBcatalog",
    },
    opts = {},
  },
})

LazySpec({
  {
    -- Add/change/delete surrounding delimiter pairs with ease.
    -- https://github.com/kylechui/nvim-surround
    "kylechui/nvim-surround",
    event = "VeryLazy",
    enabled = function()
      return Enabled("surround")
    end,
    opts = {},
  },

  {
    -- Neovim Lua plugin with fast and feature-rich surround actions. Part of 'mini.nvim' library.
    -- https://github.com/echasnovski/mini.surround
    "echasnovski/mini.surround",
    event = "VeryLazy",
    enabled = function()
      return not Enabled("surround")
    end,
    opts = {
      mappings = {
        add = "ys", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        find = "", -- Find surrounding (to the right)
        find_left = "", -- Find surrounding (to the left)
        highlight = "", -- Highlight surrounding
        replace = "cs", -- Replace surrounding
        update_n_lines = "", -- Update `n_lines`
        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
      search_method = "cover_or_next",
    },
    config = function(_, opts)
      require("mini.surround").setup(opts)

      -- Remap adding surrounding to Visual mode selection
      vim.keymap.del("x", "ys")
      vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

      -- Make special mapping for "add surrounding for line"
      vim.keymap.set("n", "yss", "ys_", { remap = true })
    end,
  },
})

LazySpec({
  {
    -- A Vim alignment plugin
    -- https://github.com/junegunn/vim-easy-align
    "junegunn/vim-easy-align",
    event = "VeryLazy",
    enabled = function()
      return Enabled("align")
    end,
    cmd = { "EasyAlign" },
    keys = {
      { "<Enter>", "<Plug>(EasyAlign)", mode = "x", remap = true },
    },
  },

  {
    -- Neovim Lua plugin to align text interactively. Part of 'mini.nvim' library.
    -- https://github.com/echasnovski/mini.align
    "echasnovski/mini.align",
    enabled = function()
      return not Enabled("align")
    end,
    init = function()
      vim.keymap.set("x", "<Enter>", "gA", { remap = true })
    end,
    opts = {
      mappings = {
        start = "ga",
        start_with_preview = "gA",
      },
    },
  },
})

LazySpec({
  {
    -- An all in one plugin for converting text case in Neovim
    -- https://github.com/johmsalas/text-case.nvim
    "johmsalas/text-case.nvim",
    event = "VeryLazy",
    enabled = function()
      return Enabled("change-case")
    end,
    keys = function(_, keys)
      local mappings = {}
      for _, mapping in ipairs({
        { key = "m", fn = "to_pascal_case" },
        { key = "p", fn = "to_pascal_case" },
        { key = "c", fn = "to_camel_case" },
        { key = "_", fn = "to_snake_case" },
        { key = "s", fn = "to_snake_case" },
        { key = "u", fn = "to_constant_case" },
        { key = "U", fn = "to_constant_case" },
        { key = "t", fn = "to_title_case" },
        { key = "<Space>", fn = "to_phrase_case" },
        { key = "-", fn = "to_dash_case" },
        { key = "k", fn = "to_dash_case" },
        { key = "K", fn = "to_title_dash_case" },
        { key = ".", fn = "to_dot_case" },
        { key = "/", fn = "to_path_case" },
      }) do
        table.insert(mappings, {
          "cr" .. mapping.key,
          function()
            require("textcase").current_word(mapping.fn)
          end,
        })
        table.insert(mappings, {
          "ga" .. mapping.key,
          function()
            require("textcase").quick_replace(mapping.fn)
          end,
          mode = "x",
        })
      end

      return vim.list_extend(mappings, keys)
    end,
    opts = {
      default_keymappings_enabled = false,
    },
  },
})

LazySpec({
  -- Multiple cursors plugin for vim/neovim
  -- https://github.com/mg979/vim-visual-multi
  "mg979/vim-visual-multi",
  cmd = { "VMSearch" },
  keys = {
    { "<C-n>", "<Plug>(VM-Find-Under)", nowait = true, remap = true },
    { "<C-n>", "<Plug>(VM-Find-Subword-Under)", mode = "x", nowait = true, remap = true },
  },
  init = function()
    vim.g.VM_custom_remaps = {
      ["<C-p>"] = "N",
      ["<C-x>"] = "q",
      ["<C-c>"] = "<Esc>",
    }

    vim.cmd([[
    function! VM_Start() abort
        doautocmd <nomodeline> User MultipleCursorsStart
    endfunction

    function! VM_Exit() abort
        doautocmd <nomodeline> User MultipleCursorsExit
    endfunction
    ]])

    vim.api.nvim_create_autocmd("User", {
      group = "MyAutoCmd",
      pattern = "visual_multi_mappings",
      callback = function(event)
        vim.keymap.set("i", "<C-c>", "<Esc><Esc>", { nowait = true, buffer = event.buf, remap = true })
      end,
    })
  end,
})

LazySpec({
  -- A Narrow Region Plugin for vim (like Emacs Narrow Region)
  -- https://github.com/chrisbra/NrrwRgn
  "chrisbra/NrrwRgn",
  init = function()
    vim.g.nrrw_topbot_leftright = "belowright"
    vim.g.nrrw_rgn_nomap_nr = 1
    vim.g.nrrw_rgn_nomap_Nr = 1
    vim.g.nrrw_rgn_resize_window = "relative"
    vim.g.nrrw_rgn_rel_min = 50
    vim.g.nrrw_rgn_rel_max = 50

    vim.keymap.set("n", "<Leader>bn", function()
      return vim.fn.exists(":WR") == 2 and "<Cmd>WR!<CR>" or "vip:NR<CR>"
    end, { silent = true, remap = true, expr = true })

    vim.keymap.set("x", "<Leader>bn", function()
      return vim.fn.exists(":WR") == 2 and "<Cmd>WR!<CR>" or ":NR<CR>"
    end, { silent = true, remap = true, expr = true })

    vim.keymap.set({ "n", "x" }, "<Leader>n", "<Leader>bn", { remap = true })

    vim.api.nvim_create_autocmd("VimEnter", {
      group = "MyAutoCmd",
      pattern = "*",
      callback = function()
        vim.api.nvim_create_user_command(
          "NR",
          ":<line1>,<line2>call nrrwrgn#NrrwRgn('', <q-bang>) | set filetype=NrrwRgn",
          { bang = true, range = true }
        )
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = "MyAutoCmd",
      pattern = "NrrwRgn",
      callback = function(event)
        vim.schedule(function()
          vim.bo[event.buf].syntax = vim.filetype.match({ buf = vim.b[event.buf].orig_buf }) or ""
        end)
      end,
    })
  end,
})

LazySpec({
  -- Text edit operators. Part of 'mini.nvim' library.
  -- https://github.com/echasnovski/mini.operators
  "echasnovski/mini.operators",
  opts = {
    evaluate = {
      prefix = "c=",
    },
    exchange = {
      prefix = "cx",
    },
    multiply = {
      prefix = "cm",
    },
    replace = {
      prefix = "gr",
    },
    sort = {
      prefix = "cz",
    },
  },
})

LazySpec({
  -- A simple Vim plugin to switch segments of text with predefined replacements
  -- https://github.com/andrewradev/switch.vim
  "andrewradev/switch.vim",
  dependencies = {
    "tpope/vim-repeat",
  },
  cmd = { "Switch", "SwitchReverse" },
  keys = {
    { "+", "<Plug>(Switch)", remap = true },
    { "_", "<Plug>(SwitchReverse)", remap = true },
  },
  init = function()
    vim.g.switch_mapping = "+"
    vim.g.switch_reverse_mapping = "_"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "MyAutoCmd",
  pattern = "*",
  callback = function(event)
    local langs = require("treesj.langs")["presets"]
    if langs[vim.bo[event.buf].filetype] then
      vim.keymap.set("n", "gS", "<Cmd>TSJSplit<CR>", { buffer = event.buf })
      vim.keymap.set("n", "gJ", "<Cmd>TSJJoin<CR>", { buffer = event.buf })
    else
      vim.keymap.set("n", "gS", "<Cmd>SplitjoinSplit<CR>", { buffer = event.buf })
      vim.keymap.set("n", "gJ", "<Cmd>SplitjoinJoin<CR>", { buffer = event.buf })
    end
  end,
})

LazySpec({
  {
    -- A vim plugin that simplifies the transition between multiline and single-line code
    -- https://github.com/AndrewRadev/splitjoin.vim
    "AndrewRadev/splitjoin.vim",
    init = function()
      vim.g.splitjoin_split_mapping = ""
      vim.g.splitjoin_join_mapping = ""
    end,
  },

  {
    -- Neovim plugin for splitting/joining blocks of code
    -- https://github.com/Wansmer/treesj
    "Wansmer/treesj",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = { "TSJSplit", "TSJJoin", "TSJToggle", "TSJRecursiveToggle" },
    init = function()
      vim.api.nvim_create_user_command("TSJRecursiveToggle", function()
        require("treesj").toggle({ split = { recursive = true } })
      end, {})
    end,
    opts = {
      use_default_keymaps = false,
      max_join_length = 120,
    },
  },
})

LazySpec({
  {
    -- A plugin to visualise and resolve merge conflicts in neovim
    -- https://github.com/akinsho/git-conflict.nvim
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    -- A better Vimdiff Git mergetool
    -- https://github.com/whiteinge/diffconflicts
    "whiteinge/diffconflicts",
    cmd = { "DiffConflicts", "DiffConflictsWithHistory" },
  },
})

LazySpec({
  {
    -- Vim plugin: Create your own text objects
    -- https://github.com/kana/vim-textobj-user
    "kana/vim-textobj-user",
    event = "VeryLazy",
  },
  {
    -- Vim text objects for comments
    -- https://github.com/glts/vim-textobj-comment
    "glts/vim-textobj-comment", -- c
    event = "VeryLazy",
    dependencies = "kana/vim-textobj-user",
    keys = {
      { "ak", "<Plug>(textobj-comment-a)", mode = { "x", "o" }, remap = true },
      { "ik", "<Plug>(textobj-comment-i)", mode = { "x", "o" }, remap = true },
      { "aK", "<Plug>(textobj-comment-big-a)", mode = { "x", "o" }, remap = true },
    },
    init = function()
      vim.g.textobj_comment_no_default_key_mappings = 1
    end,
  },

  {
    -- Extra 'mini.nvim' functionality. Part of 'mini.nvim' library.
    -- https://github.com/echasnovski/mini.extra
    "echasnovski/mini.extra",
    lazy = true,
  },

  {
    -- Neovim Lua plugin to extend and create `a`/`i` textobjects. Part of 'mini.nvim' library.
    -- https://github.com/echasnovski/mini.ai
    "echasnovski/mini.ai",
    dependencies = "echasnovski/mini.extra",
    opts = function()
      require("mini.extra").setup({})
      if LazyHas("nvim-treesitter") then
        return {
          custom_textobjects = {
            o = require("mini.ai").gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }),
            A = require("mini.ai").gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
            f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
            F = require("mini.ai").gen_spec.treesitter({ a = "@call.outer", i = "@call.inner" }),
            c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
            C = require("mini.ai").gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }),
            -- d = { "%f[%d]%d+" },
            d = { "()%d%d%d%d%-%d%d%-%d%d()" },
            e = {
              { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
              "^().*()$",
            },
            t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
            i = require("mini.extra").gen_ai_spec.indent(),
            g = require("mini.extra").gen_ai_spec.buffer(),
            u = require("mini.ai").gen_spec.function_call(),
            U = require("mini.ai").gen_spec.function_call({ name_pattern = "[%w_]" }),
          },
          n_lines = 500,
        }
      else
        return {
          custom_textobjects = {
            -- d = { "%f[%d]%d+" },
            d = { "()%d%d%d%d%-%d%d%-%d%d()" },
            e = {
              { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
              "^().*()$",
            },
            t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
            i = require("mini.extra").gen_ai_spec.indent(),
            g = require("mini.extra").gen_ai_spec.buffer(),
            u = require("mini.ai").gen_spec.function_call(),
            U = require("mini.ai").gen_spec.function_call({ name_pattern = "[%w_]" }),
          },
          n_lines = 500,
        }
      end
    end,
  },
})

LazySpec({
  -- vim match-up: even better % navigate and highlight matching words modern matchit and matchparen.
  -- https://github.com/andymass/vim-matchup
  "andymass/vim-matchup",
  main = "match-up",
  event = "VeryLazy",
  enabled = function()
    return Enabled("matchup")
  end,
  init = function()
    vim.g.matchup_matchpref = {
      html = { tagnameonly = 1 },
      eruby = { tagnameonly = 1 },
    }

    -- Use mappings that are easier to reach
    vim.keymap.set({ "x", "o" }, "ir", "i%", { remap = true })
    vim.keymap.set({ "x", "o" }, "ar", "a%", { remap = true })
    -- Jump between matching words
    vim.keymap.set({ "n", "x", "o" }, "g<Space>", "g%", { remap = true })
    -- Jump to open and close words
    vim.keymap.set({ "n", "x", "o" }, "[w", "[%", { remap = true })
    vim.keymap.set({ "n", "x", "o" }, "]w", "]%", { remap = true })
    -- Jump inside
    vim.keymap.set({ "n", "x", "o" }, "z%", "z<Space>", { remap = true })

    vim.api.nvim_create_user_command("ShowMatchupInfo", function()
      vim.cmd("MatchupWhereAmI?")
      local current = vim.g.matchup_matchparen_hi_background
      pcall(function()
        vim.g.matchup_matchparen_hi_background = 2
        vim.fn["matchup#matchparen#highlight_surrounding"]()
      end)
      vim.g.matchup_matchparen_hi_background = current
    end, {})

    vim.keymap.set("n", "zz", "zz<Cmd>ShowMatchupInfo<CR>", { silent = true })

    -- Integrate with multiple cursors plugin
    vim.api.nvim_create_autocmd("User", {
      group = "MyAutoCmd",
      pattern = "MultipleCursorsStart",
      command = "NoMatchParen",
    })
    vim.api.nvim_create_autocmd("User", {
      group = "MyAutoCmd",
      pattern = "MultipleCursorsExit",
      command = "DoMatchParen",
    })
  end,
  opts = function()
    return {
      matchparen = {
        enabled = 1,
        hi_surround_always = vim.g.matchup_matchparen_hi_surround_always or 1,
        hi_background = vim.g.matchup_matchparen_hi_background or 0,
        deferred = 1,
        deferred_show_delay = 100, -- 50
        deferred_hide_delay = 500, -- 700
        offscreen = vim.g.matchup_matchparen_offscreen or vim.empty_dict(), -- { method = "popup" }
        pumvisible = 0,
        nomode = "i",
      },
    }
  end,
})

LazySpec({
  -- Foldtext customization in Neovim
  -- https://github.com/bbjornstad/pretty-fold.nvim
  "bbjornstad/pretty-fold.nvim",
  event = "VeryLazy",
  enabled = function()
    return Enabled("foldtext")
  end,
  opts = {},
})

LazySpec({
  {
    -- Neovim Lua plugin to visualize and operate on indent scope. Part of 'mini.nvim' library.
    -- https://github.com/echasnovski/mini.indentscope
    "echasnovski/mini.indentscope",
    event = "LazyFile",
    enabled = function()
      return Enabled("indent-guides", "mini.indentscope")
    end,
    init = function()
      vim.g.miniindentscope_disable = false

      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
          vim.b.miniindentscope_disable = vim.tbl_contains(
            { "terminal", "nofile", "quickfix", "prompt" },
            vim.bo.buftype
          ) or vim.tbl_contains({
            "fzf",
            "help",
            "alpha",
            "dashboard",
            "ministarter",
            "netrw",
            "oil",
            "carbon.explorer",
            "NvimTree",
            "neo-tree",
            "mason",
            "notify",
          }, vim.bo.filetype) or (vim.g.zero_vim_indent_guides ~= 1)
        end,
      })

      vim.api.nvim_create_user_command("ToggleMiniIndentScope", function(args)
        if args.bang then
          vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable
        else
          vim.b.miniindentscope_disable = vim.b.miniindentscope_disable ~= nil and vim.b.miniindentscope_disable
            or vim.g.miniindentscope_disable
          vim.b.miniindentscope_disable = not vim.b.miniindentscope_disable
        end
      end, { bang = true })

      vim.keymap.set("n", "<Leader>bi", "<Cmd>ToggleMiniIndentScope<CR>", { silent = true })
      vim.keymap.set("v", "<Leader>bi", "<Esc><Leader>bigv", { remap = true })
    end,
    opts = function()
      return {
        symbol = "│",
        -- symbol = "┊",
        options = { try_as_border = true },
        draw = {
          -- animation = require("mini.indentscope").gen_animation.none(),
          animation = require("mini.indentscope").gen_animation.linear({ duration = 100, unit = "total" }),
        },
      }
    end,
  },

  {
    -- Indent guides for Neovim
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "LazyFile",
    enabled = function()
      return not Enabled("indent-guides", "mini.indentscope") and Enabled("indent-guides")
    end,
    cmd = { "IBLToggle" },
    keys = {
      { "<Leader>bi", "<Cmd>IBLToggle<CR>" },
      { "<Leader>bi", "<Esc><Leader>bigv", mode = "v", remap = true },
    },
    opts = function()
      return {
        enabled = vim.g.zero_vim_indent_guides == 1,
        indent = {
          char = vim.list_extend({ "│" }, vim.fn.split(vim.fn["repeat"]("┊", 20), "\\zs")),
          tab_char = vim.list_extend({ "│" }, vim.fn.split(vim.fn["repeat"]("┊", 20), "\\zs")),
        },
        scope = { show_start = false, show_end = false },
        whitespace = { remove_blankline_trail = false },
        exclude = {
          filetypes = {
            "fzf",
            "help",
            "alpha",
            "dashboard",
            "ministarter",
            "netrw",
            "oil",
            "carbon.explorer",
            "NvimTree",
            "neo-tree",
            "mason",
            "notify",
          },
          buftypes = { "terminal", "nofile", "quickfix", "prompt" },
        },
      }
    end,
  },
})

LazySpec({
  {
    -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
    -- https://github.com/folke/twilight.nvim
    "folke/twilight.nvim",
    cmd = { "Twilight" },
    keys = {
      { "<Leader>L", "<Cmd>Twilight<CR>", mode = { "n", "x" }, desc = "Toggle Twilight" },
    },
    init = function()
      vim.g.twilight_dimming_alpha = vim.g.twilight_dimming_alpha or 0.5
      vim.api.nvim_create_user_command("TwilightSetAlpha", function(opts)
        vim.g.twilight_dimming_alpha = tonumber(opts.fargs[1]) or 0.5
        require("twilight").setup({ dimming = { alpha = vim.g.twilight_dimming_alpha } })
        vim.cmd("highlight! clear Twilight")
      end, { nargs = 1 })
    end,
    opts = function()
      return {
        dimming = {
          alpha = vim.g.twilight_dimming_alpha,
          inactive = false,
        },
        context = 10,
        treesitter = LazyHas("nvim-treesitter"),
        expand = {
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {},
      }
    end,
  },

  {
    -- Distraction-free writing
    -- https://github.com/junegunn/goyo.vim
    "junegunn/goyo.vim",
    event = "VeryLazy",
    dependencies = {
      -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
      "folke/twilight.nvim",
      {
        -- Hyperfocus-writing
        -- https://github.com/junegunn/limelight.vim
        "junegunn/limelight.vim",
        init = function()
          vim.g.limelight_conceal_ctermfg = 240
          vim.g.limelight_conceal_guifg = "#777777"
          vim.g.limelight_default_coefficient = vim.g.limelight_default_coefficient or 0.5
          vim.g.limelight_priority = -1
        end,
      },
    },
    enabled = function()
      return Enabled("goyo")
    end,
    init = function()
      vim.g.goyo_width = "70%"
      vim.g.goyo_height = vim.g.goyo_height or "85%"
      vim.g.goyo_linenr = 1

      vim.g.goyo_mode_index = 1
      vim.g.goyo_modes = {
        { vim.g.goyo_width, vim.g.goyo_height },
        { 120, vim.g.goyo_height },
        { 100, vim.g.goyo_height },
        { 80, vim.g.goyo_height },
      }

      ZeroVim.goyo = { state = {} }

      ZeroVim.goyo.cycle_mode = function(direction)
        return function()
          vim.g.goyo_mode_index = vim.g.goyo_mode_index + direction
          if vim.g.goyo_mode_index > #vim.g.goyo_modes then
            vim.g.goyo_mode_index = 1
          elseif vim.g.goyo_mode_index < 1 then
            vim.g.goyo_mode_index = #vim.g.goyo_modes
          end
          local goyo_mode = vim.g.goyo_modes[vim.g.goyo_mode_index]
          vim.g.goyo_width = goyo_mode[1]
          vim.g.goyo_height = goyo_mode[2]
          local cmd = string.format("Goyo %sx%s", vim.g.goyo_width, vim.g.goyo_height)
          vim.print(cmd)
          vim.cmd(cmd)
          vim.cmd("redraw")
        end
      end

      ZeroVim.goyo.gitsigns = function(state, entered) end

      if LazyHas("gitsigns.nvim") then
        ZeroVim.goyo.gitsigns = function(state, entered)
          local config = require("gitsigns.config").config
          if entered then
            state.signcolumn = config.signcolumn
            state.numhl = config.numhl
            state.linehl = config.linehl
            config.signcolumn = false
            config.numhl = false
            config.linehl = false
          else
            config.signcolumn = state.signcolumn
            config.numhl = state.numhl
            config.linehl = state.linehl
          end
          require("gitsigns").refresh()
        end
      end

      ZeroVim.goyo.hooks = function(entered)
        if entered then
          vim.api.nvim_create_autocmd("WinResized", {
            group = vim.api.nvim_create_augroup("GoyoHooks", { clear = true }),
            pattern = "*",
            callback = function()
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(goyo-resize)", true, true, true))
            end,
          })
        else
          vim.api.nvim_del_augroup_by_name("GoyoHooks")
        end
      end

      ZeroVim.goyo.statusline = function(entered)
        if entered then
          require("lualine").hide({ place = { "statusline" } })
        end
      end

      ZeroVim.goyo.maps = function(state, entered)
        if entered then
          state["<C-w>r"] = vim.fn.maparg("<C-w>r", "n", 0, 1)
          state["<C-w><C-r>"] = vim.fn.maparg("<C-w><C-r>", "n", 0, 1)
          state["<C-w>o"] = vim.fn.maparg("<C-w>o", "n", 0, 1)
          state["<C-w><C-o>"] = vim.fn.maparg("<C-w><C-o>", "n", 0, 1)
          state["<C-w>m"] = vim.fn.maparg("<C-w>m", "n", 0, 1)
          state["<C-w>M"] = vim.fn.maparg("<C-w>M", "n", 0, 1)
          vim.keymap.set("n", "<C-w>r", "<C-w>=", { remap = true })
          vim.keymap.set("n", "<C-w><C-r>", "<C-w>=", { remap = true })
          vim.keymap.set("n", "<C-w>o", "<Plug>(goyo-clph-close)<Plug>(goyo-resize)", { remap = true })
          vim.keymap.set("n", "<C-w><C-o>", "<Plug>(goyo-clph-close)<Plug>(goyo-resize)", { remap = true })
          vim.keymap.set("n", "<C-w>m", ZeroVim.goyo.cycle_mode(1), { silent = true })
          vim.keymap.set("n", "<C-w>M", ZeroVim.goyo.cycle_mode(-1), { silent = true })
        else
          for k, v in pairs(state) do
            if vim.fn.empty(v) == 1 then
              vim.cmd(string.format("silent! unmap %s", k))
            elseif vim.fn.exists("*mapset") then
              vim.fn.mapset("n", 0, v)
            else
              vim.cmd(string.format("%s %s %s", v.noremap == 1 and "nnoremap" or "nmap", v.lhs, v.rhs))
            end
          end
        end
      end

      ZeroVim.goyo.options = function(state, entered)
        if entered then
          state.cursorline = vim.o.cursorline
          state.showmode = vim.o.showmode
          state.scrolloff = vim.o.scrolloff
          vim.o.cursorline = true
          vim.o.showmode = true
          vim.o.scrolloff = 999
        else
          vim.o.cursorline = state.cursorline
          vim.o.showmode = state.showmode
          vim.o.scrolloff = state.scrolloff
        end
      end

      ZeroVim.goyo.on_enter = function(event)
        ZeroVim.goyo.state = {
          gitsigns = {},
          maps = {},
          options = {},
        }
        ZeroVim.goyo.hooks(true)
        ZeroVim.goyo.statusline(true)
        ZeroVim.goyo.gitsigns(ZeroVim.goyo.state.gitsigns, true)
        ZeroVim.goyo.maps(ZeroVim.goyo.state.maps, true)
        ZeroVim.goyo.options(ZeroVim.goyo.state.options, true)
      end

      ZeroVim.goyo.on_leave = function()
        ZeroVim.goyo.hooks(false)
        ZeroVim.goyo.gitsigns(ZeroVim.goyo.state.gitsigns, false)
        ZeroVim.goyo.maps(ZeroVim.goyo.state.maps, false)
        ZeroVim.goyo.options(ZeroVim.goyo.state.options, false)
      end

      vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "GoyoEnter",
        nested = true,
        callback = ZeroVim.goyo.on_enter,
      })

      vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "GoyoLeave",
        nested = true,
        callback = ZeroVim.goyo.on_leave,
      })

      vim.keymap.set(
        "n",
        "<Plug>(goyo-clph-close)",
        "<Cmd>cclose<Bar>lclose<Bar>pclose<Bar>helpclose<CR>",
        { silent = true }
      )

      vim.keymap.set("n", "<Leader><Enter>", "<Cmd>Goyo<CR>", { silent = true })
      vim.keymap.set("v", "<Leader><Enter>", "<Cmd>Goyo<CR>gv", { silent = true })
      vim.keymap.set("n", "<C-w><Enter>", "<Cmd>Goyo<CR>", { silent = true })
      vim.keymap.set("v", "<C-w><Enter>", "<Cmd>Goyo<CR>gv", { silent = true })
    end,
  },

  {
    -- Distraction-free coding for Neovim
    -- https://github.com/folke/zen-mode.nvim
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    dependencies = {
      -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
      "folke/twilight.nvim",
    },
    enabled = function()
      return not Enabled("goyo")
    end,
    cmd = { "ZenMode" },
    keys = {
      { "<Leader><Enter>", "<Cmd>ZenMode<CR>", desc = "Start Zen mode" },
      { "<Leader><Enter>", "<Esc><Leader><Enter>gv", mode = "v", remap = true, desc = "Start Zen mode" },
      -- <C-w><C-m>
      { "<C-w><Enter>", "<Cmd>ZenMode<CR>", desc = "Start Zen mode" },
      { "<C-w><Enter>", "<Esc><C-w><Enter>gv", mode = "v", remap = true, desc = "Start Zen mode" },
    },
    init = function()
      vim.g.zen_mode_height = vim.g.zen_mode_height or 0.85

      ZeroVim.cycle_zen_window_mode = function(direction)
        return function()
          local zen_mode = require("zen-mode")
          local options = require("zen-mode.config").options
          options.current_window_mode = options.current_window_mode + direction
          if options.current_window_mode > #options.window_modes then
            options.current_window_mode = 1
          elseif options.current_window_mode < 1 then
            options.current_window_mode = #options.window_modes
          end
          local window_mode = options.window_modes[options.current_window_mode]
          zen_mode.close()
          zen_mode.open({ window = window_mode })
          vim.print(string.format("ZenMode: %sx%s", window_mode.width, window_mode.height))
        end
      end
    end,
    opts = function()
      return {
        current_window_mode = 1,
        window_modes = {
          { backdrop = 1, width = 0.7, height = vim.g.zen_mode_height },
          { backdrop = 1, width = 150, height = vim.g.zen_mode_height },
          { backdrop = 1, width = 120, height = vim.g.zen_mode_height },
          { backdrop = 1, width = 100, height = vim.g.zen_mode_height },
          { backdrop = 1, width = 80, height = vim.g.zen_mode_height },
        },
        window = {
          backdrop = 1,
          width = 0.7,
          height = vim.g.zen_mode_height,
        },
        plugins = {
          options = {
            enabled = true,
            showmode = true,
          },
          twilight = { enabled = false },
          gitsigns = { enabled = LazyHas("gitsigns.nvim") },
        },
        on_open = function(win)
          vim.wo[win].scrolloff = 999
          vim.wo[win].cursorline = true
          vim.keymap.set("n", "<C-w>m", ZeroVim.cycle_zen_window_mode(1), { silent = true })
          vim.keymap.set("n", "<C-w>M", ZeroVim.cycle_zen_window_mode(-1), { silent = true })
        end,
        on_close = function()
          vim.keymap.del("n", "<C-w>m")
          vim.keymap.del("n", "<C-w>M")
        end,
      }
    end,
  },
})

LazySpec({
  -- The ultimate undo history visualizer for VIM
  -- https://github.com/mbbill/undotree
  "mbbill/undotree",
  enabled = function()
    return Enabled("undotree")
  end,
  cmd = { "UndotreeToggle" },
  keys = {
    { "<Leader>U", "<Cmd>UndotreeToggle<CR>" },
  },
  init = function()
    vim.g.undotree_SplitWidth = 35
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_ShortIndicators = 1
  end,
})

LazySpec({
  {
    -- A Vim plugin that manages your tag files
    -- https://github.com/ludovicchabant/vim-gutentags
    "ludovicchabant/vim-gutentags",
    enabled = function()
      return vim.fn.executable(vim.g.zero_vim_ctags_bin) == 1 and Enabled("ctags")
    end,
    init = function()
      -- Enable only ctags module
      vim.g.gutentags_modules = { "ctags" }

      -- Generate datebases in my cache directory, prevent gtags files polluting my project
      vim.g.gutentags_cache_dir = vim.fn.expand("~/.cache/vim/gutentags")
      vim.g.gutentags_ctags_executable = vim.g.zero_vim_ctags_bin

      -- Universal Ctags
      if vim.fn.filereadable(vim.g.zero_vim_ctags_ignore) == 1 then
        vim.g.gutentags_ctags_exclude = { "@" .. vim.g.zero_vim_ctags_ignore }
      end

      -- Ignored directories
      vim.g.gutentags_exclude_project_root = {
        vim.fn.expand("~/.vim/plugged"),
        vim.fn.expand("~/src"),
        vim.env.HOME,
        "/etc",
        "/opt",
        "/usr",
        "/var",
      }

      -- Ignored file types
      vim.g.gutentags_exclude_filetypes = {
        "html",
        "xml",
        "css",
        "sass",
        "scss",
        "coffee",
        "less",
        "eruby",
        "haml",
        "hamlc",
        "text",
        "git",
        "gitcommit",
        "gitrebase",
        "fugitiveblame",
      }

      -- Define advanced commands
      vim.g.gutentags_define_advanced_commands = 1
    end,
  },

  {
    -- A class outline viewer for Vim
    -- https://github.com/preservim/tagbar
    "preservim/tagbar",
    enabled = function()
      return vim.fn.executable(vim.g.zero_vim_ctags_bin) == 1 and Enabled("tagbar")
    end,
    cmd = { "Tagbar" },
    keys = {
      { "<Leader>T", "<Cmd>Tagbar<CR>" },
    },
    init = function()
      -- https://github.com/preservim/tagbar
      vim.g.tagbar_sort = 0
      vim.g.tagbar_silent = 0
      vim.g.tagbar_show_balloon = 0
      vim.g.tagbar_autofocus = 1
      vim.g.tagbar_autoclose = 0
      vim.g.tagbar_iconchars = { "+", "~" }
      vim.g.tagbar_ctags_bin = vim.g.zero_vim_ctags_bin
    end,
  },
})

LazySpec({
  -- Nvim Treesitter configurations and abstraction layer
  -- https://github.com/nvim-treesitter/nvim-treesitter
  "nvim-treesitter/nvim-treesitter",
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  event = "VeryLazy",
  build = ":TSUpdate",
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
      -- Show code context
      -- https://github.com/nvim-treesitter/nvim-treesitter-context
      "nvim-treesitter/nvim-treesitter-context",
      event = "VeryLazy",
      enabled = false,
      opts = {
        enabled = true,
        mode = "cursor",
        max_lines = 3,
      },
    },
  },
  init = function(plugin)
    -- https://github.com/LazyVim/LazyVim/blob/4cb12312cfa39b38760aab6c060eefca651ab83f/lua/lazyvim/plugins/treesitter.lua#L22
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")

    vim.g.zero_vim_treesitter_ensure_installed = {
      "bash",
      "c",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "vim",
      "vimdoc",
      "query",
      "html",
      "xml",
      "css",
      "scss",
      "json",
      "jsonc",
      "json5",
      "javascript",
      "jsdoc",
      "typescript",
      "tsx",
      "vue",
      "graphql",
      "http",
      "ruby",
      "yaml",
      "ninja",
      "rst",
      "go",
      "gomod",
      "gowork",
      "gosum",
      "rust",
      "ron",
      "toml",
      "v",
      "erlang",
      "elixir",
      "heex",
      "eex",
      "terraform",
      "hcl",
      "dockerfile",
      "puppet",
      "fish",
      "diff",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "comment",
      "todotxt",
      "printf",
      "regex",
    }

    vim.g.zero_vim_treesitter_highlight_disabled =
      vim.list_extend({}, vim.g.zero_vim_treesitter_highlight_disabled or {})
    vim.g.zero_vim_treesitter_indent_disabled =
      vim.list_extend({ "lua", "python" }, vim.g.zero_vim_treesitter_indent_disabled or {})
    vim.g.zero_vim_treesitter_max_filesize = vim.g.zero_vim_treesitter_max_filesize or (100 * 1024) -- 100 KB

    ZeroVim.treesitter_disabled = function(lang, buf)
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > vim.g.zero_vim_treesitter_max_filesize then
        return true
      end
      return false
    end

    -- When in diff mode, we want to use the default vim text objects c & C instead of the treesitter ones.
    local move = require("nvim-treesitter.textobjects.move")
    local configs = require("nvim-treesitter.configs")
    for name, fn in pairs(move) do
      if name:find("goto") == 1 then
        move[name] = function(q, ...)
          if vim.wo.diff then
            local config = configs.get_module("textobjects.move")[name]
            for key, query in pairs(config or {}) do
              if q == query and key:find("[%]%[][cC]") then
                vim.cmd("normal! " .. key)
                return
              end
            end
          end
          return fn(q, ...)
        end
      end
    end
  end,
  opts = function()
    return {
      ensure_installed = vim.g.zero_vim_treesitter_ensure_installed,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          return ZeroVim.treesitter_disabled(lang, buf)
            or vim.tbl_contains(vim.g.zero_vim_treesitter_highlight_disabled, lang)
        end,
        additional_vim_regex_highlighting = { "org" },
      },
      incremental_selection = {
        enable = true,
        disable = ZeroVim.treesitter_disabled,
        keymaps = {
          init_selection = "+",
          node_incremental = "+",
          node_decremental = "_",
          scope_incremental = "^",
        },
      },
      indent = {
        enable = true,
        disable = function(lang, buf)
          return ZeroVim.treesitter_disabled(lang, buf)
            or vim.tbl_contains(vim.g.zero_vim_treesitter_indent_disabled, lang)
        end,
      },
      textobjects = {
        move = {
          enable = true,
          disable = ZeroVim.treesitter_disabled,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]]"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]["] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[["] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[]"] = "@class.outer" },
        },
      },
    }
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    if LazyHas("vim-matchup") then
      -- https://github.com/andymass/vim-matchup
      vim.g.zero_vim_treesitter_matchup_disabled = vim.g.zero_vim_treesitter_matchup_disabled or {}
      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true,
          disable = function(lang, buf)
            return ZeroVim.treesitter_disabled(lang, buf)
              or vim.tbl_contains(vim.g.zero_vim_treesitter_matchup_disabled, lang)
          end,
        },
      })
    end
  end,
})

LazySpec({
  {
    -- emmet for vim: http://emmet.io
    -- https://github.com/mattn/emmet-vim
    "mattn/emmet-vim",
    keys = {
      { "<C-x>,", "<Plug>(emmet-expand-abbr)", mode = "i", silent = true, remap = true },
      { "<C-x>;", "<Plug>(emmet-expand-word)", mode = "i", silent = true, remap = true },
      { "<C-x>a", "<Plug>(emmet-anchorize-url)", mode = "i", silent = true, remap = true },
      { "<C-x>A", "<Plug>(emmet-anchorize-summary)", mode = "i", silent = true, remap = true },
    },
    init = function()
      vim.g.emmet_install_only_plug = 1
      vim.g.user_emmet_mode = "i"
    end,
  },

  {
    -- ragtag.vim: ghetto HTML/XML mappings
    -- https://github.com/tpope/vim-ragtag
    "tpope/vim-ragtag",
    ft = {
      "html",
      "eruby",
      "eelixir",
      "xml",
      "vue",
      "javascriptreact",
      "typescriptreact",
    },
  },
})

LazySpec({
  {
    -- autopairs for neovim written by lua
    -- https://github.com/windwp/nvim-autopairs
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    enabled = function()
      return Enabled("auto-pairs", "autopairs")
    end,
    init = function()
      -- Integrate with multiple cursors plugin
      vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "MultipleCursorsStart",
        callback = function()
          require("nvim-autopairs").disable()
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "MultipleCursorsExit",
        callback = function()
          require("nvim-autopairs").enable()
        end,
      })
    end,
    opts = {
      disable_filetype = { "TelescopePrompt" },
      map_cr = true,
    },
  },

  {
    -- A treesitter supported autopairing plugin with extensions, and much more
    -- https://github.com/altermo/ultimate-autopair.nvim
    "altermo/ultimate-autopair.nvim",
    event = "VeryLazy",
    enabled = function()
      return Enabled("auto-pairs", "ultimate")
    end,
    opts = {},
  },

  {
    -- Neovim Lua plugin to automatically manage character pairs. Part of 'mini.nvim' library.
    -- https://github.com/echasnovski/mini.pairs
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    enabled = function()
      return not Enabled("auto-pairs", "autopairs") and not Enabled("auto-pairs", "ultimate")
    end,
    init = function()
      vim.g.minipairs_disable = false
      -- Integrate with multiple cursors plugin
      vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "MultipleCursorsStart",
        callback = function()
          vim.b.minipairs_disable = true
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "MultipleCursorsExit",
        callback = function()
          vim.b.minipairs_disable = false
        end,
      })
    end,
    opts = {},
  },
})

-- LSP Settings
vim.g.zero_vim_lsp_diagnostics = vim.g.zero_vim_lsp_diagnostics or 0
vim.g.zero_vim_lsp_highlight_references = vim.g.zero_vim_lsp_highlight_references or 0

-- Signs
vim.g.zero_vim_lsp_signs = vim.tbl_extend("force", {
  error = "E>",
  warning = "W>",
  information = "I>",
  hint = "H>",
  message = "M>",
  virtual_text = "<!>",
}, vim.g.zero_vim_lsp_signs or vim.empty_dict())

-- Available Language Servers
vim.g.zero_vim_available_language_servers = {
  ["efm-langserver"] = {
    cmd = { "efm-langserver" },
    filetypes = { "*" },
  },
  deno = {
    cmd = { "deno", "lsp" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  ["typescript-language-server"] = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  pylsp = {
    cmd = { "pylsp" },
    filetypes = { "python" },
  },
  pylyzer = {
    cmd = { "pylyzer", "--server" },
    filetypes = { "python" },
    root_markers = { "setup.py", "tox.ini", "requirements.txt", "Pipfile", "pyproject.toml" },
    workspace_config = {
      python = {
        diagnostics = true,
        inlayHints = true,
        smartCompletion = true,
        checkOnType = false,
      },
    },
  },
  pyre = {
    cmd = { "pyre", "persistent" },
    filetypes = { "python" },
    root_markers = { ".pyre_configuration" },
  },
  pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    workspace_config = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "openFilesOnly",
        },
      },
    },
  },
  ["ruby-lsp"] = {
    cmd = { "ruby-lsp" },
    filetypes = { "ruby" },
    initialization_options = {
      experimentalFeaturesEnabled = "false",
      enabledFeatures = {
        "codeActions",
        "codeLens",
        "completion",
        "definition",
        "diagnostics",
        "documentHighlights",
        "documentLink",
        "documentSymbols",
        "foldingRanges",
        "formatting",
        "hover",
        "inlayHint",
        "onTypeFormatting",
        "selectionRanges",
        "semanticHighlighting",
      },
      formatter = "auto",
    },
    root_markers = { "Gemfile" },
  },
  solargraph = {
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    initialization_options = { diagnostics = true },
    root_markers = { "Gemfile" },
  },
  sorbet = {
    cmd = { "srb", "tc", "--lsp" },
    filetypes = { "ruby" },
    root_markers = { "Gemfile" },
  },
  crystalline = {
    cmd = { "crystalline" },
    filetypes = { "crystal" },
    root_markers = { "shard.yml" },
  },
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go" },
  },
  ["golangci-lint-langserver"] = {
    cmd = { "golangci-lint-langserver" },
    filetypes = { "go" },
  },
  ["rust-analyzer"] = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
  },
  ["erlang-ls"] = {
    cmd = { "erlang-ls" },
    filetypes = { "erlang" },
    root_markers = { "rebar.config" },
  },
  ["elixir-ls"] = {
    cmd = { "elixir-ls" },
    filetypes = { "elixir" },
    root_markers = { "mix.exs" },
  },
  ["terraform-ls"] = {
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform" },
  },
  ["vim-language-server"] = {
    cmd = { "vim-language-server", "--stdio" },
    filetypes = { "vim" },
  },
  ["lua-language-server"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    workspace_config = {
      Lua = {
        color = {
          mode = "Semantic",
        },
        completion = {
          callSnippet = "Disable",
          enable = true,
          keywordSnippet = "Replace",
        },
        develop = {
          debuggerPort = 11412,
          debuggerWait = false,
          enable = false,
        },
        diagnostics = {
          enable = true,
          globals = "",
          severity = {},
        },
        hover = {
          enable = true,
          viewNumber = true,
          viewString = true,
          viewStringMax = 1000,
        },
        runtime = {
          path = { "?.lua", "?/init.lua", "?/?.lua" },
          version = "Lua 5.3",
        },
        signatureHelp = {
          enable = true,
        },
        workspace = {
          ignoreDir = {},
          maxPreload = 1000,
          preloadFileSize = 100,
          useGitIgnore = true,
        },
      },
      ["sumneko-lua"] = {
        enableNvimLuaDev = true,
      },
    },
    semantic_highlight = {},
    root_markers = { ".stylua.toml", "stylua.toml" },
  },
}

vim.g.zero_vim_language_servers = vim.tbl_extend(
  "force",
  vim.g.zero_vim_available_language_servers,
  vim.g.zero_vim_language_servers or vim.empty_dict()
)

function init_language_server()
  local servers = vim.g.zero_vim_language_servers
  for name, server in pairs(vim.g.zero_vim_language_servers) do
    if vim.fn.has_key(vim.g.zero_vim_available_language_servers, name) == 1 then
      local default = vim.g.zero_vim_available_language_servers[name]
      if type(server) == "table" and vim.islist(server) then
        servers[name] = vim.tbl_extend("force", default, { cmd = server })
      elseif type(server) == "table" then
        servers[name] = vim.tbl_extend("force", default, server)
      elseif type(server) == "string" then
        servers[name] = vim.tbl_extend("force", default, { cmd = vim.fn.split(server) })
      end
    end
  end
  vim.g.zero_vim_language_servers = servers
end

init_language_server()

-- Enabled Language Servers
vim.g.zero_vim_enabled_language_servers = vim.tbl_filter(function(name)
  return vim.fn.has_key(vim.g.zero_vim_language_servers, name) == 1
end, vim.g.zero_vim_enabled_language_servers or {})

LazySpec({
  -- {
  --     "williamboman/mason.nvim",
  --     build = ":MasonUpdate",
  --     keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  --     cmd = "Mason",
  --     opts_extend = { "ensure_installed" },
  --     opts = {
  --         ensure_installed = {
  --             "stylua",
  --             "shfmt",
  --         },
  --     },
  -- },
  {
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },

  {
    -- Quickstart configs for Nvim LSP
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
        "williamboman/mason.nvim",
      },
      {
        -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {},
          automatic_installation = false,
        },
      },
    },
    enabled = function()
      return Enabled("lsp")
    end,
    init = function()
      -- Signs
      vim.fn.sign_define(
        "DiagnosticSignError",
        { text = vim.g.zero_vim_lsp_signs.error, texthl = "DiagnosticSignError" }
      )
      vim.fn.sign_define(
        "DiagnosticSignWarn",
        { text = vim.g.zero_vim_lsp_signs.warning, texthl = "DiagnosticSignWarn" }
      )
      vim.fn.sign_define(
        "DiagnosticSignInfo",
        { text = vim.g.zero_vim_lsp_signs.information, texthl = "DiagnosticSignInfo" }
      )
      vim.fn.sign_define("DiagnosticSignHint", { text = vim.g.zero_vim_lsp_signs.hint, texthl = "DiagnosticSignHint" })

      -- Diagnostic Config
      if vim.g.zero_vim_lsp_diagnostics == 1 then
        vim.diagnostic.config({
          underline = true,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            -- severity = { min = vim.diagnostic.severity.WARN },
            prefix = vim.g.zero_vim_lsp_signs.virtual_text,
          },
          signs = true,
          update_in_insert = false,
          severity_sort = vim.g.zero_vim_lsp_diagnostics_severity_sort or false,
        })
      elseif type(vim.diagnostic.disable) == "function" then
        vim.diagnostic.disable()
      else
        vim.diagnostic.config(false)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = "MyAutoCmd",
        callback = function(evt)
          vim.api.nvim_buf_set_option(evt.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

          -- Mappings
          local opts = { buffer = evt.buf, silent = true }
          vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<Leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "g<CR>", vim.lsp.buf.code_action, opts)
          vim.keymap.set("x", "g<CR>", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "g=", vim.lsp.buf.format, opts)
          vim.keymap.set("x", "g=", vim.lsp.buf.format, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "g]", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "g[", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gm", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "go", vim.lsp.buf.document_symbol, opts)
          vim.keymap.set("n", "gO", vim.lsp.buf.workspace_symbol, opts)
          vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "g{", vim.lsp.buf.incoming_calls, opts)
          vim.keymap.set("n", "g}", vim.lsp.buf.outgoing_calls, opts)
          vim.keymap.set("n", "gL", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "L", function()
            vim.diagnostic.set_loclist({ severity_limit = "Warning" })
          end, opts)
          vim.keymap.set("n", "[g", function()
            vim.diagnostic.goto_prev({ severity_limit = "Warning" })
          end, opts)
          vim.keymap.set("n", "]g", function()
            vim.diagnostic.goto_next({ severity_limit = "Warning" })
          end, opts)
          vim.keymap.set("n", "[k", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]k", vim.diagnostic.goto_next, opts)
        end,
      })

      -- ruby-lsp: textDocument/diagnostic support until 0.10.0 is released
      _timers = {}

      function ZeroVim.setup_nvim_lsp()
        if vim.tbl_isempty(vim.g.zero_vim_enabled_language_servers) then
          return
        end

        local make_client_capabilities = function()
          -- https://github.com/hrsh7th/cmp-nvim-lsp
          local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

          -- https://github.com/ms-jpq/coq_nvim
          local has_coq, coq = pcall(require, "coq")

          if has_cmp_nvim_lsp then
            return cmp_nvim_lsp.default_capabilities()
          elseif has_coq then
            return coq.lsp_ensure_capabilities().capabilities
          else
            -- https://github.com/hrsh7th/vim-vsnip/issues/140
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities.textDocument.completion.completionItem.preselectSupport = true
            capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
            capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
            capabilities.textDocument.completion.completionItem.deprecatedSupport = true
            capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
            capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
            capabilities.textDocument.completion.completionItem.resolveSupport = {
              properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
              },
            }
            return capabilities
          end
        end

        local capabilities = make_client_capabilities()

        local lspconfig = require("lspconfig")
        local configs = require("lspconfig/configs")

        -- ruby-lsp: textDocument/diagnostic support until 0.10.0 is released
        local setup_diagnostics = function(client, buffer)
          if require("vim.lsp.diagnostic")._enable then
            return
          end

          local diagnostic_handler = function()
            local params = vim.lsp.util.make_text_document_params(buffer)
            client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
              if err then
                local err_msg = string.format("Diagnostics Error: %s", vim.inspect(err))
                vim.lsp.log.error(err_msg)
              end

              local diagnostic_items = {}
              if result then
                diagnostic_items = result.items
              end

              vim.lsp.diagnostic.on_publish_diagnostics(
                nil,
                vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
                { client_id = client.id }
              )
            end)
          end

          diagnostic_handler() -- to request diagnostics on buffer when first attaching

          vim.api.nvim_buf_attach(buffer, false, {
            on_lines = function()
              if _timers[buffer] then
                vim.fn.timer_stop(_timers[buffer])
              end
              _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
            end,
            on_detach = function()
              if _timers[buffer] then
                vim.fn.timer_stop(_timers[buffer])
              end
            end,
          })
        end

        -- Map server name to lspconfig name
        local nvim_lspconfig_mappings = {
          ["bash-language-server"] = "bashls",
          deno = "denols",
          ["docker-langserver"] = "dockerls",
          ["efm-langserver"] = "efm",
          ["elixir-ls"] = "elixirls",
          ["erlang-ls"] = "erlangls",
          ["golangci-lint-langserver"] = "golangci_lint_ls",
          ["graphql-lsp"] = "graphql",
          ["lua-language-server"] = "lua_ls",
          ["pyright-langserver"] = "pyright",
          ["ruby-lsp"] = "ruby_ls",
          ["rust-analyzer"] = "rust_analyzer",
          ["terraform-ls"] = "terraformls",
          ["terraform-lsp"] = "terraform_lsp",
          ["typescript-language-server"] = "tsserver",
          ["vim-language-server"] = "vimls",
        }

        for _, name in ipairs(vim.g.zero_vim_enabled_language_servers) do
          local server = vim.g.zero_vim_language_servers[name]
          local lspconfig_name = nvim_lspconfig_mappings[name] or name
          local on_attach = function(client, buffer)
            if lspconfig_name == "ruby_ls" then
              setup_diagnostics(client, buffer)
            end
          end
          lspconfig[lspconfig_name].setup({
            cmd = server.cmd,
            filetypes = server.filetypes,
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = server.initialization_options or {
              usePlaceHolders = true,
            },
          })
        end
      end

      ZeroVim.setup_nvim_lsp()
    end,
  },
})

LazySpec({
  {
    -- https://github.com/hrsh7th/vim-vsnip
    "hrsh7th/vim-vsnip",
    dependencies = {
      "hrsh7th/vim-vsnip-integ",
      "rafamadriz/friendly-snippets",
    },
    enabled = false,
    init = function()
      vim.g.vsnip_snippet_dir = vim.fn.expand("~/.vim/vsnip")
      vim.g.vsnip_snippet_dirs = vim.fn.glob("~/.vim/vsnip/*/", 0, 1)
      vim.g.vsnip_filetypes = {
        ruby = { "rdoc", "rake", "rails" },
        javascript = { "javascriptreact" },
        typescript = { "typescriptreact" },
      }

      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        return vim.fn["vsnip#available"](1) == 1 and "<Plug>(vsnip-expand-or-jump)" or ""
      end, { remap = true, expr = true })

      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or ""
      end, { remap = true, expr = true })

      vim.keymap.set("i", "<C-b>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<C-b>"
      end, { remap = true, expr = true })

      vim.keymap.set("s", "<C-b>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or ""
      end, { remap = true, expr = true })

      vim.keymap.set("s", "<CR>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<CR>"
      end, { remap = true, expr = true })

      vim.keymap.set("s", "<Tab>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<Tab>"
      end, { remap = true, expr = true })

      vim.keymap.set("s", "<S-Tab>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<S-Tab>"
      end, { remap = true, expr = true })

      vim.keymap.set({ "i", "s" }, "<C-g><C-e>", function()
        return vim.fn["vsnip#available"](1) == 1 and "<Plug>(vsnip-expand-or-jump)" or ""
      end, { remap = true, expr = true })

      vim.keymap.set({ "i", "s" }, "<C-g><C-n>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or ""
      end, { remap = true, expr = true })

      vim.keymap.set({ "i", "s" }, "<C-g><C-p>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or ""
      end, { remap = true, expr = true })
    end,
  },

  {
    -- https://github.com/L3MON4D3/LuaSnip
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    enabled = false,
    init = function()
      vim.keymap.set(
        { "i", "s" },
        "<C-k>",
        [[luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : ""]],
        { remap = true, expr = true, replace_keycodes = false }
      )

      vim.keymap.set(
        { "i", "s" },
        "<C-j>",
        [[luasnip#jumpable(1) ? "<Plug>luasnip-jump-next" : ""]],
        { remap = true, expr = true, replace_keycodes = false }
      )

      vim.keymap.set(
        "i",
        "<C-b>",
        [[luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<C-b>"]],
        { remap = true, expr = true, replace_keycodes = false }
      )

      vim.keymap.set(
        "s",
        "<C-b>",
        [[luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : ""]],
        { remap = true, expr = true, replace_keycodes = false }
      )

      vim.keymap.set(
        "s",
        "<CR>",
        [[luasnip#jumpable(1) ? "<Plug>luasnip-jump-next" : "<CR>"]],
        { remap = true, expr = true, replace_keycodes = false }
      )

      vim.keymap.set(
        "s",
        "<Tab>",
        [[luasnip#jumpable(1) ? "<Plug>luasnip-jump-next" : "<Tab>"]],
        { remap = true, expr = true, replace_keycodes = false }
      )

      vim.keymap.set(
        "s",
        "<S-Tab>",
        [[luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<S-Tab>"]],
        { remap = true, expr = true, replace_keycodes = false }
      )
    end,
    opts = {
      keep_roots = true,
      link_roots = true,
      exit_roots = false,
      link_children = true,
      delete_check_events = "TextChanged",
    },
  },
})

LazySpec({
  -- A completion plugin for neovim coded in Lua.
  -- https://github.com/hrsh7th/nvim-cmp
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = {
        "L3MON4D3/LuaSnip",
        enabled = true,
      },
    },
  },
  enabled = function()
    return Enabled("completion", "cmp")
  end,
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()

    local check_back_space = function()
      local col = vim.fn.col(".") - 1
      if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
      else
        return false
      end
    end

    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    return {
      auto_brackets = {},
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = {
        -- ["<C-p>"] = cmp.mapping.select_prev_item(),
        -- ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-g><C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-g><C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-x><C-x>"] = cmp.mapping.complete(),
        -- ["<C-e>"] = cmp.mapping.close(),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({
          -- behavior = cmp.ConfirmBehavior.Insert,
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif check_back_space() then
            vim.fn.feedkeys(t("<Tab>"), "n")
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            vim.fn.feedkeys(t("<C-h>"), "n")
          end
        end,
      },
      sources = cmp.config.sources({
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
      }),
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
  config = function(opts)
    local cmp = require("cmp")
    cmp.setup(opts)

    -- https://github.com/windwp/nvim-autopairs
    local has_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if has_autopairs then
      require("nvim-autopairs").setup({
        map_cr = false,
      })
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end

    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "buffer" },
      }),
    })
  end,
})

LazySpec({
  -- Performant, batteries-included completion plugin for Neovim
  -- https://github.com/Saghen/blink.cmp
  "Saghen/blink.cmp",
  lazy = false,
  build = "cargo build --release",
  dependencies = "rafamadriz/friendly-snippets",
  enabled = function()
    return Enabled("completion", "blink")
  end,
  opts = function()
    return {
      keymap = {
        show = "<C-x><C-x>",
        hide = "<C-e>",
        accept = "<CR>",
        select_and_accept = {},
        select_prev = { "<Up>", "<C-p>" },
        select_next = { "<Down>", "<C-n>" },
        show_documentation = "<C-g><C-d>",
        hide_documentation = "<C-g><C-h>",
        scroll_documentation_up = "<C-g><C-b>",
        scroll_documentation_down = "<C-g><C-f>",
        snippet_forward = "<Tab>",
        snippet_backward = "<S-Tab>",
      },
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = "normal",
      blocked_filetypes = {},
      kind_icons = vim.g.zero_vim_nerdfont == 1 and {} or {
        Text = "T",
        Method = "m",
        Function = "F",
        Constructor = "i",
        Field = "f",
        Variable = "v",
        Property = "p",
        Class = "C",
        Interface = "I",
        Struct = "S",
        Module = "M",
        Unit = "U",
        Value = "V",
        Enum = "E",
        EnumMember = "e",
        Keyword = "K",
        Constant = "c",
        Snippet = "s",
        Color = "o",
        File = "R",
        Reference = "r",
        Folder = "D",
        Event = "A",
        Operator = "O",
        TypeParameter = "P",
      },
    }
  end,
})

LazySpec({
  -- https://github.com/ms-jpq/coq_nvim
  "ms-jpq/coq_nvim",
  branch = "coq",
  lazy = false,
  dependencies = {
    {
      -- https://github.com/ms-jpq/coq.artifacts
      "ms-jpq/coq.artifacts",
      branch = "artifacts",
    },
    {
      -- Module lua sources for `coq.nvim`, first & third party
      -- https://github.com/ms-jpq/coq.thirdparty
      "ms-jpq/coq.thirdparty",
      branch = "3p",
      config = function()
        require("coq_3p")({
          { src = "nvimlua", short_name = "nLUA", conf_only = false },
        })
      end,
    },
  },
  enabled = function()
    return Enabled("completion", "coq") and vim.fn.has("python3") == 1
  end,
  init = function()
    vim.g.coq_settings = {
      auto_start = "shut-up",
      display = {
        icons = {
          mode = vim.g.zero_vim_nerdfont == 1 and "long" or "none",
        },
      },
      keymap = {
        recommended = not LazyHas("nvim-autopairs"),
        manual_complete = "",
        bigger_preview = "<C-k>",
        jump_to_mark = "",
      },
      clients = {
        tmux = {
          enabled = false,
        },
      },
    }

    -- <CR>: accept completion when popup menu is visible
    vim.keymap.set("i", "<CR>", function()
      if vim.fn.pumvisible() == 1 then
        if vim.fn.empty(vim.v.completed_item) == 1 or vim.fn.complete_info({ "selected" }).selected == -1 then
          return "<C-e><CR>"
        else
          return "<C-y>"
        end
      else
        return "<CR>"
      end
    end, { expr = true })

    -- Show autocomplete popup manually
    vim.keymap.set("i", "<C-x><C-x>", function()
      return vim.fn.pumvisible() == 1 and "<C-e><C-x><C-u>" or "<C-x><C-u>"
    end, { expr = true })

    -- Jump to mark
    vim.keymap.set({ "i", "v" }, "<C-j>", [[<C-\><C-n><Cmd>lua COQ.Nav_mark()<CR>]])

    if not vim.g.coq_settings.keymap.recommended then
      vim.keymap.set("i", "<Esc>", function()
        return vim.fn.pumvisible() == 1 and "<C-e><Esc>" or "<Esc>"
      end, { expr = true })
      vim.keymap.set("i", "<C-c>", function()
        return vim.fn.pumvisible() == 1 and "<C-e><C-c>" or "<C-c>"
      end, { expr = true })
      vim.keymap.set("i", "<BS>", function()
        return vim.fn.pumvisible() == 1 and "<C-e><BS>" or "<BS>"
      end, { expr = true })
      vim.keymap.set("i", "<C-w>", function()
        return vim.fn.pumvisible() == 1 and "<C-e><C-w>" or "<C-w>"
      end, { expr = true })
      vim.keymap.set("i", "<C-u>", function()
        return vim.fn.pumvisible() == 1 and "<C-e><C-u>" or "<C-u>"
      end, { expr = true })
      vim.keymap.set("i", "<Tab>", function()
        return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
      end, { expr = true })
      vim.keymap.set("i", "<S-Tab>", function()
        return vim.fn.pumvisible() == 1 and "<C-p>" or "<BS>"
      end, { expr = true })

      -- https://github.com/windwp/nvim-autopairs
      require("nvim-autopairs").setup({
        map_cr = false,
        map_bs = false,
      })

      -- <CR>: accept completion with autopairs
      vim.keymap.set("i", "<CR>", function()
        if vim.fn.pumvisible() == 1 then
          if vim.fn.empty(vim.v.completed_item) == 1 or vim.fn.complete_info({ "selected" }).selected == -1 then
            return vim.api.nvim_replace_termcodes("<C-e>", true, true, true) .. require("nvim-autopairs").autopairs_cr()
          else
            return vim.api.nvim_replace_termcodes("<C-y>", true, true, true)
          end
        else
          return require("nvim-autopairs").autopairs_cr()
        end
      end, { expr = true, replace_keycodes = false })

      -- <BS>: Backspace with autopairs
      vim.keymap.set("i", "<BS>", function()
        if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ "mode" }).mode == "eval" then
          vim.fn.feedkeys(require("nvim-autopairs").esc("<C-e>") .. require("nvim-autopairs").autopairs_bs(), "n")
        else
          vim.fn.feedkeys(require("nvim-autopairs").autopairs_bs(), "n")
        end
        return ""
      end, { expr = true })
    end
  end,
})

LazySpec({
  -- Chained completion that works the way you want!
  -- https://github.com/lifepillar/vim-mucomplete
  "lifepillar/vim-mucomplete",
  dependencies = {
    "hrsh7th/vim-vsnip",
    enabled = true,
  },
  enabled = function()
    return not Enabled("completion", "cmp")
      and not Enabled("completion", "blink")
      and not Enabled("completion", "coq")
      and Enabled("completion")
  end,
  init = function()
    vim.g["mucomplete#enable_auto_at_startup"] = 1
    vim.g["mucomplete#completion_delay"] = 0
    vim.g["mucomplete#reopen_immediately"] = 1
    vim.g["mucomplete#minimum_prefix_length"] = 1
    vim.g["mucomplete#no_mappings"] = 1

    vim.g["mucomplete#chains"] = {
      default = { "path", "vsnip", "c-n", "dict", "uspl" },
      vim = { "path", "cmd", "vsnip", "c-n" },
    }

    if Enabled("lsp") then
      vim.g["mucomplete#chains"].default = { "path", "omni", "vsnip", "c-n", "dict", "uspl" }
    end

    if LazyHas("nvim-lspconfig") then
      -- https://github.com/neovim/nvim-lspconfig
      vim.g["mucomplete#completion_delay"] = 200
      vim.g["mucomplete#reopen_immediately"] = 0
    end

    -- Show autocomplete popup manually
    vim.keymap.set("i", "<C-x><C-x>", function()
      return vim.fn.pumvisible() == 1 and "<Plug>(MUcompleteCycFwd)" or "<Plug>(MUcompleteFwd)"
    end, { expr = true, remap = true })

    -- CTRL-J: snippet jump forward or go to next completion chain
    vim.keymap.set("i", "<C-j>", function()
      if vim.fn["vsnip#jumpable"](1) == 1 then
        return "<Plug>(vsnip-jump-next)"
      elseif vim.fn.pumvisible() == 1 then
        return "<Plug>(MUcompleteCycFwd)"
      end
      return ""
    end, { expr = true, remap = true })

    -- CTRL-K: go to previous completion chain or expand snippet
    vim.keymap.set("i", "<C-k>", function()
      if vim.fn.pumvisible() == 1 then
        if vim.fn.empty(vim.v.completed_item) == 1 or vim.fn.complete_info({ "selected" }).selected == -1 then
          return "<Plug>(MUcompleteCycBwd)"
        elseif vim.fn["vsnip#available"](1) == 1 then
          return "<Plug>(vsnip-expand-or-jump)"
        else
          return "<Plug>(MUcompleteCycBwd)"
        end
      elseif vim.fn["vsnip#available"](1) == 1 then
        return "<Plug>(vsnip-expand-or-jump)"
      else
        return ""
      end
    end, { expr = true, remap = true })

    -- <CR>: accept completion when popup menu is visible
    vim.keymap.set("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], { expr = true })

    -- <Tab>: completion
    vim.keymap.set("i", "<Tab>", function()
      return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<Plug>(MUcompleteFwd)"
    end, { expr = true, remap = true })

    -- <S-Tab>: completion back
    vim.keymap.set("i", "<S-Tab>", function()
      return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<Plug>(MUcompleteBwd)"
    end, { expr = true, remap = true })

    -- CTRL-Y: Extend completion
    -- vim.keymap.set("i", "<C-y>", [[mucomplete#extend_fwd("\<C-y>")]], { expr = true, remap = true })

    -- Integrate with multiple cursors plugin
    vim.api.nvim_create_autocmd("User", {
      group = "MyAutoCmd",
      pattern = "MultipleCursorsStart",
      command = "silent! MUcompleteAutoOff",
    })
    vim.api.nvim_create_autocmd("User", {
      group = "MyAutoCmd",
      pattern = "MultipleCursorsExit",
      command = "silent! MUcompleteAutoOn",
    })
  end,
})

LazySpec({
  {
    -- A format runner for Neovim.
    -- https://github.com/mhartington/formatter.nvim
    "mhartington/formatter.nvim",
    enabled = function()
      return Enabled("formatting", "formatter")
    end,
    opts = function()
      return {
        logging = false,
        filetype = {
          ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
          json = { require("formatter.filetypes.json").jq },
          lua = { require("formatter.filetypes.lua").stylua },
          ruby = { require("formatter.filetypes.ruby").rubocop },
          go = { require("formatter.filetypes.go").goimports },
          rust = { require("formatter.filetypes.rust").rustfmt },
          elixir = { require("formatter.filetypes.elixir").mixformat },
          terraform = { require("formatter.filetypes.terraform").terraformfmt },
        },
      }
    end,
    init = function()
      vim.keymap.set({ "n", "x" }, "<Leader>b=", ":FormatWrite<CR>", { silent = true })
      vim.keymap.set({ "n", "x" }, "<Leader>bu", ":FormatWrite<CR>", { silent = true })
    end,
  },

  {
    -- Lightweight yet powerful formatter plugin for Neovim
    -- https://github.com/stevearc/conform.nvim
    "stevearc/conform.nvim",
    dependencies = {
      -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
      "williamboman/mason.nvim",
    },
    enabled = function()
      return not Enabled("formatting", "formatter") and Enabled("formatting")
    end,
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        -- ["_"] = { "trim_whitespace" },
      },
      -- format_on_save = {
      --     timeout_ms = 500,
      --     lsp_fallback = true,
      -- },
      -- format_after_save = {
      --     lsp_fallback = true,
      -- },
      log_level = vim.log.levels.ERROR,
      notify_on_error = true,
    },
    init = function()
      -- require("conform").formatters.injected = {
      --     options = {
      --         ignore_errors = false,
      --     },
      -- }

      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_fallback = true, range = range })
      end, { range = true })

      vim.api.nvim_create_user_command("FormatInjected", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ formatters = { "injected" }, async = true, lsp_fallback = true, range = range })
      end, { range = true })

      vim.keymap.set({ "n", "x" }, "<Leader>b=", "<Cmd>Format<CR>", { silent = true })
      vim.keymap.set({ "n", "x" }, "<Leader>bu", "<Cmd>Format<CR>", { silent = true })
    end,
  },
})

LazySpec({
  -- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
  -- https://github.com/mfussenegger/nvim-lint
  "mfussenegger/nvim-lint",
  dependencies = {
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    "williamboman/mason.nvim",
  },
  enabled = function()
    return Enabled("linting")
  end,
  init = function()
    vim.g.zero_vim_linters = vim.g.zero_vim_linters or vim.empty_dict()

    if vim.g.zero_vim_autolint == 1 then
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
          require("lint").try_lint()
        end,
      })
    end

    local lint = require("lint")
    lint.linters_by_ft = vim.tbl_extend("force", lint.linters_by_ft, vim.g.zero_vim_linters)
    lint.linters.rubocop = vim.tbl_extend("force", lint.linters.rubocop, {
      cmd = "bundle",
      args = {
        "exec",
        "rubocop",
        "--format",
        "json",
        "--force-exclusion",
        "--stdin",
        function()
          return vim.api.nvim_buf_get_name(0)
        end,
      },
    })
  end,
})

LazySpec({
  -- Debug Adapter Protocol client implementation for Neovim
  -- https://github.com/mfussenegger/nvim-dap
  "mfussenegger/nvim-dap",
  dependencies = {
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    "williamboman/mason.nvim",
    -- https://github.com/jay-babu/mason-nvim-dap.nvim
    "jay-babu/mason-nvim-dap.nvim",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  enabled = function()
    return Enabled("dap")
  end,
  config = function()
    -- https://github.com/jay-babu/mason-nvim-dap.nvim
    require("mason-nvim-dap").setup({
      ensure_installed = {},
      automatic_installation = false,
    })
  end,
})

LazySpec({
  -- Run your tests at the speed of thought
  -- https://github.com/vim-test/vim-test
  "vim-test/vim-test",
  cmd = { "TestNearest", "TestFile", "TestLast", "TestSuite", "TestVisit" },
  init = function()
    -- vim.g["test#neovim#term_position"] = "botright"
    -- vim.g["test#neovim#term_position"] = "vertical"
    -- vim.g["test#neovim#term_position"] = "tab"
    vim.g["test#neovim#term_position"] = "botright 15"
    vim.g["test#neovim#start_normal"] = 1
    vim.g["test#strategy"] = "neovim"

    if LazyHas("vim-tmuxify") then
      vim.g["test#preserve_screen"] = 0
      vim.g["test#strategy"] = "tmuxify"
    end

    vim.keymap.set("n", "<Leader>tt", "<Leader>tf", { remap = true })
    vim.keymap.set("n", "<Leader>tn", "<Cmd>TestNearest<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>tf", "<Cmd>TestFile<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>tl", "<Cmd>TestLast<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>ts", "<Cmd>TestSuite<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>tv", "<Cmd>TestVisit<CR>", { silent = true })
  end,
})

LazySpec({
  {
    -- Open GitHub URL of current file, etc. from Vim editor (supported GitHub Enterprise)
    -- https://github.com/tyru/open-browser-github.vim
    "tyru/open-browser-github.vim",
    dependencies = {
      "tyru/open-browser.vim",
    },
    enabled = function()
      return Enabled("github")
    end,
    cmd = { "OpenGithubFile", "OpenGithubIssue", "OpenGithubPullReq", "OpenGithubProject", "OpenGithubCommit" },
  },

  {
    -- fugitive.vim: A Git wrapper so awesome, it should be illegal
    -- https://github.com/tpope/vim-fugitive
    "tpope/vim-fugitive",
    dependencies = {
      -- rhubarb.vim: GitHub extension for fugitive.vim
      -- https://github.com/tpope/vim-rhubarb
      "tpope/vim-rhubarb",
    },
    enabled = function()
      return Enabled("git")
    end,
    init = function()
      vim.g.fugitive_legacy_commands = 0

      vim.keymap.set("n", "<Leader>gi", "<Cmd>Git add -p %<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>ga", "<Cmd>Git add -p<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>gs", "<Cmd>Git<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>gd", "<Cmd>Gdiffsplit<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>gc", "<Cmd>Git commit -v<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>gb", "<Cmd>Git blame<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>ge", ":Gedit<Space>")
      vim.keymap.set("n", "<Leader>gr", "<Cmd>Gread<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>gw", "<Cmd>Gwrite<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>gx", "<Cmd>Gwq<Bar>redraw<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>gf", "<Cmd>Git fetch<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>gp", "<Cmd>Git push<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>gu", "<Cmd>Git pull --rebase<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>go", "<Cmd>GBrowse<CR>", { silent = true })
      vim.keymap.set("x", "<Leader>go", ":GBrowse<CR>", { silent = true })

      vim.keymap.set(
        "n",
        "<Leader>gy",
        [[:Gwrite<Bar>Git commit -m <C-r>=printf("'Update: %s'", strftime('%a, %d %b %Y %H:%M:%S %z'))<CR><CR>]],
        { silent = true }
      )

      vim.api.nvim_create_autocmd("BufReadPost", {
        group = "MyAutoCmd",
        pattern = "fugitive://*",
        callback = function()
          vim.bo.bufhidden = "delete"
        end,
      })

      -- Disable rhubarb#Complete
      vim.api.nvim_create_autocmd("BufEnter", {
        group = "MyAutoCmd",
        pattern = { "*.git/*MSG" },
        callback = function()
          vim.bo.omnifunc = ""
        end,
      })
    end,
  },

  {
    -- A git commit browser in Vim
    -- https://github.com/junegunn/gv.vim
    "junegunn/gv.vim",
    dependencies = {
      -- An awesome Git wrapper so awesome
      "tpope/vim-fugitive",
    },
    enabled = function()
      return Enabled("git")
    end,
    cmd = { "GV" },
    keys = {
      { "<Leader>gl", "<Cmd>GV<CR>", desc = "Open commit browser" },
      { "<Leader>gv", "<Cmd>GV!<CR>", desc = "Open commit browser for the current file" },
      { "<Leader>g?", "<Cmd>GV?<CR>", desc = "Fill the location list with the revisions of the current file" },
    },
  },

  {
    -- Vim and Neovim plugin to reveal the commit messages under the cursor
    -- https://github.com/rhysd/git-messenger.vim
    "rhysd/git-messenger.vim",
    enabled = function()
      return Enabled("git-messenger")
    end,
    cmd = { "GitMessenger" },
    keys = {
      { "<Leader>gm", "<Plug>(git-messenger)", remap = true, desc = "View commit messages under the cursor" },
    },
    init = function()
      vim.g.git_messenger_always_into_popup = true
      vim.g.git_messenger_no_default_mappings = true
    end,
  },

  {
    -- Work with diff hunks. Part of 'mini.nvim' library.
    -- https://github.com/echasnovski/mini.diff
    "echasnovski/mini.diff",
    event = "VeryLazy",
    enabled = function()
      return Enabled("git-gutter", "mini.diff")
    end,
    keys = {
      { "ah", "<Cmd>lua MiniDiff.textobject()<CR>", mode = { "x", "o" } },
      {
        "yog",
        function()
          require("mini.diff").toggle(vim.api.nvim_get_current_buf())
        end,
      },
    },
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "+",
          change = "~",
          delete = "_",
        },
      },
      mappings = {
        -- Apply hunks inside a visual/operator region
        apply = "gh",
        -- Reset hunks inside a visual/operator region
        reset = "gH",
        -- Hunk range textobject to be used inside operator
        -- Works also in Visual mode if mapping differs from apply and reset
        textobject = "ih",
        -- Go to hunk range in corresponding direction
        goto_first = "[H",
        goto_prev = "[h",
        goto_next = "]h",
        goto_last = "]H",
      },
    },
  },

  {
    -- Git integration for buffers
    -- https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    dependencies = {
      -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
      "nvim-lua/plenary.nvim",
    },
    enabled = function()
      return not Enabled("git-gutter", "mini.diff") and Enabled("git-gutter")
    end,
    init = function()
      vim.keymap.set("n", "yog", "<Cmd>Gitsigns toggle_signs<CR>", { silent = true })
    end,
    opts = {
      update_debounce = 250,
      max_file_length = 1000,
      signcolumn = true,
      attach_to_untracked = false,
      current_line_blame = false,
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gitsigns = package.loaded.gitsigns

        vim.keymap.set("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { buffer = bufnr })

        vim.keymap.set("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { buffer = bufnr })

        vim.keymap.set("n", "]H", function()
          gitsigns.nav_hunk("last")
        end, { buffer = bufnr })
        vim.keymap.set("n", "[H", function()
          gitsigns.nav_hunk("first")
        end, { buffer = bufnr })

        -- vim.keymap.set("n", "ghs", gitsigns.stage_hunk)
        -- vim.keymap.set("n", "ghr", gitsigns.reset_hunk)
        -- vim.keymap.set("v", "ghs", function()
        --   gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        -- end)
        -- vim.keymap.set("v", "ghr", function()
        --   gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        -- end)

        vim.keymap.set({ "n", "v" }, "ghs", ":Gitsigns stage_hunk<CR>", { buffer = bufnr })
        vim.keymap.set({ "n", "v" }, "ghr", ":Gitsigns reset_hunk<CR>", { buffer = bufnr })

        vim.keymap.set("n", "ghS", gitsigns.stage_buffer, { buffer = bufnr })
        vim.keymap.set("n", "ghR", gitsigns.reset_buffer, { buffer = bufnr })
        vim.keymap.set("n", "ghu", gitsigns.undo_stage_hunk, { buffer = bufnr })
        vim.keymap.set("n", "ghp", gitsigns.preview_hunk_inline, { buffer = bufnr })
        vim.keymap.set("n", "ghb", function()
          gitsigns.blame_line({ full = true })
        end, { buffer = bufnr })
        vim.keymap.set("n", "ghB", function()
          gitsigns.blame()
        end, { buffer = bufnr })
        vim.keymap.set("n", "ghd", gitsigns.diffthis, { buffer = bufnr })
        vim.keymap.set("n", "ghD", function()
          gitsigns.diffthis("~")
        end, { buffer = bufnr })

        --  Textobject
        vim.keymap.set({ "x", "o" }, "ah", ":<C-u>Gitsigns select_hunk<CR>", { buffer = bufnr })
        vim.keymap.set({ "x", "o" }, "ih", ":<C-u>Gitsigns select_hunk<CR>", { buffer = bufnr })
      end,
    },
  },
})

LazySpec({
  -- Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
  -- https://github.com/folke/which-key.nvim
  "folke/which-key.nvim",
  event = "VeryLazy",
  enabled = function()
    return Enabled("which-key")
  end,
  opts = {
    delay = function(ctx)
      return 250
    end,
    icons = {
      -- separator = "»",
      separator = "→ ",
      keys = vim.g.zero_vim_nerdfont == 1 and {} or {
        Up = "<Up> ",
        Down = "<Down> ",
        Left = "<Left> ",
        Right = "<Right> ",
        C = "<C-…> ",
        M = "<M-…> ",
        D = "<D-…> ",
        S = "<S-…> ",
        CR = "<CR> ",
        Esc = "<Esc> ",
        ScrollWheelDown = "<ScrollWheelDown> ",
        ScrollWheelUp = "<ScrollWheelUp> ",
        NL = "<NL> ",
        BS = "<BS> ",
        Space = "<Space> ",
        Tab = "<Tab> ",
        F1 = "<F1>",
        F2 = "<F2>",
        F3 = "<F3>",
        F4 = "<F4>",
        F5 = "<F5>",
        F6 = "<F6>",
        F7 = "<F7>",
        F8 = "<F8>",
        F9 = "<F9>",
        F10 = "<F10>",
        F11 = "<F11>",
        F12 = "<F12>",
      },
    },
    replace = {
      ["<space>"] = "SPC",
      ["<tab>"] = "TAB",
      ["<CR>"] = "RET",
    },
    plugins = {
      presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = false, -- bindings for prefixed with g
      },
    },
  },
  init = function()
    local wk = require("which-key")
    wk.add({
      { "<Leader>n", desc = "open-selected-region" },
      { "<Leader>S", desc = "search-prompt" },
      { "<Leader>B", desc = "buffer-search-prompt" },
      { "<Leader>R", desc = "replace-prompt" },
      { "<Leader>a", desc = "all-files" },
      { "<Leader>f", desc = "files" },
      { "<Leader>p", desc = "buffer-project" },
      { "<Leader>o", desc = "mru-in-cwd-and-opening-buffers" },
      { "<Leader>O", desc = "recent-files" },
      { "<Leader>d", desc = "files-in-buffer-dir" },
      { [[<Leader>\]], desc = "tags" },
      { "<Leader>;", desc = "command-palette" },
      { "<Leader>:", desc = "command-history" },
      { "<Leader>?", desc = "search-history" },
      { "<Leader>l", desc = "location-list" },
      { "<Leader>q", desc = "quickfix" },
      { "<Leader>/", desc = "live-grep" },
      {
        cond = function()
          return LazyHas("telescope.nvim") or LazyHas("fzf-lua") or LazyHas("fzf")
        end,
        { "<Leader>'", desc = "marks" },
        { "<Leader>Y", desc = "registers" },
      },
      {
        cond = function()
          return LazyHas("true-zen.nvim") or LazyHas("zen-mode.nvim")
        end,
        { "<Leader><Enter>", desc = "toggle-zen-mode" },
        { "<Leader>L", desc = "toggle-hyperfocus-writing" },
      },
      {
        "<Leader>U",
        desc = "toggle-undo-tree",
        cond = function()
          return LazyHas("undotree")
        end,
      },
      {
        "<Leader>T",
        desc = "toggle-tags-tree",
        cond = function()
          return LazyHas("tagbar")
        end,
      },
      { "<Leader>b", group = "buffer" },
      { "<Leader>bw", desc = "save-buffer" },
      { "<Leader>bx", desc = "save-and-close-buffer" },
      { "<Leader>bu", desc = "save-and-format-buffer" },
      { "<Leader>bk", desc = "delete-buffer" },
      { "<Leader>by", desc = "copy-buffer-to-clipboard" },
      { "<Leader>bn", desc = "open-selected-region" },
      { "<Leader>bb", desc = "opening-buffers" },
      { "<Leader>bd", desc = "files-in-buffer-dir" },
      { "<Leader>bp", desc = "buffer-project" },
      { "<Leader>bt", desc = "buffer-tags" },
      { "<Leader>bo", desc = "buffer-outline" },
      { "<Leader>bl", desc = "buffer-lines" },
      { "<Leader>ba", desc = "buffer-alternative" },
      { "<Leader>br", desc = "buffer-related" },
      { "<Leader>b;", desc = "buffer-search-cword-prompt" },
      { "<Leader>bs", desc = "buffer-search-cword" },
      { "<Leader>b.", desc = "buffer-search-word" },
      { "<Leader>bg", desc = "buffer-git-grep-cword" },
      {
        "<Leader>bm",
        desc = "maximize-buffer",
        cond = function()
          return LazyHas("ZoomWin")
        end,
      },
      {
        "<Leader>bi",
        desc = "toggle-indent-guide",
        cond = function()
          return LazyHas("indentmini.nvim") or LazyHas("indent-blankline.nvim") or LazyHas("mini.nvim")
        end,
      },
      {
        cond = function()
          return LazyHas("formatter.nvim") or LazyHas("conform.nvim")
        end,
        { "<Leader>b=", desc = "format-buffer" },
        { "<Leader>bu", desc = "format-buffer" },
      },
      {
        "<Leader>bh",
        desc = "toggle-buffer-highlight",
        cond = function()
          return LazyHas("nvim-treesitter")
        end,
      },
      { "<Leader>s", group = "search/replace" },
      { "<Leader>s;", desc = "search-cword-prompt" },
      { "<Leader>ss", desc = "search-cword" },
      { "<Leader>s.", desc = "search-word" },
      { "<Leader>sd", desc = "search-cword-in-buffer-dir" },
      { "<Leader>sg", desc = "git-grep-cword" },
      { "<Leader>si", desc = "search-fuzzy" },
      { "<Leader>sc", desc = "search-cword-fuzzy-interactive" },
      { "<Leader>sr", desc = "replace-cword-prompt" },
      { "<Leader>sx", desc = "replace-cword-boundary-prompt" },
      {
        cond = function()
          return LazyHas("ctrlsf.vim")
        end,
        { "<Leader>F", desc = "ctrlsf-search-prompt" },
        { "<Leader>sf", desc = "ctrlsf-search-cword" },
        { "<Leader>sw", desc = "ctrlsf-search-word" },
        { "<Leader>sp", desc = "ctrlsf-search-cword-in-project" },
        { "<Leader>su", desc = "ctrlsf-search-update" },
        { "<Leader>so", desc = "toggle-ctrlsf-search-result" },
      },
      {
        cond = function()
          return LazyHas("any-jump.vim")
        end,
        { "<Leader>sa", desc = "any-jump" },
        { "<Leader>sb", desc = "any-jump-back" },
        { "<Leader>sl", desc = "any-jump-last-results" },
      },
      {
        cond = function()
          return LazyHas("vim-abolish")
        end,
        { "<Leader>V", desc = "subvert-prompt" },
        { "<Leader>sv", desc = "subvert-cword-prompt" },
      },
      {
        cond = function()
          return LazyHas("vim-tmuxify")
        end,
        { "<Leader>m", group = "+tmuxify" },
        { "<Leader>mb", desc = "send-<ctrl-c>" },
        { "<Leader>mc", desc = "send-<ctrl-l>" },
        { "<Leader>mn", desc = "create-and-associate-with-pane" },
        { "<Leader>mp", desc = "associate-with-existing-pane" },
        { "<Leader>mq", desc = "close-associated-pane" },
        { "<Leader>mr", desc = "run-command" },
        { "<Leader>mt", desc = "set-run-command" },
        { "<Leader>mi", desc = "send-text-prompt" },
        { "<Leader>ms", desc = "send-paragraph" },
        { "<Leader>ml", desc = "send-line" },
        { "<Leader>mv", desc = "send-linewise-visual" },
        { "<Leader>mw", desc = "send-word" },
        { "<Leader>mk", desc = "send-key-prompt" },
        { "<Leader>ma", desc = "send-last-text" },
        { "<Leader>mf", desc = "send-clear" },
        { "<Leader>md", desc = "send-quit" },
      },
      { "<Leader>t", group = "test" },
      { "<Leader>tt", desc = "run-test-nearest-to-current-cursor" },
      { "<Leader>tn", desc = "run-test-nearest-to-current-cursor" },
      { "<Leader>tf", desc = "run-all-tests-in-current-file" },
      { "<Leader>tl", desc = "run-last-test" },
      { "<Leader>ts", desc = "run-whole-test-suite" },
      { "<Leader>tv", desc = "visit-last-test" },
      { "<Leader>g", desc = "git" },
      {
        cond = function()
          return LazyHas("vim-fugitive")
        end,
        { "<Leader>gi", desc = "stage-current-file-interactive" },
        { "<Leader>ga", desc = "stage-all-files-interactive" },
        { "<Leader>gs", desc = "status" },
        { "<Leader>gd", desc = "diff" },
        { "<Leader>gc", desc = "commit" },
        { "<Leader>gb", desc = "blame" },
        { "<Leader>ge", desc = "edit-prompt" },
        { "<Leader>gr", desc = "reset-file" },
        { "<Leader>gw", desc = "save-and-stage-current-file" },
        { "<Leader>gx", desc = "save-and-stage-current-file-and-quit" },
        { "<Leader>gf", desc = "fetch" },
        { "<Leader>gp", desc = "push" },
        { "<Leader>gu", desc = "pull-and-rebase" },
        { "<Leader>go", desc = "open-in-browser" },
      },
      {
        cond = function()
          return LazyHas("gv.vim")
        end,
        { "<Leader>gl", desc = "commit-browser" },
        { "<Leader>gv", desc = "commit-browser-for-current-file" },
        { "<Leader>g?", desc = "current-file-revisions" },
      },
      {
        "<Leader>gm",
        desc = "git-messenger",
        cond = function()
          return LazyHas("git-messenger.vim")
        end,
      },
    })

    if LazyHas("oil.nvim") or LazyHas("mini.files") then
      wk.add({
        { "<Leader>E", desc = "open-explorer-in-cwd" },
      })
    elseif LazyHas("neo-tree.nvim") then
      wk.add({
        { "<Leader>E", desc = "toggle-floating-explorer" },
      })
    else
      wk.add({
        { "<Leader>E", desc = "toggle-netrw-drawer" },
      })
    end

    if LazyHas("oil.nvim") or LazyHas("mini.files") or LazyHas("neo-tree.nvim") then
      wk.add({
        { "<Leader>e", desc = "toggle-explorer" },
        { "<Leader>bf", desc = "find-buffer-in-explorer" },
      })
    else
      wk.add({
        { "<Leader>e", desc = "netrw-explorer" },
        { "<Leader>bf", desc = "open-buffer-dir-in-netrw-explorer" },
      })
    end
  end,
})

-- Transparent Colorschemes
vim.g.zero_vim_transparent_colorschemes = vim.g.zero_vim_transparent_colorschemes or vim.empty_dict()

LazySpec({
  {
    -- https://github.com/ishan9299/nvim-solarized-lua
    "ishan9299/nvim-solarized-lua",
    priority = 1000,
    enabled = function()
      return Enabled("solarized")
    end,
    init = function()
      vim.g.solarized_italics = 1
      vim.g.solarized_termtrans = vim.g.solarized_termtrans
        or vim.g.zero_vim_transparent_colorschemes["solarized"]
        or vim.g.zero_vim_transparent_background
      vim.g.solarized_statusline = "flat"
    end,
  },

  {
    -- https://github.com/maxmx03/solarized.nvim
    "maxmx03/solarized.nvim",
    priority = 1000,
    enabled = function()
      return not Enabled("solarized")
    end,
    opts = {
      transparent = {
        enabled = (vim.g.zero_vim_transparent_colorschemes["solarized"] or vim.g.zero_vim_transparent_background) > 0,
      },
      styles = {
        functions = { italic = true },
        comments = { italic = true, bold = false },
        variables = { italic = false },
      },
      palette = vim.g.solarized_palette, -- `solarized` | `selenized`
      variant = vim.g.solarized_variant or "autumn", -- `spring` | `summer` | `autumn` | `winter`
      plugins = {
        navic = false,
        nvimtree = false,
        hop = false,
        ministatusline = false,
        minitabline = false,
        minicursorword = false,
        rainbowdelimiters = false,
        rendermarkdown = false,
        neogit = false,
        todocomments = false,
        coc = false,
        yanky = false,
        gitgutter = false,
      },
    },
  },

  {
    -- https://github.com/craftzdog/solarized-osaka.nvim
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    opts = function()
      vim.g.solarized_osaka_transparent = (
        vim.g.zero_vim_transparent_colorschemes["solarized-osaka"] or vim.g.zero_vim_transparent_background
      ) > 0
      return {
        style = vim.g.solarized_style, -- `storm` | `moon` | `night` | `day`
        transparent = vim.g.solarized_osaka_transparent,
        terminal_colors = false,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = vim.g.solarized_osaka_transparent and "transparent" or "normal", -- "dark" | "transparent" | "normal"
          floats = vim.g.solarized_osaka_transparent and "transparent" or "normal", -- "dark" | "transparent" | "normal"
        },
        sidebars = {},
        on_colors = function(colors)
          -- Work-around for https://github.com/craftzdog/solarized-osaka.nvim/issues/18
          colors.terminal_black = colors.terminal_black or colors.bg
          colors.fg_dark = colors.fg_dark or colors.fg
        end,
      }
    end,
  },

  {
    -- https://github.com/Tsuzat/NeoSolarized.nvim
    "Tsuzat/NeoSolarized.nvim",
    priority = 1000,
    opts = {
      style = vim.g.zero_vim_background or "dark",
      transparent = (vim.g.zero_vim_transparent_colorschemes["NeoSolarized"] or vim.g.zero_vim_transparent_background)
        > 0,
      terminal_colors = false,
      on_highlights = function(highlights, colors)
        -- Work-around for missing g:terminal_color_6
        if vim.o.background == "light" then
          colors.cyan = colors.cyan or 0x2aa198
        else
          colors.cyan = colors.cyan or 0x2aa198
        end
      end,
    },
  },

  {
    -- https://github.com/ellisonleao/gruvbox.nvim
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      terminal_colors = false,
      bold = true,
      contrast = vim.g.gruvbox_constrast or "hard", -- "hard", "soft" or empty string
      transparent_mode = (
        vim.g.gruvbox_transparent_background
        or vim.g.zero_vim_transparent_colorschemes["gruvbox"]
        or vim.g.zero_vim_transparent_background
      ) > 0,
    },
  },

  {
    -- https://github.com/f4z3r/gruvbox-material.nvim
    "f4z3r/gruvbox-material.nvim",
    priority = 1000,
    opts = {
      contrast = vim.g.gruvbox_material_background or "hard",
      background = {
        transparent = (
          vim.g.gruvbox_material_transparent_background
          or vim.g.zero_vim_transparent_colorschemes["gruvbox-material"]
          or vim.g.zero_vim_transparent_background
        ) > 0,
      },
    },
  },

  {
    -- https://github.com/neanias/everforest-nvim
    "neanias/everforest-nvim",
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = vim.g.everforest_background or "hard",
        transparent_background_level = (
          vim.g.everforest_transparent_background
          or vim.g.zero_vim_transparent_colorschemes["everforest"]
          or vim.g.zero_vim_transparent_background
        ),
        italics = true,
        disable_italic_comments = false,
      })
    end,
  },
})

LazySpec({
  {
    -- https://github.com/tpope/vim-rails
    "tpope/vim-rails",
    dependencies = {
      {
        -- https://github.com/tpope/vim-projectionist
        "tpope/vim-projectionist",
        init = function()
          vim.g.projectionist_ignore_ = 1
        end,
      },
      {
        -- https://github.com/tpope/vim-rake
        "tpope/vim-rake",
        init = function()
          vim.api.nvim_create_autocmd("User", {
            group = "MyAutoCmd",
            pattern = "Rake",
            callback = function(event)
              vim.keymap.set("n", "<Leader>ba", "<Cmd>AE<CR>", { buffer = event.buf, silent = true })
              vim.keymap.set("n", "<Leader>br", "<Cmd>RE<CR>", { buffer = event.buf, silent = true })
            end,
          })
        end,
      },
    },
    enabled = function()
      return EnabledGroup("rails")
    end,
    init = function()
      -- https://github.com/tpope/vim-rails
      vim.g.Tlist_Ctags_Cmd = vim.g.zero_vim_ctags_bin

      vim.g.rails_projections = {
        ["app/controllers/*_controller.rb"] = {
          alternate = {
            "spec/requests/{}_spec.rb",
            "spec/requests/{}_request_spec.rb",
            "spec/requests/{}_controller_spec.rb",
            "spec/controllers/{}_controller_spec.rb",
          },
        },
        ["app/scopes/*_scopes.rb"] = {
          command = "scope",
          template = { "class {camelcase|capitalize|colons}Scopes", "end" },
          related = {
            "app/models/{}.rb",
          },
          test = {
            "spec/scopes/{}_scopes_spec.rb",
            "spec/models/{}_spec.rb",
          },
        },
        ["spec/requests/*_request_spec.rb"] = {
          alternate = {
            "app/controllers/{}_controller.rb",
          },
        },
        ["spec/requests/*_spec.rb"] = {
          alternate = {
            "app/controllers/{}.rb",
            "app/controllers/{}_controller.rb",
          },
        },
        ["spec/routing/*_routing_spec.rb"] = {
          alternate = {
            "app/controllers/{}_controller.rb",
          },
        },
        ["spec/routing/*_spec.rb"] = {
          alternate = {
            "app/controllers/{}.rb",
            "app/controllers/{}_controller.rb",
          },
        },
      }

      vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "Rails",
        callback = function(event)
          vim.keymap.set("n", "<Leader>ba", "<Cmd>AE<CR>", { buffer = event.buf, silent = true })
          vim.keymap.set("n", "<Leader>br", "<Cmd>RE<CR>", { buffer = event.buf, silent = true })
        end,
      })
    end,
  },

  {
    -- https://github.com/phongnh/vim-rubocop
    "phongnh/vim-rubocop",
    enabled = function()
      return EnabledGroup("rubocop")
    end,
    cmd = { "RuboCop", "RuboCopProject" },
    keys = {
      { "<Leader>rp", "<Cmd>RuboCopProject<CR>" },
      { "<Leader>ru", "<Cmd>RuboCop<CR>", ft = { "ruby" } },
    },
    init = function()
      vim.g.vimrubocop_keymap = 0
    end,
  },

  {
    -- https://github.com/phongnh/vim-reek
    "phongnh/vim-reek",
    enabled = function()
      return EnabledGroup("reek")
    end,
    cmd = { "RunReek" },
    keys = {
      { "<Leader>ru", "<Cmd>RunReek<CR>", ft = { "ruby" } },
    },
    init = function()
      vim.g.reek_always_show = 1
      vim.g.reek_line_limit = 1000
      vim.g.reek_on_loading = 0
    end,
  },
})

LazySpec({
  -- https://github.com/vim-crystal/vim-crystal
  "vim-crystal/vim-crystal",
  dependencies = {
    "elorest/vim-slang",
  },
  init = function()
    vim.g.crystal_enable_completion = 0
  end,
})

LazySpec({
  -- https://github.com/fatih/vim-go
  "fatih/vim-go",
  dependencies = {
    "zchee/vim-go-stdlib",
  },
  enabled = function()
    return EnabledGroup("go")
  end,
  init = function()
    vim.g.go_fmt_command = vim.g.go_fmt_command or "gopls" -- goimports
    vim.g.go_fmt_fail_silently = 1

    -- Toggle more highlight options
    vim.g.go_highlights_enabled = 0

    -- These highlights are enabled by default
    -- vim.g.go_highlight_string_spellcheck   = 1
    -- vim.g.go_highlight_format_strings      = 1
    -- vim.g.go_highlight_diagnostic_errors   = 1
    -- vim.g.go_highlight_diagnostic_warnings = 1
    -- vim.g.go_highlight_debug               = 1

    vim.api.nvim_create_user_command("ToggleGoHighlights", function(opts)
      vim.g.go_highlights_enabled = 1 - vim.g.go_highlights_enabled
      -- vim.g.go_highlight_array_whitespace_error    = vim.g.go_highlights_enabled
      -- vim.g.go_highlight_chan_whitespace_error     = vim.g.go_highlights_enabled
      vim.g.go_highlight_extra_types = vim.g.go_highlights_enabled
      -- vim.g.go_highlight_space_tab_error           = vim.g.go_highlights_enabled
      -- vim.g.go_highlight_trailing_whitespace_error = vim.g.go_highlights_enabled
      -- vim.g.go_highlight_operators                 = vim.g.go_highlights_enabled
      vim.g.go_highlight_functions = vim.g.go_highlights_enabled
      vim.g.go_highlight_function_parameters = vim.g.go_highlights_enabled
      vim.g.go_highlight_function_calls = vim.g.go_highlights_enabled
      vim.g.go_highlight_fields = vim.g.go_highlights_enabled
      vim.g.go_highlight_types = vim.g.go_highlights_enabled
      vim.g.go_highlight_build_constraints = vim.g.go_highlights_enabled
      vim.g.go_highlight_generate_tags = vim.g.go_highlights_enabled
      -- vim.g.go_highlight_variable_assignments      = vim.g.go_highlights_enabled
      -- vim.g.go_highlight_variable_declarations     = vim.g.go_highlights_enabled
      vim.cmd("confirm edit")
      vim.cmd("redraw!")
      print(string.format("%s highlights!", vim.g.go_highlights_enabled == 1 and "Enabled" or "Disabled"))
    end, {})

    vim.cmd([[
    function! BuildGoFiles() abort
        let l:file = expand("%")
        if l:file =~# "^\f\+_test\.go$"
            call go#test#Test(0, 1)
        elseif l:file =~# "^\f\+\.go$"
            call go#cmd#Build(0)
        end
    endfunction
    ]])

    vim.api.nvim_create_autocmd("BufEnter", {
      group = "MyAutoCmd",
      pattern = "go.mod",
      callback = function()
        if vim.bo.filetype == "lprolog" then
          vim.bo.filetype = "gomod"
        end
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = "MyAutoCmd",
      pattern = "gomod",
      callback = function(event)
        vim.keymap.set("n", "<Leader>bu", "<Cmd>update<CR><Cmd>GoModFmt<CR>", { buffer = event.buf, silent = true })
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = "MyAutoCmd",
      pattern = "go",
      callback = function(event)
        local buf = event.buf

        vim.api.nvim_buf_create_user_command(buf, "A", "call go#alternate#Switch(<bang>0, 'edit')", { bang = true })
        vim.api.nvim_buf_create_user_command(buf, "AV", "call go#alternate#Switch(<bang>0, 'vsplit')", { bang = true })

        vim.api.nvim_buf_create_user_command(buf, "AS", "call go#alternate#Switch(<bang>0, 'split')", { bang = true })

        vim.api.nvim_buf_create_user_command(buf, "AT", "call go#alternate#Switch(<bang>0, 'tabedit')", { bang = true })

        vim.keymap.set("n", "<Plug>(go-smart-build)", "<Cmd>call BuildGoFiles()<CR>", { buffer = buf, silent = true })

        if vim.fn.empty(vim.fn.mapcheck("<Plug>(go-run-split)")) == 1 then
          vim.keymap.set(
            "n",
            "<Plug>(go-run-split)",
            "<Cmd>GoRun!<CR><Cmd>redraw!<CR>",
            { buffer = buf, silent = true }
          )
        end

        vim.keymap.set("n", "<Leader>ru", "<Plug>(go-run)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>rs", "<Plug>(go-run-split)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>rb", "<Plug>(go-smart-build)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>rt", "<Plug>(go-test)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>rf", "<Plug>(go-test-func)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>rc", "<Plug>(go-coverage-toggle)", { buffer = buf, remap = true })

        vim.keymap.set("n", "<Leader>ri", "<Plug>(go-info)", { buffer = buf, remap = true })

        vim.keymap.set("n", "<Leader>re", "<Plug>(go-rename)", { buffer = buf, remap = true })

        if LazyHas("fzf.vim") then
          vim.keymap.set("n", "<Leader>ro", "<Plug>(go-decls-dir)", { buffer = buf, remap = true })
        end

        vim.keymap.set("n", "<Leader>r]", "<Plug>(go-def)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>r[", "<Plug>(go-def-type)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>rd", "<Plug>(go-doc-vertical)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>rx", "<Plug>(go-doc-split)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>rg", "<Plug>(go-doc-browser)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>rl", "<Plug>(go-metalinter)", { buffer = buf, remap = true })

        vim.keymap.set("n", "<Leader>ra", "<Plug>(go-alternate-edit)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>ba", "<Plug>(go-alternate-edit)", { buffer = buf, remap = true })
        vim.keymap.set("n", "<Leader>b=", "<Plug>(go-imports)", { buffer = buf, remap = true })

        vim.keymap.set("n", "g<", ":GoImport<Space>", { buffer = buf })
        vim.keymap.set("n", "g>", ":GoDrop<Space>", { buffer = buf })

        vim.keymap.set("n", "<Leader>rk", ":GoDocBrowser<Space>", { buffer = buf })
        vim.keymap.set("n", "<Leader>rh", "<Cmd>ToggleGoHighlights<CR>", { buffer = buf, silent = true })
      end,
    })
  end,
})

LazySpec({
  -- https://github.com/rust-lang/rust.vim
  "rust-lang/rust.vim",
  enabled = function()
    return EnabledGroup("rust")
  end,
  init = function()
    vim.g.rustfmt_autosave = vim.g.rustfmt_autosave or 0

    if vim.g.rustfmt_autosave ~= 1 then
      vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "rust",
        callback = function(event)
          vim.keymap.set("n", "<Leader>bu", "<Cmd>RustFmt<Bar>update<CR>", { buffer = event.buf, silent = true })
        end,
      })
    end
  end,
})

LazySpec({
  -- Database Markup Langauge
  "jidn/vim-dbml",
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- https://github.com/folke/lazy.nvim/blob/main/lua/lazy/core/handler/event.lua#L32
local Event = require("lazy.core.handler.event")
Event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
Event.mappings["User LazyFile"] = Event.mappings.LazyFile

-- Setup lazy.vim
require("lazy").setup({
  spec = ZeroVim.spec,
  defaults = {
    version = false, -- always use the latest git commit
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  checker = {
    enabled = false, -- automatically check for plugin updates
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    icons = vim.g.zero_vim_nerdfont == 1 and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

vim.keymap.set("n", "<Leader>C", "<Cmd>Lazy<CR>", { silent = true })

vim.api.nvim_exec_autocmds("User", { pattern = "ZeroVimSetup", modeline = false })

-- Zero Vim Profile settings
if not vim.g.zero_vim_profile and not vim.g.zero_vim_colorscheme then
  if vim.fn.empty(vim.env.ZERO_VIM_PROFILE) == 0 then
    vim.g.zero_vim_profile = vim.env.ZERO_VIM_PROFILE
  elseif vim.fn.empty(vim.env.TERM_PROFILE) == 0 then
    vim.g.zero_vim_profile = vim.env.TERM_PROFILE
  elseif vim.fn.empty(vim.env.ITERM_PROFILE) == 0 then
    vim.g.zero_vim_profile = vim.env.ITERM_PROFILE
  end
end

if vim.g.zero_vim_profile ~= nil then
  vim.g.zero_vim_profile = string.lower(vim.g.zero_vim_profile)

  if vim.g.zero_vim_background ~= nil then
    vim.g.zero_vim_background = vim.g.zero_vim_background
  elseif string.match(vim.g.zero_vim_profile, "light") then
    vim.g.zero_vim_background = "light"
  elseif string.match(vim.env.TERM_PROFILE or vim.env.ITERM_PROFILE or "", "Light") then
    vim.g.zero_vim_background = "light"
  else
    vim.g.zero_vim_background = "dark"
  end

  if string.match(vim.g.zero_vim_profile, "neosolarized") then
    vim.g.zero_vim_colorscheme = "NeoSolarized"
  elseif string.match(vim.g.zero_vim_profile, "osaka") then
    vim.g.solarized_style = vim.g.solarized_style or "storm"
    vim.g.zero_vim_colorscheme = "solarized-osaka"
  elseif string.match(vim.g.zero_vim_profile, "selenized") then
    vim.g.solarized_palette = "selenized"
    vim.g.solarized_variant = vim.g.solarized_variant or "spring"
    vim.g.zero_vim_colorscheme = "solarized"
  elseif string.match(vim.g.zero_vim_profile, "solarized") then
    vim.g.solarized_palette = "solarized"
    vim.g.solarized_variant = vim.g.solarized_variant or "autumn"
    vim.g.zero_vim_colorscheme = "solarized"
  elseif string.match(vim.g.zero_vim_profile, "gruvbox") then
    vim.g.zero_vim_colorscheme = "gruvbox-material"
  elseif string.match(vim.g.zero_vim_profile, "everforest") then
    vim.g.zero_vim_colorscheme = "everforest"
  end
end

-- Default colorscheme
local set_colorscheme = function()
  if vim.g.zero_vim_colorscheme ~= nil then
    if vim.g.zero_vim_background ~= nil then
      vim.o.background = vim.g.zero_vim_background
    end
    vim.cmd("colorscheme " .. vim.g.zero_vim_colorscheme)
  elseif vim.o.termguicolors then
    vim.g.gruvbox_material_palette = "original"
    vim.o.background = "dark"
    vim.cmd("colorscheme gruvbox-material")
  else
    vim.o.background = "dark"
    vim.cmd("colorscheme habamax")
  end
end

if not pcall(set_colorscheme) then
  vim.o.background = "dark"
  vim.cmd("colorscheme habamax")
end

vim.o.secure = true

