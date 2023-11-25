return {
  "NeogitOrg/neogit",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = "LazyFile",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      -- TODO: Check if nvim-notify or noice.nvim is available
      disable_builtin_notifications = true,
      -- TODO: Check if telescope is available
      telescope_sorter = function()
        return require("telescope").extensions.fzf.native_fzf_sorter()
      end,
      integrations = { telescope = true },
    })
  end,
  keys = {
    { "<leader>gnt", "<cmd>Neogit<CR>", desc = "Open Neogit Tab Page" },
    {
      "<leader>gnc",
      "<cmd>Neogit commit<CR>",
      desc = "Open Neogit Commit Page",
    },
    { "<leader>gnd", ":Neogit cwd=", desc = "Open Neogit Override CWD" },
    { "<leader>gnk", ":Neogit kind=", desc = "Open Neogit Override Kind" },
  },
}
