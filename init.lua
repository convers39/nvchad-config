local autocmd = vim.api.nvim_create_autocmd

vim.opt.pumheight = 15

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
