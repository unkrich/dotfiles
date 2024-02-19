vim.cmd('autocmd!')

-- Inserts spaces instead of tabs by default
vim.cmd('set expandtab')

-- Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'

-- Set highlight on search to highlight current match
vim.o.hlsearch = false

-- Make line numbers relative by default
vim.wo.relativenumber = true

-- Do not save when switching buffers (note: this is now a default on master)
-- AKA when you switch files, you do not have to / it won't save by default
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent and tabs as 4 spaces
-- AKA text wraps will automatically indent
vim.o.breakindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.opt.smartindent = true

--Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
-- vim.wo.signcolumn = 'yes'

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })


-- Map blankline
-- AKA - TODO
-- vim.g.indent_blankline_char = '┊'
-- vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
-- vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
-- vim.g.indent_blankline_char_highlight = 'LineNr'
-- vim.g.indent_blankline_show_trailing_blankline_indent = false


-- CUSTOM REMAPS --

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Greatest remap ever -- Paste without losing buffer
vim.api.nvim_set_keymap('n', '<leader>p', '\"_dP', { noremap = true, silent = true })

-- Second greatest remap ever -- Yank to clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '\"+y', {noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '\"+y', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '\"+Y', {noremap = true, silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")

-- idk
vim.keymap.set("n", "Q", "<nop>")

-- tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Visual mode - move blocks of text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move line below to current line append
vim.keymap.set("n", "J", "mzJ`z")

-- Automatically recenter, navigation & search
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.opt.scrolloff = 8
