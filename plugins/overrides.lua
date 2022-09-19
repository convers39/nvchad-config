local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "rust",
    "css",
    "typescript",
    "c",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "yaml-language-server",
    "docker-langserver",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = function()
  return {
    formatting = {
      format = function(entry, vim_item)
        if entry.source.name == "cmp_tabnine" and entry.completion_item.data ~= nil then
          vim_item.kind = string.format("%s %s", "", " TabNine")
        else
          local icons = require("nvchad_ui.icons").lspkind
          vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        end

        return vim_item
      end,
    },
    sources = {
      { name = "cmp_tabnine" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }
end

M.tabnine = function()
  return {
    max_lines = 1000,
    max_num_results = 7,
    sort = true,
    run_on_every_keystroke = true,
    show_prediction_strength = false,
  }
end

return M
