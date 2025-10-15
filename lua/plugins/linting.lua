return {
  "mfussenegger/nvim-lint",
  opts = {
    -- Linter triggers
    events = { "BufWritePost", "BufReadPost", "TextChanged" },

    -- Define linters
    linters_by_ft = {
      nix = { "nix", "statix" },
      lua = { "selene" },
      dockerfile = { "hadolint" },
      -- gitcommit = { "commitlint" },
    },

    -- Configure linters
    linters = {
      cmakelint = { cmd = "cmake-lint" },
      selene = {
        -- Only enable selene when
        -- selene.toml is present
        condition = function(ctx)
          return vim.fs.find(
            { "selene.toml" },
            { path = ctx.filename, upward = true }
          )[1]
        end,
      },
    },
  },
}
