-- My "custom plugin" to generate RegEx using a file
-- or selection with grex

-- Helper function for mappings
local map = vim.keymap.set

map("n", "<leader>$", ":%!grex -", {
  desc = "Regex from file",
  noremap = true,
})
map("v", "<leader>$", ":'<'>!grex -", {
  desc = "Regex from selection",
  noremap = true,
})

return {}
