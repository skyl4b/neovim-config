-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Globals
--
local g = vim.g

-- Config leaders
g.mapleader = " "
g.maplocalleader = ","

-- Disable autoformat
g.autoformat = false

-- HACK: force wl-clipboard for now as OSC52 is not fully supported by wezterm
g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = function()
      return {}
    end,
    ["*"] = function()
      return {}
    end,
  },
  cache_enabled = 1,
}

-- LazyVim specific globals
--
g.lazyvim_python_lsp = "basedpyright"
g.lazyvim_python_ruff = "ruff"

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
--
local filetype = vim.filetype

filetype.add({
  filename = {
    ["docker-compose.yaml"] = "yaml.docker-compose",
  },
})

-- Functions
--
-- Enable lua compilation
vim.loader.enable()
