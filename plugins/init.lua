local overrides = require "custom.plugins.overrides"

return {
  ["mg979/vim-visual-multi"] = {},
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-surround"] = {},
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  -- Session/Project Management
  -- ["ahmedkhalf/project.nvim"] = {
  --   after = "telescope.nvim",
  --   -- config = function()
  --   --   require("telescope").load_extension "projects"
  --   -- end,
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
            -- local nvim_tree = require "nvim-tree"
            -- nvim_tree.change_dir(vim.fn.getcwd())
            -- nvim_tree.refresh()
          end,
        },
      }
    end,
  },
  ["rmagatti/session-lens"] = {
    after = "telescope.nvim",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "session-lens"
      require("session-lens").setup {
        path_display = { "shorten" },
      }
    end,
  },
  -- ["Shatur/neovim-session-manager"] = {
  --   config = function()
  --     require("session_manager").setup {
  --       autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
  --     }
  --   end,
  -- },

  -- git
  ["kdheepak/lazygit.nvim"] = {},
  ["tpope/vim-fugitive"] = {},
  ["akinsho/git-conflict.nvim"] = {
    tag = "*",
    config = function()
      require("git-conflict").setup()
    end,
  },
  ["TimUntersberger/neogit"] = {
    after = "plenary.nvim",
    requires = "nvim-lua/plenary.nvim",
  },
  ["sindrets/diffview.nvim"] = {
    after = "plenary.nvim",
    requires = "nvim-lua/plenary.nvim",
  },
  ["puremourning/vimspector"] = {},

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

  ["nvim-telescope/telescope-project.nvim"] = {
    after = "telescope.nvim",
    -- module = "telescope",
    config = function()
      require("telescope").load_extension "project"
    end,
    -- override_options = overrides.telescope,
  },
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
