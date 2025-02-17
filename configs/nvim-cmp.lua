local cmp = require "cmp"
local kind_icons = {
  Namespace = "󰌗",
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰆧",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈚",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰊄",
  Table = "",
  Object = "󰅩",
  Tag = "",
  Array = "[]",
  Boolean = "",
  Number = "",
  Null = "󰟢",
  Supermaven = "",
  String = "󰉿",
  Calendar = "",
  Watch = "󰥔",
  Package = "",
  Codeium = "",
  TabNine = "",
  Minuet = "󱗻",
  Copilot = "",
  gemini = "󰊭",
}

return {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "copilot" },
    { name = "minuet" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "crates" },
  },
  performance = {
    fetching_timeout = 2000,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      -- vim_item.menu = ({
      --   minuet = "󱗻",
      -- })[entry.source.name]
      return vim_item
    end,
  },
  mapping = {
    -- ["<CR>"] = cmp.mapping(function(fallback)
    --   -- use the internal non-blocking call to check if cmp is visible
    --   if cmp.core.view:visible() then
    --     cmp.confirm { select = true }
    --   else
    --     fallback()
    --   end
    -- end),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
  },
}
