return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "http", "json" },
    cmd = {
      "RestNvim",
      "RestNvimPreview",
      "RestNvimLast",
    },
    keys = {
      { "<Leader>rr", "<Plug>RestNvim", desc = "Run request" },
    },
    opts = {},
  },
}
