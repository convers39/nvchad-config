vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
}
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "ts_ls", "pyright", "solidity", "biome" }

for _, lsp in ipairs(servers) do
  if lsp == "solidity" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
      filetypes = { "solidity" },
      root_dir = lspconfig.util.find_git_ancestor,
      single_file_support = true,
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
