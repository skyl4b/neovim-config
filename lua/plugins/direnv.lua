return {
  "direnv/direnv.vim",
  event = "VeryLazy",
  cmd = { "DirenvExport", "EditDirenvrc", "EditEnvrc" },
  init = function()
    -- Export automatically
    vim.g.direnv_auto = 1

    -- Edit RC files mode
    vim.g.direnv_edit_mode = "edit"

    -- Don't load silently
    vim.g.direnv_silent_load = 0
  end,
}
