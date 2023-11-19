return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "LazyFile",
    main = "rainbow-delimiters.setup",
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { rainbow_delimiters = true } },
  },
}
