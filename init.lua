vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.g.mapleader = " "

-- in init.lua
vim.opt.encoding = "utf-8"     -- internal
vim.opt.fileencoding = "utf-8" -- files
vim.opt.termguicolors = true   -- allow true‑color (optional)
vim.deprecate = function() end
-- keymap

require("config.lazy")
