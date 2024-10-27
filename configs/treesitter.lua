return {
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
    "solidity",
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
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
}
