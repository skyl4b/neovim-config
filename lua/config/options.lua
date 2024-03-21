-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Globals
--
-- Config leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Disable autoformat
vim.g.autoformat = false

-- General options
--
local opt = vim.opt

-- Disable auto write
opt.autowrite = false
-- Don't sync with system clipboard
opt.clipboard = ""
-- Set spell languages
opt.spelllang = { "en" }
-- Enable line wrap
opt.wrap = true
opt.linebreak = true
opt.breakindent = true -- Match  line starts
-- Set fillchars
opt.fillchars = {
  -- Foldings
  foldopen = "",
  foldclose = "",
  fold = "⸱",
  foldsep = " ",
  -- Others
  diff = "╱",
  eob = "·",
}
opt.showbreak = "↪ "
-- Setup completions
opt.completeopt = "menu,menuone,noselect,preview,noinsert"
opt.confirm = false -- Confirm to save changes before exiting modified buffer
-- Use regex global flag by defaults
opt.gdefault = true
-- Set maximum columns to search for highlighting (default is slow)
opt.synmaxcol = 150
-- Set a short timeout for key sequences
opt.timeoutlen = 100
-- Setup no concealing
opt.conceallevel = 0

-- Custom filetypes
vim.filetype.add {
  filename = {
    ["docker-compose.yaml"] = "yaml.docker-compose",
  },
}

-- Functions
--
-- Enable lua compilation
vim.loader.enable()
