local cmp = require("cmp")

return {
  -- Enable borders
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = { completeopt = vim.o.completeopt },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    },
  },
  -- Edit some mappings
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-c>"] = cmp.mapping.abort(),
        ["<CR>"] = function(fallback)
          if cmp.visible() then
            LazyVim.create_undo()
            if cmp.confirm({ select = false }) then
              return
            end
          end
          return fallback()
        end,
      })
    end,
  },
}
