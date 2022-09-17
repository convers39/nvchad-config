local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt,
  b.formatting.prettier.with {
    filetypes = { "html", "markdown", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },
  },
  -- Lua
  b.formatting.stylua,
  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  -- cpp
  -- b.formatting.clang_format,
  b.formatting.rustfmt,
  -- diagnostics
  b.diagnostics.eslint,
  b.diagnostics.codespell,
  b.diagnostics.hadolint,
  b.diagnostics.mypy,
  -- code_actions
  b.code_actions.refactoring,
  b.code_actions.eslint,
  b.code_actions.gitsigns,
  -- completion
  b.completion.luasnip,
  b.completion.spell,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end,
}
