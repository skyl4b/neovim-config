return {
  "stevearc/conform.nvim",
  opts = {
    -- Linting triggers
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },

    -- Define formatters
    formatters_by_ft = {
      ["_"] = { "trim_whitespace" },
      nix = { "nixpkgs_fmt" },
      python = { "ruff_format", "ruff_fix" },
      -- Only run the first available formatter
      javascript = { { "prettierd", "prettier" } },
      lua = { "stylua" },
      typst = { "typstfmt" },
      sh = { "shfmt" },
    },

    -- Configure formatters
    formatters = {
      injected = { options = { ignore_errors = true } },

      ruff_format = {
        -- Set default line length
        "--line-length",
        "79",

        -- Keep base flags
        "format",
        "--stdin-filename",
        "$FILENAME",
        "-",
      },

      ruff_fix = {
        args = {
          -- Set default line length
          "--line-length",
          "79",

          -- Fix import order
          "--select",
          "I",

          -- Keep base flags
          "--fix",
          "-e",
          "-n",
          "--stdin-filename",
          "$FILENAME",
          "-",
        },
      },
    },
  },
}
