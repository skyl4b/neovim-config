return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = "all",
    -- Disable some parsers (slow ones)
    ignore_install = { "comment" },
    disable = { "comment" },

    -- Make sure regex based highlighting is off
    additional_vim_regex_highlighting = false,
  },
}
