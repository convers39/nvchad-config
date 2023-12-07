-- telescope
local telescope = require "telescope"
local actions = require "telescope.actions"
local lga_actions = require "telescope-live-grep-args.actions"
local fb_actions = telescope.extensions.file_browser.actions

local config = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = " 🔭 ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", "^.git/.*$" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    -- border = {},
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = {
        ["q"] = actions.close,
      },
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = { find_files = { hidden = true }, colorscheme = { enable_preview = true } },

  extensions = {
    "vim_bookmarks",
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-'>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
    file_browser = {
      hidden = true,
      -- hijack_netrw = true,
      grouped = true,
      select_buffer = true,
      sorting_strategy = "ascending",
      initial_mode = "normal",
      default_selection_index = 2,
      mappings = {
        ["i"] = {
          ["<C-h>"] = fb_actions.goto_parent_dir,
          ["<C-l>"] = actions.select_default,
          ["<C-H>"] = fb_actions.toggle_hidden,
        },
        ["n"] = {
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = actions.select_default,
          ["o"] = actions.select_default,
          ["H"] = fb_actions.toggle_hidden,
          ["a"] = fb_actions.create,
          ["~"] = fb_actions.goto_home_dir,
          -- your custom normal mode mappings
        },
      },
    },
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ["_"] = false, -- This key will be the default
        json = true, -- You can set the option for specific filetypes
        yaml = true,
      },
    },
  },
}

dofile(vim.g.base46_cache .. "telescope")
telescope.setup(config)

local extensions_list = {
  "file_browser",
  "live_grep_args",
  "vim_bookmarks",
  "neoclip",
  "ui-select",
  "themes",
  "terms",
  "session-lens",
}

for _, ext in ipairs(extensions_list) do
  telescope.load_extension(ext)
end
