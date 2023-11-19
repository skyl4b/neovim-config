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
