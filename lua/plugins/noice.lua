return {
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = "rounded",
    },
    routes = {
      {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = {
          skip = true,
        },
      },
    },
  },
}
