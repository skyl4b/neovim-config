return {
  "matze/vim-move",
  init = function()
    -- Prevent default mappings being bound
    vim.g.move_map_keys = 0
  end,
  keys = {
    { "J", "<Plug>MoveBlockDown", mode = { "v" }, desc = "Move block down" },
    { "K", "<Plug>MoveBlockUp", mode = { "v" }, desc = "Move block up" },
  },
}
