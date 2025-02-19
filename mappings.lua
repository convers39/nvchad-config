-- -@type MappingsTable
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
    ["<leader>D"] = "",
    ["<leader>fb"] = "",
    ["<leader>fm"] = "",
    ["<leader>ma"] = "",
    ["<leader>th"] = "",
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
    ["<leader>;"] = { ":", "enter command mode", opts = { nowait = true } },
    -- ["<leader>w"] = { "<cmd>w<cr>", "save current buffer", opts = { nowait = true } },
    -- override with <cmd> to prevent cmd popup from noice
    ["<Esc>"] = { "<cmd>noh<cr>", "No highlight" },
    ["<C-q>"] = { "<C-w>q", "Close window" },
    -- resize
    ["<A-l>"] = { "<cmd>vertical resize +2<CR>" },
    ["<A-h>"] = { "<cmd>vertical resize -2<CR>" },
    ["<A-j>"] = { "<cmd>resize -2<CR>" },
    ["<A-k>"] = { "<cmd>resize +2<CR>" },
    ["<A-=>"] = { "<C-w>=", "Resize equal" },

    -- nvim tree
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- navigation
    ["<C-u>"] = { "10k", "Move up 10 lines" },
    ["<C-d>"] = { "10j", "Move down 10 lines" },
    ["]t"] = { "<cmd>tabnext<cr>", "Move to next tab" },
    ["[t"] = { "<cmd>tabprevious<cr>", "Move to previous tab" },

    -- split
    ["|"] = { "<C-w>v", "Split window vertically" },
    ["\\"] = { "<C-w>s", "Split window horizontally" },

    -- multi-cursor
    ["<A-u>"] = { "<cmd>call vm#commands#add_cursor_up(0, v:count1)<cr>" },
    ["<A-d>"] = { "<cmd>call vm#commands#add_cursor_down(0, v:count1)<cr>" },

    -- substitute
    ["r"] = {
      function()
        require("substitute").operator()
      end,
      "Substitute with operator",
      opts = { noremap = true },
    },
    ["rr"] = {
      function()
        require("substitute").line()
      end,
      "Substitute current line",
      opts = { noremap = true },
    },
    ["R"] = {
      function()
        require("substitute").eol()
      end,
      "Substitute end of line",
      opts = { noremap = true },
    },
    -- ["rs"] = {
    --   function()
    --     require("substitute.range").operator()
    --   end,
    --   "Substitute range with operator",
    --   opts = { noremap = true },
    -- },
    -- ["rss"] = {
    --   function()
    --     require("substitute.range").word()
    --   end,
    --   "Substitute range with current word",
    --   opts = { noremap = true },
    -- },

    -- quickfix list
    ["qfj"] = { "<cmd>cnewer<cr>" },
    ["qfk"] = { "<cmd>colder<cr>" },
    ["qfo"] = { "<cmd>copen<cr>" },

    -- close buffer
    ["<leader>C"] = {
      '<cmd>sil! exe "wa|%bd|e#|bd#|normal `"<cr>"',
      "Save and close other buffers",
    },
    ["<leader>bo"] = {
      '<cmd>sil! exe "%bd|e#|bd#|normal `"<cr>"',
      "Close other buffers except unsaved",
    },
    -- outline
    ["<C-b>"] = { "<cmd>Lspsaga outline<cr>" },
    -- lazygit
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", opts = { silent = true, noremap = true } },

    -- git diff vieww
    ["gdo"] = { "<cmd>DiffviewOpen<CR>" },
    ["gdc"] = { "<cmd>DiffviewClose<CR>" },
    ["gdb"] = { "<cmd>DiffviewFileHistory<CR>", "Diffview on current branch" },
    ["gdf"] = { "<cmd>DiffviewFileHistory %<CR>", "Diffview on current file" },

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
    ["gbl"] = { "<cmd>GitBlameToggle<cr>", "Toggle git blame" },
    ["gbc"] = { "<cmd>GitBlameCopyFileURL<cr>", "Copy current line remote url to clipboard" },

    -- docs
    -- ["ng"] = { "<cmd>lua require('neogen').generate()<cr>", noremap = true },
    ["<leader>D"] = { "<cmd>DogeGenerate<cr>", "Generate documentation template" },

    -- code runner
    -- ["<leader>r"] = { "<cmd>SnipRun<cr>" },
  },
  v = {
    -- [";"] = { ":", nowait = true },
    -- [";"] = { "<cmd>FineCmdline<cr>", nowait = true,  "Floating cmd input" },
    ["J"] = { ":move '>+1<CR>gv-gv", "Move lines of code up" },
    ["K"] = { ":move '<-2<CR>gv-gv", "Move lines of code down" },
    -- code runner
    -- ["<leader>r"] = { "<cmd>SnipRun<cr>" },
    -- gitsigns
    ["ghr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset git hunk",
    },
    ["ghs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage git hunk",
    },
    -- substitute
    ["r"] = {
      function()
        require("substitute").visual()
      end,
      "Substitute selected text",
      opts = { noremap = true },
    },
    -- ["rs"] = {
    --   function()
    --     require("substitute.range").visual()
    --   end,
    --   "Substitute range with selected text ",
    --   opts = { noremap = true },
    -- },
  },
  i = {
    ["<C-h>"] = { "<ESC>I", "Insert to the first char of current line" },
    ["<C-l>"] = { "<ESC>A", "Insert to the last char of current line" },
  },
  t = {
    ["<A-n>"] = { "<C-\\><C-n>", "Terminal normal mode" },
    -- resize
    ["<A-l>"] = { "<C-\\><C-n>:vertical resize +5<CR>" },
    ["<A-h>"] = { "<C-\\><C-n>:vertical resize -5<CR>" },
    ["<A-j>"] = { "<C-\\><C-n>:resize -5<CR>" },
    ["<A-k>"] = { "<C-\\><C-n>:resize +5<CR>" },
    -- Improved Terminal Navigation
    ["<C-h>"] = { "<cmd>wincmd h<cr>", "Terminal left window navigation" },
    ["<C-j>"] = { "<cmd>wincmd j<cr>", "Terminal down window navigation" },
    ["<C-k>"] = { "<cmd>wincmd k<cr>", "Terminal up window navigation" },
    ["<C-l>"] = { "<cmd>wincmd l<cr>", "Terminal right window navigation" },
    ["<C-q>"] = { "<cmd>wincmd q<cr>", "Terminal close" },
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
    ["gpt"] = {
      "<cmd>Lspsaga peek_type_definition<cr>",
      "Lspsaga peek type declaration",
    },

    ["gt"] = {
      "<cmd>Lspsaga goto_type_definition<cr>",
      "Lspsaga goto type declaration",
    },

    ["gd"] = {
      -- function()
      --   vim.lsp.buf.definition()
      -- end,
      "<cmd>Lspsaga goto_definition<cr>",
      "Lspsaga goto definition",
    },

    ["gpd"] = {
      "<cmd>Lspsaga peek_definition<cr>",
      "Lspsaga peek definition",
    },

    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gr"] = {
      function()
        -- vim.lsp.buf.references()
        require("telescope.builtin").lsp_references { noremap = true, silent = true }
      end,
      "LSP references",
    },

    ["gi"] = {
      function()
        -- vim.lsp.buf.implementation()
        require("telescope.builtin").lsp_implementations { noremap = true, silent = true }
      end,
      "LSP implementation",
    },

    ["gpf"] = {
      "<cmd>Lspsaga finder<cr>",
      "Lspsaga finder with references and implementations",
    },

    ["K"] = {
      -- function()
      --   vim.lsp.buf.hover()
      -- end,
      "<cmd>Lspsaga hover_doc<cr>",
      "LSP hover",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>la"] = {
      -- function()
      --   vim.lsp.buf.code_action()
      -- end,
      "<cmd>Lspsaga code_action<cr>",
      "LSP code action",
    },

    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
        -- require("telescope.builtin").diagnostics { noremap = true, silent = true }
      end,
      "Show lsp diagnostic",
    },

    ["<leader>lf"] = {
      function()
        -- vim.lsp.buf.format { timeout_ms = 500 }
        require("conform").format()
      end,
      "LSP code format",
    },

    ["[d"] = {
      -- function()
      --   vim.diagnostic.goto_prev { float = { border = "rounded" } }
      -- end,
      "<cmd>Lspsaga diagnostic_jump_prev<cr>",
      "Goto prev diagnostic",
    },

    ["]d"] = {
      -- function()
      --   vim.diagnostic.goto_next { float = { border = "rounded" } }
      -- end,
      "<cmd>Lspsaga diagnostic_jump_next<cr>",
      "Goto next diagnostic",
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
    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>gS"] = { "<cmd> Telescope git_stash <CR>", "Git stash" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "Git branches" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>T"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>sk"] = { "<cmd>Telescope keymaps<CR>", "Show keymaps" },
    ["<leader>td"] = { "<cmd>TodoTelescope<CR>", "Show todo items" },

    -- registers & marks
    ["<leader>sr"] = { "<cmd>Telescope registers<CR>", "Show registers" },
    ["<leader>sm"] = { "<cmd>Telescope marks<CR>", "Show marks" },
    ["<leader>ma"] = {
      function()
        require("telescope").extensions.vim_bookmarks.all()
      end,
      "Show all bookmarks",
    },
    ["<leader>mc"] = {
      function()
        require("telescope").extensions.vim_bookmarks.current_file()
      end,
      "Show current file bookmarks",
    },
    ["<leader>fc"] = {
      "<cmd>Telescope neoclip<cr>",
      "Search clipboard",
    },

    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },

    ["<leader>fs"] = {
      "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
      "Telescope file browser",
    },
    ["<leader>fw"] = {
      "<cmd>lua require 'telescope'.extensions.live_grep_args.live_grep_args()<CR>",
      "Search word with args",
    },
    ["<leader>fb"] = {
      function()
        require("telescope.builtin").buffers {
          sort_mru = true,
          -- ignore_current_buffer = true,
        }
      end,
      "Find buffers in mru order",
    },
    ["<leader>ss"] = {
      function()
        require("telescope.builtin").grep_string()
      end,
      "Search current word on cursor",
    },
    ["<leader>S"] = {
      function()
        require("auto-session.session-lens").search_session()
      end,
      noremap = true,
      "Search saved sessions",
    },
    ["<leader>'"] = {
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      "Fuzzy find lines",
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

    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>tv"] = {
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

    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>tv"] = {
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
      "Preview changes in a hunk",
    },

    -- Actions
    ["ghr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset git hunk",
    },
    ["ghs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage git hunk",
    },
    ["ghu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Unstage git hunk",
    },
    ["gbr"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset git buffer",
    },
    -- ["gd"] = { function() require("gitsigns").diffthis() end,  "View git diff" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle debugger ui",
    },
    ["<leader>de"] = {
      function()
        require("dapui").eval()
      end,
      "Evaluate epression from cursor",
    },
    ["<leader>dd"] = { "<cmd> DapToggleBreakpoint <cr>" },
    ["<leader>di"] = { "<cmd> DapStepIn <cr>" },
    ["<leader>dc"] = { "<cmd> DapContinue <cr>" },
    ["<leader>do"] = { "<cmd> DapStepOut <cr>" },
    ["<leader>dv"] = { "<cmd> DapStepOver <cr>" },
    ["<leader>dt"] = { "<cmd> DapTerminate <cr>" },
    ["<leader>dr"] = { "<cmd> DapToggleRepl <cr>" },
    ["<leader>dl"] = { "<cmd> DapShowLog <cr>" },
  },
  v = {
    ["<leader>de"] = {
      function()
        require("dapui").eval()
      end,
      "Evaluate epression from selected",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

M.tmux = {
  plugin = true,
  n = {
    ["<C-l>"] = { "<cmd>lua require('tmux').move_left()<cr>" },
    ["<C-j>"] = { "<cmd>lua require('tmux').move_bottom()<cr>" },
    ["<C-k>"] = { "<cmd>lua require('tmux').move_top()<cr>" },
    ["<C-h>"] = { "<cmd>lua require('tmux').move_right()<cr>" },
  },
}

M.obsidian = {
  plugin = true,
  n = {
    -- ["gf"] = {
    --   "<cmd>ObsidianFollowLink<cr>",
    --   "Move to file following link under cursor",
    -- },
    ["<leader>ll"] = {
      "<cmd>ObsidianBacklinks<cr>",
      "Show backlink location list",
    },
    ["<leader>so"] = {
      "<cmd>ObsidianSearch<cr>",
      "Search obsidian notes",
    },
  },
}

return M
