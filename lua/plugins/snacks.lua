-- Snacks is a collection of simple small plugins
return {
  "snacks.nvim",
  opts = {
    -- Use bordered floating windows
    win = { border = "rounded" },

    -- Disable scroll animation
    scroll = { enabled = false },
  },
  keys = {
    -- Toggle scratch buffer inside buffer submap
    {
      "<leader>bs",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },

    -- Floating terminal bindings
    { "<leader>t", "", desc = "terminal" },
    {
      "<leader>tt",
      function()
        Snacks.terminal(vim.o.shell)
      end,
      mode = { "n", "v" },
      desc = "Floating terminal",
    },
    {
      "<leader>th",
      function()
        Snacks.terminal(vim.o.shell, { win = { position = "right" } })
      end,
      mode = { "n", "v" },
      desc = "Horizontal terminal",
    },
    {
      "<leader>tv",
      function()
        Snacks.terminal(vim.o.shell, { win = { position = "bottom" } })
      end,
      mode = { "n", "v" },
      desc = "Vertical terminal",
    },

    -- Apps
    {
      "<leader>tn",
      function()
        Snacks.terminal("node")
      end,
      mode = { "n", "v" },
      desc = "Terminal run node",
    },
    {
      "<leader>tu",
      function()
        Snacks.terminal("gdu")
      end,
      mode = { "n", "v" },
      desc = "Terminal run gdu",
    },
    {
      "<leader>tb",
      function()
        Snacks.terminal("btm")
      end,
      mode = { "n", "v" },
      desc = "Terminal run bottom",
    },
    {
      "<leader>tg",
      function()
        Snacks.terminal("lazygit")
      end,
      mode = { "n", "v" },
      desc = "Terminal run lazygit",
    },
    {
      "<leader>tp",
      function()
        Snacks.terminal("python3")
      end,
      mode = { "n", "v" },
      desc = "Terminal run python",
    },
    {
      "<leader>tj",
      function()
        Snacks.terminal("julia")
      end,
      mode = { "n", "v" },
      desc = "Terminal run julia",
    },
    {
      "<leader>tJ",
      function()
        Snacks.terminal("jupyter-console --no-confirm-exit")
      end,
      mode = { "n", "v" },
      desc = "Terminal run jupyter",
    },
    {
      "<leader>tq",
      function()
        Snacks.terminal("qalc")
      end,
      mode = { "n", "v" },
      desc = "Terminal run qalc",
    },
    {
      "<leader>tD",
      function()
        Snacks.terminal("lazydocker")
      end,
      mode = { "n", "v" },
      desc = "Terminal run lazydocker",
    },
  },
}
