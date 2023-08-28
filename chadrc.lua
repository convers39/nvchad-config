---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  -- nvdash (dashboard)
  telescope = { style = "bordered" }, -- borderless / bordered
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = false,
    overriden_modules = nil,
  },
  nvdash = {
    load_on_startup = true,

    header = {
      "                                   ",
      "███████ ███████ ███    ██ ███    ██",
      "   ███  ██      ████   ██ ████   ██",
      "  ███   █████   ██ ██  ██ ██ ██  ██",
      " ███    ██      ██  ██ ██ ██  ██ ██",
      "███████ ███████ ██   ████ ██   ████",
      "                                   ",
      " ███    ██ ██    ██ ██ ███    ███  ",
      " ████   ██ ██    ██ ██ ████  ████  ",
      " ██ ██  ██ ██    ██ ██ ██ ████ ██  ",
      " ██  ██ ██  ██  ██  ██ ██  ██  ██  ",
      " ██   ████   ████   ██ ██      ██  ",
      "                                   ",
    },

    buttons = {
      { "  Sessions", "Spc S", "Telescope session-lens" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find Files", "Spc f f", "Telescope files" },
      { "󰈭  Find Word", "Spc f w", "<cmd>lua require 'telescope'.extensions.live_grep_args.live_grep_args()<CR>" },
      { "  Bookmarks", "Spc m a", "<cmd>lua require 'telescope'.extensions.vim_bookmarks.all()<cr>" },
      { "  Themes", "Spc t t", "Telescope themes" },
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
