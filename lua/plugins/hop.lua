return {
  -- Disable builtin flash plugin
  {
    "folke/flash.nvim",
    keys = {
      -- disable the default flash keymap
      { "s", mode = { "n", "x", "o" }, false },
      {
        "ss",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },

  -- Add hop over it
  {
    "smoka7/hop.nvim",
    opts = {},
    keys = {
      {
        "sw",
        function()
          require("hop").hint_words({ extend_visual = true })
        end,
        mode = { "n", "v", "o" },
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
        mode = { "n", "v", "o" },
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
        mode = { "n", "v", "o" },
        desc = "Hop lines up",
      },
      {
        "sf",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({
            direction = directions.AFTER_CURSOR,
            extend_visual = true,
          })
        end,
        mode = { "n", "v", "o" },
        desc = "Hop forward to",
      },
      {
        "sF",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({
            direction = directions.BEFORE_CURSOR,
            extend_visual = true,
          })
        end,
        mode = { "n", "v", "o" },
        desc = "Hop backward to",
      },
      {
        "st",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({
            direction = directions.AFTER_CURSOR,
            extend_visual = true,
            hint_offset = -1,
          })
        end,
        mode = { "n", "v", "o" },
        desc = "Hop forward before",
      },
      {
        "sT",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({
            direction = directions.BEFORE_CURSOR,
            extend_visual = true,
            hint_offset = -1,
          })
        end,
        mode = { "n", "v", "o" },
        desc = "Hop backward before",
      },
    },
  },

  -- Add group in which-key
  {
    "folke/which-key.nvim",
    opts = {
      triggers = {
        -- TODO: verify conflicts on extensions
        -- if something similar is done for another
        -- plugin
        { "<auto>", mode = "nixsotc" },
        { "s", mode = { "n", "x", "o" } },
      },
      spec = {
        {
          mode = { "n", "x", "o" },
          { "s", "", group = "hop" },
        },
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
