local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
    "rust",
    "hcl",
    "graphql",
    -- "help",
    "terraform",
    "sql",
    "jsdoc",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lsp
    "lua-language-server",
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "emmet-ls",
    "typescript-language-server",
    -- "python-language-server",
    "pyright",
    "rust-analyzer",
    "graphql",
    "terraform-ls",

    -- linter & diagnostics
    "hadolint",
    "eslint_d",
    "mypy",
    "ruff",

    -- formatter
    "prettierd",
    "stylua",
    "black",
    "yamlfmt",

    -- dap
    "debugpy",
    "chrome-debug-adapter",
    "js-debug-adapter",
    "node-debug2-adapter",
  },
  automatic_installation = true,
  handlers = nil,
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
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

return M
