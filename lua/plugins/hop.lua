return {
  -- Disable builtin flash plugin
  { "folke/flash.nvim", enabled = false },

  -- Add hop over it
  {
    "smoka7/hop.nvim",
    opts = {},
    keys = {
      { "s", false, mode = { "n", "v" }, desc = "+motion" },
      {
        "sw",
        function()
          require("hop").hint_words({})
        end,
        mode = { "n" },
        desc = "Hop words",
      },
      {
        "sj",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_lines_skip_whitespace({
            direction = directions.AFTER_CURSOR,
          })
        end,
        mode = { "n" },
        desc = "Hop lines down",
      },
      {
        "sk",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_lines_skip_whitespace({
            direction = directions.BEFORE_CURSOR,
          })
        end,
        mode = { "n" },
        desc = "Hop lines up",
      },
      {
        "sf",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({ direction = directions.AFTER_CURSOR })
        end,
        mode = { "n" },
        desc = "Hop forward to",
      },
      {
        "sF",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({ direction = directions.BEFORE_CURSOR })
        end,
        mode = { "n" },
        desc = "Hop backward to",
      },
      {
        "sw",
        function()
          require("hop").hint_words({ extend_visual = true })
        end,
        mode = { "v" },
        desc = "Hop words",
      },
      {
        "sj",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_lines_skip_whitespace({
            direction = directions.AFTER_CURSOR,
            extend_visual = true,
          })
        end,
        mode = { "n" },
        desc = "Hop lines down",
      },
      {
        "sk",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_lines_skip_whitespace({
            direction = directions.BEFORE_CURSOR,
            extend_visual = true,
          })
        end,
        mode = { "n" },
        desc = "Hop lines up",
      },
    },
  },

  -- Enable catppuccin integration
  {
    "catppuccin/nvim",
    name = "catppuccin",
    optional = true,
    opts = { integrations = { hop = true } },
  },
}
