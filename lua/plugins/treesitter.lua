return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- HACK: install all available parsers
    -- the all flag no longer exists in the main branch.
    -- Change to something like "community" in the future.
    ensure_installed = vim.tbl_keys(require("nvim-treesitter.parsers")),

    -- Make sure regex based highlighting is off
    additional_vim_regex_highlighting = false,
  },
}
