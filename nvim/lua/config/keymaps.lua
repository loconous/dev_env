-- Mapleaders required by lazy.lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General behaviour
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Indentation
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Clipboard
vim.opt.clipboard = "unnamedplus"
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')

-- Remove highlight search with <leader>+h -> " " + h
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
