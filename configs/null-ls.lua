local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {
  -- Lua
  b.formatting.stylua,
  -- Set a formatter
  b.formatting.prettierd,
  b.formatting.rustfmt,
  b.formatting.stylua,
  b.formatting.black,
  -- formatting.yamlfmt,
  -- Set a linter
  b.diagnostics.mypy,
  b.diagnostics.hadolint,
  -- diagnostics.cspell,
  b.diagnostics.eslint_d,
  b.code_actions.refactoring,
  b.code_actions.eslint_d,
  b.code_actions.gitsigns,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
