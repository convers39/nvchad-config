local overrides = require "custom.plugins.overrides"

return {
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-surround"] = {},
  ["tpope/vim-fugitive"] = {},
  ["folke/todo-comments.nvim"] = {},
  ["folke/trouble.nvim"] = {},
  ["mg979/vim-visual-multi"] = {},
  ["kdheepak/lazygit.nvim"] = {},
  ["tzachar/cmp-tabnine"] = {
    after = "nvim-cmp",
    run = "./install.sh",
    config = overrides.tabnine,
    override_options = overrides.tabnine,
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
    --gruvbox_light cmd = "Alpha",
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
    -- tal
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- [""]

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
