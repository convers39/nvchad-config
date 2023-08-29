local capabilities = require("plugins.configs.lspconfig").capabilities

local utils = require "core.utils"
local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  -- NOTE: enable this line will cause an error with rust file
  -- if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end
end

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

return options
