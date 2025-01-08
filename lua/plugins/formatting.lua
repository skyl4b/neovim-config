return {
  "stevearc/conform.nvim",
  opts = {
    -- Linting triggers
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },

    -- Define formatters
    formatters_by_ft = {
      -- Trim whitespace on all files without a specific formatter
      ["_"] = { "trim_whitespace" },
      -- Format tree-sitter injected languages
      ["*"] = { "injected" },

      -- Language specific formatters
      nix = { "nixpkgs_fmt" },
      -- Only run the first available formatter
      javascript = { { "prettierd", "prettier" } },
      lua = { "stylua" },
      typst = { "typstfmt" },
      sh = { "shfmt" },
      rust = { "rustfmt" },
      just = { "just" },
    },

    -- Configure formatters
    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
}
