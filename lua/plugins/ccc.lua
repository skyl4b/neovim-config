return {
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "uga-rosa/ccc.nvim",
    -- Disabled for now, need to investigate
    -- how to disable the lsp-highlighter as it breaks
    -- some LSPs and you can't disable for specific LSPs
    enabled = false,
    event = "LazyFile",
    cmd = {
      "CccPick",
      "CccConvert",
      "CccHighlighterEnable",
      "CccHighlighterDisable",
      "CccHighlighterToggle",
    },
    keys = {
      {
        "<leader>uh",
        "<cmd>CccHighlighterToggle<cr>",
        desc = "Toggle colorizer",
      },
      { "<leader>zc", "<cmd>CccConvert<cr>", desc = "Convert color" },
      { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick Color" },
    },
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
    config = function(_, opts)
      require("ccc").setup(opts)
      if opts.highlighter and opts.highlighter.auto_enable then
        vim.cmd.CccHighlighterEnable()
      end
    end,
  },
}
