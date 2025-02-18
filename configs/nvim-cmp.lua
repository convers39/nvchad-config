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
    { name = "copilot", priority = 1000, max_item_count = 3 },
    { name = "codeium", priority = 900, max_item_count = 3 },
    { name = "minuet", priority = 900, max_item_count = 3 },
    { name = "nvim_lsp", priority = 800, max_item_count = 3 },
    { name = "luasnip", priority = 750, max_item_count = 3 },
    { name = "buffer", priority = 250, max_item_count = 3 },
    { name = "nvim_lua", priority = 250, max_item_count = 3 },
    { name = "path", priority = 250, max_item_count = 3 },
    { name = "crates", priority = 250, max_item_count = 3 },
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
    ["<CR>"] = cmp.mapping(function(fallback)
      -- use the internal non-blocking call to check if cmp is visible
      if cmp.visible() then
        cmp.confirm { select = true }
      else
        fallback()
      end
    end),
    ["<C-k>"] = cmp.mapping(function(fallback)
      if not cmp.visible() then
        cmp.complete { behavior = cmp.SelectBehavior.Select }
      end
      cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
    end, { "i" }),
    ["<C-q>"] = cmp.mapping.abort(),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if not cmp.visible() then
        cmp.complete { behavior = cmp.SelectBehavior.Select }
      end
      cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
    end, { "i" }),
    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.close()
      else
        cmp.complete()
      end
    end, { "i" }),
  },
}
