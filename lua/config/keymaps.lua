-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Helper function for mappings
local map = vim.keymap.set

-- System clipboard
map({ "n", "v" }, "<leader>y", '"+y', {
  desc = "Yank to system clipboard",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>p", '"+p', {
  desc = "Paste (after) from system clipboard",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>P", '"+P', {
  desc = "Paste (before) from system clipboard",
  noremap = true,
  silent = true,
})
-- Undo / Redo
map({ "n", "v" }, "u", ":undo<CR>", {
  desc = "Undo",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "U", ":redo<CR>", {
  desc = "Redo",
  noremap = true,
  silent = true,
})

-- Terminal bindings
--
-- Ignore Shift + Space, I press it accidentally all the time
map("t", "<S-Space>", "<Space>", {
  desc = "Space",
  noremap = true,
  silent = true,
})
-- Escape to normal mode
map("t", "jk", [[<C-\><C-n>]], {
  desc = "Normal mode",
  noremap = true,
  silent = true,
})
map("t", "kj", [[<C-\><C-n>]], {
  desc = "Normal mode",
  noremap = true,
  silent = true,
})
