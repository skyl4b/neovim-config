return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      show_end_of_buffer = true,
    },
  },

  -- Set background for nvim-notify
  -- since it's transparent
  {
    "rcarriga/nvim-notify",
    optional = true,
    opts = { background_colour = "#000000" },
  },
}
