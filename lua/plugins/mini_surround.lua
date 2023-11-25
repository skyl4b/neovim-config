return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      -- Add surrounding in Normal and Visual modes
      add = "Sa",
      -- Delete surrounding
      delete = "Sd",
      -- Find surrounding (to the right)
      find = "Sf",
      -- Find surrounding (to the left)
      find_left = "SF",
      -- Highlight surrounding
      highlight = "Sh",
      -- Replace surrounding
      replace = "Sr",
      -- Update 'n_lines'
      update_n_lines = "Sn",
    },

    -- Disable showing non-error feedback
    silent = true,
  }
}
