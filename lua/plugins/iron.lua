-- Iron for interactive REPLs during programming
return {
  "Vigemus/iron.nvim",
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
  -- HACK: Init disables lazy loading, workaround?
  init = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        -- Discard REPL on close
        scratch_repl = true,
        -- Send selections to the DAP REPL if possible
        dap_integration = false,
        -- Default REPL view
        repl_open_cmd = view.split.vertical.rightbelow("%40"),
        -- Override / define REPLs
        repl_definition = {
          julia = {
            command = { "julia" },
            format = common.bracketed_paste,
            block_dividers = { "# %%", "#%%", "# ╔═╡" },
          },
        },
      },
    })
  end,
  opts = {},
  keys = {
    { "<leader>r", desc = "REPL" },
    {
      "<leader>rt",
      function()
        vim.cmd("IronRepl")
      end,
      mode = "n",
      desc = "Toggle",
    },
    {
      "<leader>rR",
      function()
        vim.cmd("IronRestart")
      end,
      mode = "n",
      desc = "Restart",
    },
    {
      "<leader>rq",
      function()
        require("iron.core").close_repl()
      end,
      mode = "n",
      desc = "Quit",
    },
    {
      "<leader>rr",
      function()
        require("iron.core").send_line()
      end,
      mode = "n",
      desc = "Send line",
    },
    {
      "<leader>ru",
      function()
        require("iron.core").send_until_cursor()
      end,
      mode = "n",
      desc = "Send until cursor",
    },
    {
      "<leader>rf",
      function()
        require("iron.core").send_file()
      end,
      mode = "n",
      desc = "Send file",
    },
    {
      "<leader>rp",
      function()
        require("iron.core").send_paragraph()
      end,
      mode = "n",
      desc = "Send paragraph",
    },
    {
      "<leader>rb",
      function()
        require("iron.core").send_code_block(false)
      end,
      mode = "n",
      desc = "Send code block",
    },
    {
      "<leader>rB",
      function()
        require("iron.core").send_code_block(true)
      end,
      mode = "n",
      desc = "Send code block + move",
    },
    {
      "<leader>rr",
      function()
        require("iron.core").visual_send()
      end,
      mode = "v",
      desc = "Send selection",
    },
    {
      "<leader>rm",
      function()
        require("iron.core").run_motion("send_motion")
      end,
      mode = "n",
      desc = "Send motion (operator)",
    },
    {
      "<leader>r'",
      function()
        require("iron.core").send_mark()
      end,
      mode = "n",
      desc = "Send last mark",
    },
    {
      "<leader>rM",
      function()
        require("iron.core").run_motion("mark_motion")
      end,
      mode = "n",
      desc = "Mark by motion (operator)",
    },
    {
      "<leader>rV",
      function()
        require("iron.core").mark_visual()
      end,
      mode = "v",
      desc = "Mark selection",
    },
    {
      "<leader>rd",
      function()
        require("iron.marks").drop_last()
      end,
      mode = "n",
      desc = "Mark: drop last",
    },
    {
      "<leader>rh",
      function()
        require("iron.marks").clear_hl()
      end,
      mode = "v",
      desc = "Marks: clear highlight",
    },
    {
      "<leader>r<CR>",
      function()
        require("iron.core").send(nil, string.char(13))
      end,
      mode = "n",
      desc = "Send <CR> to REPL",
    },
    {
      "<leader>r<C-C>",
      function()
        require("iron.core").send(nil, string.char(3))
      end,
      mode = "n",
      desc = "Send SIGINT",
    },
    {
      "<leader>r<C-L>",
      function()
        require("iron.core").send(nil, string.char(12))
      end,
      mode = "n",
      desc = "Clear",
    },
  },
}
