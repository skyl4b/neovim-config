return {
  "telescope.nvim",
  dependencies = {
    "benfowler/telescope-luasnip.nvim",
    config = function()
      require("telescope").load_extension("luasnip")
    end,
  },
  keys = {
    {
      "<leader>sp",
      ":Telescope luasnip<CR>",
      mode = { "n", "v" },
      desc = "Snippets",
    },
  },
}
