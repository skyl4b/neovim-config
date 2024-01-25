return {
  "jamestthompson3/nvim-remote-containers",
  config = function() end,
  cmd = {
    "AttachToContainer",
    "BuildImage",
    "StartImage",
    "ComposeUp",
    "ComposeDown",
    "ComposeDestroy",
  },
  keys = {
    { "<Leader>C", desc = "+containers" },
    {
      "<Leader>Ca",
      "<cmd>AttachToContainer<cr>",
      desc = "Attach to container",
    },
    { "<Leader>Cb", "<cmd>BuildImage<cr>", desc = "Build image" },
    { "<Leader>Cs", "<cmd>StartImage<cr>", desc = "Start image" },
    { "<Leader>Cu", "<cmd>ComposeUp<cr>", desc = "Compose up" },
    { "<Leader>Cd", "<cmd>ComposeDown<cr>", desc = "Compose down" },
    { "<Leader>CD", "<cmd>ComposeDestroy<cr>", desc = "Compose destroy" },
  },
}
