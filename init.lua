-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
local set = vim.opt
-- Set options
set.relativenumber = true
set.foldlevel = 99
-- set.cmdheight = 1

-- set.foldmethod = "expr"
-- set.foldexpr = "nvim_treesitter#foldexpr()"
-- set.foldmethod = "indent"
set.fillchars = { eob = "-", fold = " " }
-- set.tm = 1000
set.linebreak = true
