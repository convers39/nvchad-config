local opts = {
  log_level = vim.log.levels.ERROR,
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  -- auto_session_use_git_branch = true,

  auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
  bypass_session_save_file_types = nil, -- table: Bypass auto save when only buffer open is one of these file types
  cwd_change_handling = { -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
    restore_upcoming_session = true, -- boolean: restore session for upcoming cwd on cwd change
    post_cwd_changed_hook = function()
      local nvim_tree = require "nvim-tree"
      nvim_tree.change_dir(vim.fn.getcwd())
      nvim_tree.refresh()
    end, -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
    pre_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChanged` autocmd
  },

  -- ⚠️ This will only work if Telescope.nvim is installed
  -- The following are already the default values, no need to provide them if these are already the settings you want.
  session_lens = {
    -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
    buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
    load_on_setup = true,
    theme_conf = { border = true },
    previewer = false,
  },
}
require("auto-session").setup(opts)
