local autocmd = vim.api.nvim_create_autocmd
-- restore nvim-tree with auto-session
autocmd({ "BufEnter" }, {
  pattern = "NvimTree*",
  callback = function()
    local api = require "nvim-tree.api"
    local view = require "nvim-tree.view"

    if not view.is_visible() then
      api.tree.open()
    end
  end,
})

-- highlight yank contents
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { highlight = "IncSearch", timeout = 200 }
  end,
})

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

set.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal"
