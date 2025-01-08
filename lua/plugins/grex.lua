-- My "custom plugin" to generate RegEx using a file
-- or selection with grex

-- Helper function for mappings
local map = vim.keymap.set

map("n", "<leader>$", ":%!grex -", {
  desc = "Generate RegEx using file",
  noremap = true,
})
map("v", "<leader>$", ":'<'>!grex -", {
  desc = "Generate RegEx using selection",
  noremap = true,
})

return {}
