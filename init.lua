local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command
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

autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

vim.g.disable_cmp = false
usercmd("CmpToggle", function(args)
  if vim.b.disable_cmp or vim.g.disable_cmp then
    vim.b.disable_cmp = false
    vim.g.disable_cmp = false
  else
    if args.bang then
      vim.b.disable_cmp = true
    else
      vim.g.disable_cmp = true
    end
  end
end, {
  desc = "Toggle nvim-cmp",
  bang = true,
})

vim.g.disable_autoformat = false
usercmd("AutoFormatToggle", function(args)
  if vim.b.disable_autoformat or vim.g.disable_autoformat then
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
  else
    if args.bang then
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
  end
end, {
  desc = "Toggle autoformat-on-save",
  bang = true,
})

-- test text, with some characters, separated by random signs. see if it is working correctly. --
local chars = { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "-", "%", "`", "?" }
for _, char in ipairs(chars) do
  for _, mode in ipairs { "x", "o" } do
    vim.api.nvim_set_keymap(
      mode,
      "i" .. char,
      string.format(":<C-u>normal! T%svt%s<CR>", char, char, char),
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      mode,
      "a" .. char,
      string.format(":<C-u>normal! F%svf%s<CR>", char, char, char),
      { noremap = true, silent = true }
    )
  end
end
