return {
  "max397574/better-escape.nvim",
  event = "InsertCharPre",
  opts = {
    mapping = { "jk", "kj" },
    clear_empty_lines = true,
    -- HACK: Cancel the snippet session when leaving insert mode
    keys = function()
      if vim.snippet.active() then
        vim.snippet.stop()
      end
      return "<ESC>"
    end,
  },
}
