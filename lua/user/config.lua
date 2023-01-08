local icons = require("user.icons")


vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.autoindent = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.backup = false
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.breakindent = true
vim.opt.completeopt = "menu,menuone,noselect" -- Better autocompletion
vim.opt.cursorline = true
vim.opt.cmdheight = 4
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.inccommand = 'split'
vim.opt.incsearch = true
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.hlsearch = true
vim.opt.laststatus = 3
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.showcmd = true
vim.opt.showtabline = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 200
vim.opt.title = true
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.wrap = false -- No Wrap lines
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- vim.g.mapleader = ' '


local M = {}

M.icons = icons

return M
