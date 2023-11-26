return {
  "folke/which-key.nvim",
  opts = {
    -- Set bordered window
    window = { border = "rounded" },

    -- Customize key mappings
    defaults = {
      ["s"] = { name = "+hop", mode = { "n", "v", "o" } },

      ["<leader>a"] = { name = "+AI" },
      ["<leader>t"] = { name = "+terminal" },
      ["<leader>T"] = { name = "+test" },
      ["<leader>r"] = { name = "+run" },
    },
  },
}
