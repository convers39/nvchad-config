local overrides = require "custom.plugins.overrides"

return {
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-surround"] = {},
  ["tpope/vim-fugitive"] = {},
  ["folke/todo-comments.nvim"] = {},
  ["folke/trouble.nvim"] = {},
  ["mg979/vim-visual-multi"] = {},
  ["kdheepak/lazygit.nvim"] = {},
  -- ["Shatur/neovim-session-manager"] = {
  --   config = function()
  --     require("session_manager").setup {
  --       autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
  --     }
  --   end,
  -- },
  ["rmagatti/auto-session"] = {
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_use_git_branch = false,
        cwd_change_handling = {
          restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
          pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
          post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
            require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
            local nvim_tree = require "nvim-tree"
            nvim_tree.change_dir(vim.fn.getcwd())
            nvim_tree.refresh()
          end,
        },
      }
    end,
  },
  -- ["rmagatti/session-lens"] = {
  --   requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
  --   config = function()
  --     require("session-lens").setup {
  --       path_display = { "shorten" },
  --     }
  --   end,
  -- },
  -- Override plugin definition options
  ["tzachar/cmp-tabnine"] = {
    after = "nvim-cmp",
    run = "./install.sh",
    config = overrides.tabnine,
    override_options = overrides.tabnine,
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
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

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
