return {
  {
    "sindrets/diffview.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    cmd = { "DiffviewOpen" },
  },
  {
    "NeogitOrg/neogit",
    optional = true,
    opts = { integrations = { diffview = true } },
  },
}
