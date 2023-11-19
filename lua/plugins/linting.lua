return {
  "mfussenegger/nvim-lint",
  opts = {
    -- Linter triggers
    events = { "BufWritePost", "BufReadPost", "TextChanged" },

    -- Define linters
    linters_by_ft = {
      nix = { "nix", "statix" },
      lua = { "luacheck" },
      dockerfile = { "hadolint" },
      -- markdown = { "markdownlint" },
    },

    -- Configure linters
    linters = {},
  },
}
