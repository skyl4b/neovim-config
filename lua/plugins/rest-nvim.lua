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
    opts = {},
    keys = {
      { "<leader>rR", "<Plug>RestNvim", ft = "http", desc = "Run request" },
    },
  },
}
