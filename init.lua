local autocmd = vim.api.nvim_create_autocmd

vim.g.luasnippets_path = "custom/snippets"
vim.opt.pumheight = 15

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
