-- Table to store open terminals
local user_terminals = {}

--- Toggle a user terminal if it exists, if not then create a new one and save it
---@param opts string|table
--- A terminal command string or a table of options
-- for Terminal:new() (Check toggleterm.nvim documentation for table format)
local function toggle_term_cmd(opts)
  local terms = user_terminals
  -- if a command string is provided, create a basic table for Terminal:new() options
  if type(opts) == "string" then
    opts = { cmd = opts, hidden = true }
  end
  local num = vim.v.count > 0 and vim.v.count or 1
  -- if terminal doesn't exist yet, create it
  if not terms[opts.cmd] then
    terms[opts.cmd] = {}
  end
  if not terms[opts.cmd][num] then
    if not opts.count then
      opts.count = vim.tbl_count(terms) * 100 + num
    end
    if not opts.on_exit then
      opts.on_exit = function()
        terms[opts.cmd][num] = nil
      end
    end
    terms[opts.cmd][num] = require("toggleterm.terminal").Terminal:new(opts)
  end
  -- toggle the terminal
  terms[opts.cmd][num]:toggle()
end

return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    highlights = {
      Normal = { link = "Normal" },
      NormalNC = { link = "NormalNC" },
      NormalFloat = { link = "NormalFloat" },
      FloatBorder = { link = "FloatBorder" },
      StatusLine = { link = "StatusLine" },
      StatusLineNC = { link = "StatusLineNC" },
      WinBar = { link = "WinBar" },
      WinBarNC = { link = "WinBarNC" },
    },
    size = 10,
    on_create = function()
      vim.opt.foldcolumn = "0"
      vim.opt.signcolumn = "no"
    end,
    open_mapping = [[<F7>]],
    shading_factor = 2,
    direction = "float",
    float_opts = { border = "rounded" },
  },
  keys = {
    { "<leader>t", desc = "terminal" },
    {
      "<leader>tt",
      "<cmd>ToggleTerm direction=float<cr>",
      mode = { "n", "v" },
      desc = "ToggleTerm float",
    },
    {
      "<leader>th",
      "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
      mode = { "n", "v" },
      desc = "ToggleTerm horizontal split",
    },
    {
      "<leader>tv",
      "<cmd>ToggleTerm size=80 direction=vertical<cr>",
      mode = { "n", "v" },
      desc = "ToggleTerm vertical split",
    },
    {
      "<F7>",
      "<cmd>ToggleTerm<cr>",
      mode = { "n", "i", "v", "t" },
      desc = "Toggle terminal",
    },
    {
      "<C-'>",
      "<cmd>ToggleTerm<cr>",
      mode = { "n", "i", "v", "t" },
      desc = "Toggle terminal",
    },

    -- Apps
    {
      "<leader>tn",
      function()
        toggle_term_cmd("node")
      end,
      mode = { "n", "v" },
      desc = "ToggleTerm node",
    },
    {
      "<leader>tu",
      function()
        toggle_term_cmd("gdu")
      end,
      mode = { "n", "v" },
      desc = "ToggleTerm gdu",
    },
    {
      "<leader>tb",
      function()
        toggle_term_cmd("btm")
      end,
      mode = { "n", "v" },
      desc = "ToggleTerm bottom",
    },
    {
      "<leader>tp",
      function()
        toggle_term_cmd("python3")
      end,
      mode = { "n", "v" },
      desc = "ToggleTerm python",
    },
    {
      "<leader>tj",
      function()
        toggle_term_cmd("jupyter-console --no-confirm-exit")
      end,
      mode = { "n", "v" },
      desc = "ToggleTerm Jupyter",
    },
    {
      "<leader>tq",
      function()
        toggle_term_cmd("qalc")
      end,
      mode = { "n", "v" },
      desc = "ToggleTerm qalc",
    },
    {
      "<leader>tD",
      function()
        toggle_term_cmd("lazydocker")
      end,
      mode = { "n", "v" },
      desc = "ToggleTerm lazydocker",
    },
  },
}
