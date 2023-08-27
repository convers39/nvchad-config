local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- disable default
  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  --
  -- navigation
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- motion & edit
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  { "tpope/vim-repeat", lazy = false },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  { "ggandor/lightspeed.nvim", lazy = false },

  -- git
  { "tpope/vim-fugitive", lazy = false },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  { "f-person/git-blame.nvim", lazy = false },

  { "sindrets/diffview.nvim", lazy = false },

  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    version = "*",
    config = function()
      require("git-conflict").setup()
    end,
  },

  -- autocomplete

  -- ["tzachar/cmp-tabnine"] = {
  --   requires = "hrsh7th/nvim-cmp",
  --   after = "nvim-cmp",
  --   run = "./install.sh",
  --   config = function()
  --     require("cmp_tabnine.config"):setup {
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --       run_on_every_keystroke = true,
  --       snippet_placeholder = "..",
  --       ignored_file_types = {},
  --       show_prediction_strength = false,
  --     }
  --     require("core.utils").add_cmp_source { name = "cmp_tabnine", priority = 1000, max_item_count = 7 }
  --   end,
  -- },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup(require "custom.configs")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    after = "mason-lspconfig.nvim",
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup(require "custom.configs.lspsaga")
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  { "simrat39/rust-tools.nvim" },

  -- enhancement
  { "rcarriga/nvim-notify" },

  { "folke/todo-comments.nvim", lazy = false, dependencies = { "nvim-lua/plenary.nvim" } },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "custom.configs.trouble"
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- ["rmagatti/goto-preview"] = {
  --   config = function()
  --     require("goto-preview").setup { opacity = 20, dismiss_on_move = true }
  --   end,
  -- },

  { "MattesGroeger/vim-bookmarks", lazy = false },

  { "kkharji/sqlite.lua" },

  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { "kkharji/sqlite.lua", module = "sqlite" },
      { "nvim-telescope/telescope.nvim" },
    },
    after = "telescope.nvim",
  },

  { "nacro90/numb.nvim" },

  -- docs
  {
    "kkoomen/vim-doge",
    run = ":call doge#install()",
    config = function()
      require("custom.configs.vim-doge").setup()
    end,
    cmd = { "DogeGenerate", "DogeCreateDocStandard" },
  },

  -- ["danymat/neogen"] = {
  --   c} = {} = {} = {onfig = function() require("neogen").setup(require "user.plugins.neogen-conf") end,
  -- },

  -- ui
  {
    "tiagovla/scope.nvim",
    lazy = false,
    config = function()
      require("scope").setup()
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require "custom.configs.telescope"
    end,
  },
  {
    "matthewgrossman/telescope-file-browser.nvim",
    lazy = false,
    branch = "mg-add-selection-callback-parent-dir",
    after = "telescope.nvim",
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    lazy = false,
    after = "telescope.nvim",
  },
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    lazy = false,
    after = "telescope.nvim",
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    after = "telescope.nvim",
  },

  -- themes
  { "folke/tokyonight.nvim" },
  { "rebelot/kanagawa.nvim" },

  ["EdenEast/nightfox.nvim"] = {
    config = function()
      require("nightfox").setup {
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      }
    end,
  },

  ["ellisonleao/gruvbox.nvim"] = {
    config = function()
      require("gruvbox").setup {
        contrast = "soft",
        transparent_mode = true,
        overrides = {
          StatusLine = { bg = "#282828" },
        },
      }
    end,
  },

  { "sainnhe/gruvbox-material" },

  { "sainnhe/everforest" },
}

return plugins
