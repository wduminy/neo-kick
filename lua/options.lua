-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: Press K to see help on an option

vim.o.guicursor = 'n-v:hor50,i-o:ver50'
vim.o.cursorline = true
vim.opt.timeoutlen = 400
vim.o.linebreak = true
vim.o.tabstop = 4
vim.o.exrc = true
vim.o.hlsearch = false
-- rely on treesitter for syntax colouring
vim.o.syntax = 'off'
vim.o.spell = true
vim.o.spelloptions = 'camel,noplainbuffer'
vim.o.foldmethod = 'indent'
vim.o.foldenable = false
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
-- vim.opt.updatetime = 250

-- Decrease mapped sequence wait time

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- vim: ts=2 sts=2 sw=2 et
