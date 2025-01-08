-- Exit mode and clear the current line if
-- it is a blank line
local esc_and_clear = function()
  vim.api.nvim_input("<esc>")
  local current_line = vim.api.nvim_get_current_line()
  if current_line:match("^%s+j$") then
    vim.schedule(function()
      vim.api.nvim_set_current_line("")
    end)
  end
end

return {
  "max397574/better-escape.nvim",
  event = "InsertCharPre",
  opts = {
    default_mappings = false,
    mappings = {
      i = {
        j = {
          k = esc_and_clear,
        },
        k = {
          j = esc_and_clear,
        },
      },
      c = {
        j = {
          k = esc_and_clear,
        },
        k = {
          j = esc_and_clear,
        },
      },
      t = {
        j = {
          k = "<C-\\><C-n>",
        },
        k = {
          j = "<C-\\><C-n>",
        },
      },
      v = {
        j = {
          k = esc_and_clear,
        },
        k = {
          j = esc_and_clear,
        },
      },
      s = {
        j = {
          k = esc_and_clear,
        },
        k = {
          j = esc_and_clear,
        },
      },
    },
  },
}
