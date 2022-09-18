local autocmd = vim.api.nvim_create_autocmd

vim.opt.relativenumber = true
vim.g.luasnippets_path = "custom/snippets"
-- popup window height
vim.opt.pumheight = 15
-- folding
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.fillchars = { eob = "-", fold = " " }
-- auto-session suggest settings
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
