local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    -- resize windows
    ["<A-Right>"] = { ":vertical resize +2<CR>", "window vertical size +2" },
    ["<A-Left>"] = { ":vertical resize -2<CR>", "window vertical size -2" },
    ["<A-Down>"] = { ":resize -2<CR>", "window size -2" },
    ["<A-Up>"] = { ":resize +2<CR>", "window size +2" },
    ["<A-=>"] = { "<C-w>=", "half window size" },
    -- navigation
    ["<A-h>"] = { "<C-w>h", "Go to the left window" },
    ["<A-j>"] = { "<C-w>j", "Go to the down window" },
    ["<A-k>"] = { "<C-w>k", "Go to the up window" },
    ["<A-l>"] = { "<C-w>l", "Go to the right window" },
    ["<A-q>"] = { "<C-w>q", "Close current window" },
    ["C-u"] = { "10k", "Go to 10 lines up" },
    ["C-d"] = { "10j", "Go to 10 lines down" },
    -- split
    ["<A-v>"] = { "<C-w>v", "Split vertically" },
    ["<A-s>"] = { "<C-w>s", "Split horizontally" },
    -- lazygit
    ["<leader>gg"] = { ":LazyGit<CR>", "Open LazyGit floating window" },
    -- session manager
    ["<leader>sl"] = {
      ":Autosession search<CR>",
      "Select and load session",
    },
    ["<leader>ss"] = {
      ":SaveSession<CR>",
      "Save or create a session in the currently set `auto_session_root_dir`",
    },
    ["<leader>sr"] = {
      ":RestoreSession<CR>",
      "Restore a previously saved session based on the `cwd`",
    },
    ["<leader>sd"] = {
      ":Autosession delete<CR>",
      "Select and delete session",
    },
    -- ["<leader>sc"] = {
    --   ":SessionManager load_current_dir_session<CR>",
    --   "Will remove all buffers and :source the last saved session file of the current directory.",
    -- },
    -- ["<leader>ss"] = {
    --   ":SessionManager save_current_session<CR>",
    --   "Works like :mksession, but saves/creates current directory as a session in sessions_dir.",
    -- },
    -- ["<leader>sl"] = {
    --   ":SessionManager load_session<CR>",
    --   "Select and load session",
    -- },
    -- ["<leader>sd"] = {
    --   ":SessionManager delete_session<CR>",
    --   "Select and delete session",
    -- },
  },
  i = {
    -- ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    ["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["<C-h>"] = { "<ESC>I", "Insert before the first character" },
    ["<C-l>"] = { "<ESC>A", "Insert after the last character" },
  },
  v = {
    ["<"] = { "<gv", "Indent left" },
    [">"] = { ">gv", "Indent right" },
    ["J"] = { ":move '>+1<CR>gv-gv", "Move selected lines up" },
    ["K"] = { ":move '>-2<CR>gv-gv", "Move selected lines down" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    -- ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-H>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    -- ["<A-v>"] = "",
    ["<A-V>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
    -- navigate from terminal to other window
    ["<ESC>"] = { [[<C-\><C-N>]], "Esc terminal insert mode" },
    ["<A-h>"] = { [[<C-\><C-N><C-w>h]], "Go to the left window" },
    ["<A-j>"] = { [[<C-\><C-N><C-w>j]], "Go to the down window" },
    ["<A-k>"] = { [[<C-\><C-N><C-w>k]], "Go to the up window" },
    ["<A-l>"] = { [[<C-\><C-N><C-w>l]], "Go to the right window" },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-H>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-V>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
    -- ["<Leader>tf"] = {
    --   function()
    --     require("nvterm.terminal").toggle "float"
    --   end,
    --   "toggle floating term",
    -- },
    --
    -- ["<leader>th"] = {
    --   function()
    --     require("nvterm.terminal").toggle "horizontal"
    --   end,
    --   "toggle horizontal term",
    -- },
    --
    -- ["<leader>tv"] = {
    --   function()
    --     require("nvterm.terminal").toggle "vertical"
    --   end,
    --   "toggle vertical term",
    -- },

    -- new

    -- ["<leader>h"] = {
    --   function()
    --     require("nvterm.terminal").new "horizontal"
    --   end,
    --   "new horizontal term",
    -- },
    --
    -- ["<leader>v"] = {
    --   function()
    --     require("nvterm.terminal").new "vertical"
    --   end,
    --   "new vertical term",
    -- },
  },
}

M.disabled = {
  n = {
    ["<leader>n"] = "",
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- theme switcher
    -- ["<leader>nt"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
    ["<leader>tp"] = { "<cmd> Telescope project <CR>", "browse project list" },
    ["<leader>ts"] = { "<cmd> SearchSession <CR>", "browse session list" },
    ["<leader>td"] = { "<cmd> TodoTelescope <CR>", "browse TODO list" },
  },
}

return M
