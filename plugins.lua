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
  {
    "hrsh7th/nvim-cmp",
    opts = require "custom.configs.nvim-cmp",
    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {} -- put your options here
        end,
      },
    },
  },

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
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "VeryLazy",
    config = function()
      require("lspsaga").setup(require "custom.configs.lspsaga")
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    after = "mason-lspconfig.nvim",
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
      require("core.utils").load_mappings "crates"
    end,
  },

  -- dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },

  -- enhancement
  { "rcarriga/nvim-notify" },

  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup(require "custom.configs.auto-session")
    end,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },

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
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup(require "custom.configs.trouble")
    end,
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
    config = function()
      require("neoclip").setup(require "custom.configs.neoclip")
    end,
    dependencies = {
      { "kkharji/sqlite.lua" },
      { "nvim-telescope/telescope.nvim" },
    },
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
