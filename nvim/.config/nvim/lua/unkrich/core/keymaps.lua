-- CUSTOM REMAPS --

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

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

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
