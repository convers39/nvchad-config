require("conform").setup {
  -- Map of filetype to formatters
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    go = { "goimports", "gofmt" },
    -- Use a sub-list to run only the first available formatter
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    json = { "biome" },
    solidity = { "prettierd" },
    -- You can use a function here to determine the formatters dynamically
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    -- Use the "*" filetype to run formatters on all filetypes.
    -- ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },
  -- If this is set, Conform will run the formatter on save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
  -- If this is set, Conform will run the formatter asynchronously after save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  -- format_after_save = {
  --   lsp_fallback = true,
  -- },
  -- Set the log level. Use `:ConformInfo` to see the location of the log file.
  log_level = vim.log.levels.ERROR,
  -- Conform will notify you when a formatter errors
  notify_on_error = true,
  -- Custom formatters and changes to built-in formatters
  -- formatters = {
  --   my_formatter = {
  --     -- This can be a string or a function that returns a string.
  --     -- When defining a new formatter, this is the only field that is *required*
  --     command = "my_cmd",
  --     -- A list of strings, or a function that returns a list of strings
  --     -- Return a single string instead of a list to run the command in a shell
  --     args = { "--stdin-from-filename", "$FILENAME" },
  --     -- If the formatter supports range formatting, create the range arguments here
  --     range_args = function(ctx)
  --       return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
  --     end,
  --     -- Send file contents to stdin, read new contents from stdout (default true)
  --     -- When false, will create a temp file (will appear in "$FILENAME" args). The temp
  --     -- file is assumed to be modified in-place by the format command.
  --     stdin = true,
  --     -- A function that calculates the directory to run the command in
  --     cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
  --     -- When cwd is not found, don't run the formatter (default false)
  --     require_cwd = true,
  --     -- When returns false, the formatter will not be used
  --     condition = function(ctx)
  --       return vim.fs.basename(ctx.filename) ~= "README.md"
  --     end,
  --     -- Exit codes that indicate success (default { 0 })
  --     exit_codes = { 0, 1 },
  --     -- Environment variables. This can also be a function that returns a table.
  --     env = {
  --       VAR = "value",
  --     },
  --     -- Set to false to disable merging the config with the base definition
  --     inherit = true,
  --     -- When inherit = true, add these additional arguments to the command.
  --     -- This can also be a function, like args
  --     prepend_args = { "--use-tabs" },
  --   },
  --   -- These can also be a function that returns the formatter
  --   -- other_formatter = function(bufnr)
  --   --   return {
  --   --     command = "my_cmd",
  --   --   }
  --   -- end,
  -- },
}
