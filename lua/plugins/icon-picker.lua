return {
  "ziontee113/icon-picker.nvim",
  cmd = { "IconPickerNormal", "IconPickerYank", "IconPickerInsert" },
  opts = {
    disable_legacy_commands = true,
  },
  keys = {
    { "<Leader>si", "<cmd>IconPickerNormal<cr>", desc = "Icons (insert)" },
    { "<Leader>sI", "<cmd>IconPickerYank<cr>", desc = "Icons (yank)" },
    {
      "<C-i>",
      "<cmd>IconPickerInsert<cr>",
      mode = { "i" },
      desc = "Icons Picker",
    },
  },
}
