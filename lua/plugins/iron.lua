return {
  "Vigemus/iron.nvim",
  version = false, -- Use latest version
  main = "iron.core",
  cmd = {
    "IronRepl",
    "IronReplHere",
    "IronRestart",
    "IronSend",
    "IronFocus",
    "IronHide",
    "IronWatch",
    "IronAttach",
  },
  opts = {
    config = {
      -- Don't set '<plug>' mappings
      should_map_plug = false,
      -- Discard repls after use
      scratch_repl = true,
      -- Ignore blank lines when sending visual select lines
      ignore_blank_lines = true,

      -- Custom repl definitions
      repl_definition = {},
    },
  },
  keys = {
    -- Basic interaction with the repl
    {
      "<leader>rr",
      function()
        require("iron.core").run_motion("send_motion")
      end,
      mode = { "n" },
      desc = "Send motion to repl",
    },
    {
      "<leader>rr",
      function()
        require("iron.core").visual_send()
      end,
      mode = { "v" },
      desc = "Send selection to repl",
    },
    {
      "<leader>rf",
      function()
        require("iron.core").send_file()
      end,
      mode = { "n" },
      desc = "Send file to repl",
    },
    {
      "<leader>rrr",
      function()
        require("iron.core").send_line()
      end,
      mode = { "n" },
      desc = "Send line to repl",
    },
    {
      "<leader>ru",
      function()
        require("iron.core").send_until_cursor()
      end,
      mode = { "n" },
      desc = "Send until cursor to repl",
    },

    -- Marks
    {
      "<leader>rm",
      function()
        require("iron.core").send_mark()
      end,
      mode = { "n" },
      desc = "Send mark to repl",
    },
    {
      "<leader>rM",
      function()
        require("iron.core").run_motion("mark_motion")
      end,
      mode = { "n" },
      desc = "Send mark motion to repl",
    },
    {
      "<leader>rm",
      function()
        require("iron.core").mark_visual()
      end,
      mode = { "v" },
      desc = "Send mark to repl",
    },
    -- TODO: set marks mappings somewhere
    -- remove_mark = { { "n" }, marks.drop_last },
    -- clear_hl = { { "v" }, marks.clear_hl },

    -- Special characters to the repl
    {
      "<leader>r<cr>",
      function()
        require("iron.core").send(nil, string.char(13))
      end,
      mode = { "n" },
      desc = "Send enter to repl",
    },
    {
      "<leader>r<C-c>",
      function()
        require("iron.core").send(nil, string.char(03))
      end,
      mode = { "n" },
      desc = "Send sigterm to repl",
    },
    {
      "<leader>rq",
      function()
        require("iron.core").close_repl()
      end,
      mode = { "n" },
      desc = "Close repl",
    },
    {
      "<leader>rc",
      function()
        require("iron.core").send(nil, string.char(12))
      end,
      mode = { "n" },
      desc = "Clear repl",
    },
  },
}
