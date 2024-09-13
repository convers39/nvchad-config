local opts = {
  ui = {
    winblend = 10,
    border = "rounded",
    colors = {
      normal_bg = "#002b36",
    },
  },
  finder = {
    keys = {
      edit = { "o", "<CR>" },
      vsplit = "v",
      split = "s",
      tabe = "t",
      quit = { "q", "<ESC>" },
    },
  },
  breadcrumbs = {
    enable = true,
  },
  definition = {
    edit = "o",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
    close = "<Esc>",
  },
  code_action = {
    num_shortcut = true,
    keys = {
      quit = "q",
      exec = "<CR>",
    },
  },
  lightbulb = {
    enable = false,
    enable_in_insert = false,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  diagnostic = {
    twice_into = false,
    show_code_action = true,
    show_source = true,
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g",
    },
  },
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
    whole_project = true,
    auto_save = true,
  },
  outline = {
    win_position = "right",
    win_with = "",
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = "o",
      expand_collapse = "u",
      quit = "q",
    },
  },
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = "e",
      vsplit = "s",
      split = "i",
      tabe = "t",
      jump = "o",
      quit = "q",
      expand_collapse = "u",
    },
  },
  symbol_in_winbar = {
    enable = false,
    separator = " ",
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = false,
  },
}

require("lspsaga").setup(opts)
