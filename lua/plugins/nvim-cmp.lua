local cmp = require("cmp")

return {
  "hrsh7th/nvim-cmp",
  opts = {
    completion = { completeopt = vim.o.completeopt },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  },
}
