return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = "all",
    -- Disable comment treesitter parser, very slow
    disable = { "comment" },
  },
}
