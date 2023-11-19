return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Oil",
  opts = {},
  keys = {
    {
      "<leader>o",
      function()
        require("oil").open()
      end,
      desc = "Open folder in Oil",
    },
  },
}
