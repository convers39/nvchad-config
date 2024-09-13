---@type NvPluginSpec[]
local plugins = {

  -- disable default
  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.nvim-tree",
  },

  {
    "NvChad/nvterm",
    opts = require "custom.configs.nvterm",
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
  {
    "gbprod/substitute.nvim",
    event = "VeryLazy",
    config = function()
      require("substitute").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

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
      "onsails/lspkind.nvim",
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = false,
          auto_refresh = true,
        },
        suggestion = {
          -- enable to use with virtual text
          enabled = false,
          auto_trigger = true,
        },
      }
    end,
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      provider = "copilot",
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  -- formatter
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        dependencies = {
          "nvimtools/none-ls-extras.nvim",
        },
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require "custom.configs.mason-lsp"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = require "custom.configs.treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require "custom.configs.treesitter-textobjects"
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "LspAttach",
    -- lazy = false,
    config = function()
      require "custom.configs.lspsaga"
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
    config = function()
      require "custom.configs.rust-tools"
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
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = false,
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    ft = { "javascript", "typescript", "avascriptreact", "typescriptreact" },
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
  },

  -- enhancement
  {
    "aserowy/tmux.nvim",
    lazy = false,
    config = function()
      return require("tmux").setup()
    end,
  },
  { "rcarriga/nvim-notify" },

  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require "custom.configs.auto-session"
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
      require "custom.configs.trouble"
    end,
  },

  -- ["rmagatti/goto-preview"] = {
  --   config = function()
  --     require("goto-preview").setup { opacity = 20, dismiss_on_move = true }
  --   end,
  -- },

  { "MattesGroeger/vim-bookmarks", lazy = false },

  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require "custom.configs.neoclip"
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
      require "custom.configs.vim-doge"
    end,
    cmd = { "DogeGenerate", "DogeCreateDocStandard" },
  },

  -- ["danymat/neogen"] = {
  --   c} = {} = {} = {onfig = function() require("neogen").setup(require "user.plugins.neogen-conf") end,
  -- },

  -- notetaking
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/Library/CloudStorage/Box-Box/Notes/**.md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require "custom.configs.obsidian"
    end,
    -- opts = require "custom.configs.obsidian",
  },

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
