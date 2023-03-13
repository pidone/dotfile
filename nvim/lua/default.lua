local g = vim.g

g.mapleader = ","

local opt = vim.opt

opt.encoding = "utf-8"
opt.compatible = false
opt.hlsearch = true
opt.number = true
opt.laststatus = 2
opt.vb = true
opt.ruler = true
opt.spelllang = "en_us"
opt.autoindent = true
opt.colorcolumn = "120"
opt.textwidth = 120
opt.clipboard = "unnamedplus"
opt.scrollbind = false
opt.wildmenu = true

vim.wo.signcolumn = "yes"
