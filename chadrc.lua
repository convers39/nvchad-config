-- local pluginConfs = require "custom.plugins.configs"
local M = {}

-- M.plugins = {
--   user = require "custom.plugins",
--   override = {
--     ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
--     ["tzachar/cmp-tabnine"] = pluginConfs.tabnine,
--   },
-- }
M.ui = {
  theme_toggle = { "gruvchad", "everforest" },
  theme = "gruvchad",
}

M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
