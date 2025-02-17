require("minuet").setup {
  -- Your configuration options here
  provider = "gemini",
  debounce = 200,
  throttle = 1000,
  notify = "error",
  cmp = {
    enable_auto_complete = true, -- Enable nvim-cmp integration
  },
  add_single_line_entry = false,
  provider_options = {
    gemini = {
      model = "gemini-2.0-flash",
      -- system = "see [Prompt] section for the default value",
      -- few_shots = "see [Prompt] section for the default value",
      -- chat_input = "See [Prompt Section for default value]",
      stream = true,
      api_key = "GEMINI_API_KEY",
      -- Your provider-specific options here
      optional = {
        generationConfig = {
          maxOutputTokens = 1024,
        },
      },
    },
  },
}
