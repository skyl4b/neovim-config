-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set a custom filetype for AI chat logs
-- vim.filetype.add({
--   pattern = {
--     [".+/chats/.+%.md"] = "chat",
--   },
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.cmd("set ft=chat")
--     vim.cmd("set syntax=markdown")
--     vim.cmd("LspStop")
--   end,
-- })
vim.filetype.add({
  extension = {
    sdf = "xml",
    urdf = "xml",
    world = "xml",
  },
  filename = {
    ["justfile"] = "just",
  },
  pattern = {},
})
