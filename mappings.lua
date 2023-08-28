---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<S-tab>"] = "",
    ["<tab>"] = "",
    ["<leader>x"] = "",
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["<leader>q"] = "",
    ["<leader>e"] = "",
    ["<leader>fz"] = "",
    ["<leader>fw"] = "",
    ["<leader>fb"] = "",
    ["<leader>fm"] = "",
    ["<leader>ma"] = "",
    ["gb"] = "",
    ["gbc"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
    ["<leader>td"] = "",
    ["<leader>f"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>w"] = { "<cmd>w<cr>", "save current buffer", opts = { nowait = true } },
    ["<ESC>"] = { "<cmd>nohl<cr>", desc = "No highlight", opts = { silent = true } },
    ["<C-q>"] = { "<C-w>q", desc = "Close window" },
    -- [";"] = { "<cmd>FineCmdline<cr>", nowait = true, desc = "Floating cmd input" },
    -- resize
    ["<A-l>"] = { "<cmd>vertical resize +2<CR>" },
    ["<A-h>"] = { "<cmd>vertical resize -2<CR>" },
    ["<A-j>"] = { "<cmd>resize -2<CR>" },
    ["<A-k>"] = { "<cmd>resize +2<CR>" },
    ["<A-=>"] = { "<C-w>=", desc = "Resize equal" },

    -- nvim tree
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- navigation
    ["<C-u>"] = { "10k", desc = "Move up 10 lines" },
    ["<C-d>"] = { "10j", desc = "Move down 10 lines" },
    ["<]t>"] = { "<cmd>tabnext<cr>", desc = "Move to next tab" },
    ["<[t>"] = { "<cmd>tabprevious<cr>", desc = "Move to previous tab" },

    -- split
    ["|"] = { "<C-w>v", desc = "Split window vertically" },
    ["\\"] = { "<C-w>s", desc = "Split window horizontally" },

    -- multi-cursor
    ["<A-u>"] = { "<cmd>call vm#commands#add_cursor_up(0, v:count1)<cr>" },
    ["<A-d>"] = { "<cmd>call vm#commands#add_cursor_down(0, v:count1)<cr>" },

    -- quickfix list
    ["qfj"] = { "<cmd>cnewer<cr>" },
    ["qfk"] = { "<cmd>colder<cr>" },
    ["qfo"] = { "<cmd>copen<cr>" },

    -- close buffer
    ["<leader>C"] = {
      '<cmd>sil! exe "wa|%bd|e#|bd#|normal `"<cr>"',
      desc = "Save and close other buffers",
    },
    ["<leader>bo"] = {
      '<cmd>sil! exe "%bd|e#|bd#|normal `"<cr>"',
      desc = "Close other buffers except unsaved",
    },
    -- Aerial
    ["<C-b>"] = { "<cmd>AerialToggle<cr>" },
    -- trouble
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", noremap = true, silent = true },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", noremap = true, silent = true },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", noremap = true, silent = true },
    ["<leader>xr"] = { "<cmd>TroubleToggle lsp_references<cr>", noremap = true, silent = true },
    ["gxj"] = {
      function()
        require("trouble").next { skip_groups = true, jump = true }
      end,
      noremap = true,
      silent = true,
    },
    ["gxk"] = {
      function()
        require("trouble").previous { skip_groups = true, jump = true }
      end,
      noremap = true,
      silent = true,
    },
    ["gxf"] = {
      function()
        require("trouble").first { skip_groups = true, jump = true }
      end,
      noremap = true,
      silent = true,
    },
    ["gxl"] = {
      function()
        require("trouble").last { skip_groups = true, jump = true }
      end,
      noremap = true,
      silent = true,
    },

    -- lazygit
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", opts = { silent = true, noremap = true } },

    -- git diff vieww
    ["gdo"] = { "<cmd>DiffviewOpen<CR>" },
    ["gdc"] = { "<cmd>DiffviewClose<CR>" },
    ["gdf"] = { "<cmd>DiffviewFileHistory<CR>" },

    -- git conflict
    ["gco"] = { "<cmd>GitConflictChooseOurs<CR>" },
    ["gct"] = { "<cmd>GitConflictChooseTheirs<CR>" },
    ["gcB"] = { "<cmd>GitConflictChooseBase<CR>" },
    ["gcb"] = { "<cmd>GitConflictChooseBoth<CR>" },
    ["gcn"] = { "<cmd>GitConflictChooseNone<CR>" },
    ["gcj"] = { "<cmd>GitConflictNextConflict<CR>" },
    ["gck"] = { "<cmd>GitConflictPrevConflict<CR>" },
    ["gcq"] = { "<cmd>GitConflictListQf<CR>" },

    -- git-blame
    ["gbl"] = { "<cmd>GitBlameToggle<cr>", desc = "Toggle git blame" },
    ["gbc"] = { "<cmd>GitBlameCopyFileURL<cr>", desc = "Copy current line remote url to clipboard" },

    -- docs
    -- ["ng"] = { "<cmd>lua require('neogen').generate()<cr>", noremap = true },
    ["<leader>dd"] = { "<cmd>DogeGenerate<cr>", desc = "Generate documentation template" },

    -- code runner
    ["<leader>r"] = { "<cmd>SnipRun<cr>" },
  },
  v = {
    [";"] = { ":", nowait = true },
    -- [";"] = { "<cmd>FineCmdline<cr>", nowait = true, desc = "Floating cmd input" },
    ["J"] = { ":move '>+1<CR>gv-gv", desc = "Move lines of code up" },
    ["K"] = { ":move '<-2<CR>gv-gv", desc = "Move lines of code down" },
    -- code runner
    -- ["<leader>r"] = { "<cmd>SnipRun<cr>" },
    -- gitsigns
    ["ghr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Reset git hunk",
    },
    ["ghs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Stage git hunk",
    },
  },
  i = {
    ["<C-h>"] = { "<ESC>I", desc = "Insert to the first char of current line" },
    ["<C-l>"] = { "<ESC>A", desc = "Insert to the last char of current line" },
  },
  t = {
    ["<A-n>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    -- resize
    ["<A-l>"] = { "<C-\\><C-n>:vertical resize +5<CR>" },
    ["<A-h>"] = { "<C-\\><C-n>:vertical resize -5<CR>" },
    ["<A-j>"] = { "<C-\\><C-n>:resize -5<CR>" },
    ["<A-k>"] = { "<C-\\><C-n>:resize +5<CR>" },
    -- Improved Terminal Navigation
    ["<C-h>"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" },
    ["<C-j>"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" },
    ["<C-k>"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" },
    ["<C-l>"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" },
    ["<C-q>"] = { "<cmd>wincmd q<cr>", desc = "Terminal close" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Show lsp diagnostic",
    },

    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format()
      end,
      "LSP code format",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    -- ["<leader>dl"] = {
    --   function()
    --     vim.diagnostic.setloclist()
    --   end,
    --   "Diagnostic setloclist",
    -- },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    -- ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>tt"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>sk"] = { "<cmd>Telescope keymaps<CR>", desc = "Show keymaps" },
    ["<leader>td"] = { "<cmd> TodoTelescope <CR>", desc = "Show todo items" },
    ["<leader>ma"] = {
      function()
        require("telescope").extensions.vim_bookmarks.all()
      end,
      desc = "Show all bookmarks",
    },
    ["<leader>mc"] = {
      function()
        require("telescope").extensions.vim_bookmarks.current_file()
      end,
      desc = "Show current file bookmarks",
    },
    ["<leader>fs"] = {
      "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
      desc = "Telescope file browser",
    },
    ["<leader>fw"] = {
      "<cmd>lua require 'telescope'.extensions.live_grep_args.live_grep_args()<CR>",
      desc = "Search word with args",
    },
    ["<leader>fc"] = {
      "<cmd>Telescope neoclip<cr>",
      desc = "Search clipboard",
    },
    ["<leader>fd"] = {
      "<cmd>Telescope aerial<cr>",
      desc = "Find symbols in current file",
    },
    ["<leader>fb"] = {
      function()
        require("telescope.builtin").buffers {
          sort_mru = true,
          -- ignore_current_buffer = true,
        }
      end,
      desc = "Find buffers in mru order",
    },
    ["<leader>ss"] = {
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Search current word on cursor",
    },
    ["<leader>S"] = {
      function()
        require("auto-session.session-lens").search_session()
      end,
      noremap = true,
      desc = "Search current word on cursor",
    },
    ["<leader>;"] = {
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Fuzzy find lines",
    },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-o>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<leader>h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-o>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<leader>h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["ghj"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["ghk"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    ["ghp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview changes in a hunk",
    },

    -- Actions
    ["ghr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Reset git hunk",
    },
    ["ghs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Stage git hunk",
    },
    ["ghu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      desc = "Unstage git hunk",
    },
    ["gbr"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Reset git buffer",
    },
    -- ["gd"] = { function() require("gitsigns").diffthis() end, desc = "View git diff" },
  },
}

return M
