-- Use otter to run LSPs of embedded languages
return {
  "jmbuhr/otter.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    lsp = {
      diagnostic_update_events = {
        "BufWritePost",
        "InsertLeave",
        "TextChanged",
      },
    },
  },
}
