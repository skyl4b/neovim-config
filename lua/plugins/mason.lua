-- Disable mason, install things manually
return {
  {
    "mason-org/mason.nvim",
    enabled = false,
    opts = { ensure_installed = {} },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = false,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = false,
  },
}
