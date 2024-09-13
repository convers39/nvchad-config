local cmp = require "cmp"
return {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "copilot" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "crates" },
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
  },
}
