-- Disable mason, install things with nix
return {
  {
    "williamboman/mason.nvim",
    enabled = false,
    opts = { ensure_installed = {} },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = false,
  },
}
