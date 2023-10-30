return {
  filters = {
    dotfiles = false,
    custom = { ".DS_Store", ".cache", "^.git$" },
  },
  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}
