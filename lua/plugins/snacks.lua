-- Snacks is a collection of simple small plugins
return {
  "snacks.nvim",
  opts = {
    -- Use bordered floating windows
    win = {
      border = "rounded",
    },

    -- Speed up scroll animation
    scroll = {
      animate = {
        duration = { step = 75, total = 250 },
        easing = "linear",
      },
    },
  },
}
