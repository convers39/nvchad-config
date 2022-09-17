local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    -- resize windows
    ["<M-Right>"] = { ":vertical resize +5<CR>", "window vertical size +5" },
    ["<M-Left>"] = { ":vertical resize -5<CR>", "window vertical size -5" },
    ["<M-Down>"] = { ":resize -5<CR>", "window size -5" },
    ["<M-Up>"] = { ":resize +5<CR>", "window size +5" },
    ["<leader>gg"] = {":LazyGit<CR>", "Open LazyGit floating window"}
  },
  i = {
    -- ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    ["jj"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>fs"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    -- ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
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

    ["<A-V>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
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
    ["<leader>n"] = ""
  }
}

M.telescope = {
  plugin = true,

  n = {
    -- theme switcher
    -- ["<leader>nt"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

return M
