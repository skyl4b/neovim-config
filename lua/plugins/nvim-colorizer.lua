return {
  "NvChad/nvim-colorizer.lua",
  event = "LazyFile",
  cmd = {
    "ColorizerToggle",
    "ColorizerAttachToBuffer",
    "ColorizerDetachFromBuffer",
    "ColorizerReloadAllBuffers",
  },
  opts = { user_default_options = { names = false } },
}
