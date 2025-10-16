-- Configure linters for diagnostics
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
        -- Only enable selene when selene.toml is present
        ---@diagnostic disable-next-line: unused-local
        condition = function(ctx)
          local root = LazyVim.root.get({ normalize = true })
          -- HACK: Selene searches the current path for the file
          -- breaking the configuration on another path.
          if root ~= vim.uv.cwd() then
            return false
          end
          return vim.fs.find({ "selene.toml" }, { path = root, upward = true })[1]
        end,
      },
    },
  },
}
