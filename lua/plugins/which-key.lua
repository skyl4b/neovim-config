return {
  "folke/which-key.nvim",
  opts = {
    -- Set bordered window
    window = { border = "rounded" },

    -- Customize key mappings
    defaults = {
      ["<leader>a"] = { name = "+AI" },
      ["<leader>t"] = { name = "+terminal" },
      ["<leader>T"] = { name = "+test" },
    },
  },
}
