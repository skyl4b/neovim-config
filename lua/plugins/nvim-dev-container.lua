return {
  "esensar/nvim-dev-container",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
  cmd = {
    "DevcontainerStart",
    "DevcontainerAttach",
    "DevcontainerExec",
    "DevcontainerStop",
    "DevcontainerStopAll",
    "DevcontainerRemoveAll",
    "DevcontainerLogs",
    "DevcontainerEditNearestConfig",
  },
  keys = {
    {
      "<leader>Cc",
      ":DevcontainerStart<CR>",
      desc = "Start devcontainer",
    },
    {
      "<leader>Ca",
      ":DevcontainerAttach<CR>",
      desc = "Attach to a devcontainer",
    },
    {
      "<leader>Ce",
      ":DevcontainerExec<CR>",
      desc = "Execute a command in a devcontainer",
    },
    {
      "<leader>Cs",
      ":DevcontainerStop<CR>",
      desc = "Stop a devcontainer",
    },
    {
      "<leader>CS",
      ":DevcontainerStopAll<CR>",
      desc = "Stop all devcontainers",
    },
    {
      "<leader>Cr",
      ":DevcontainerRemoveAll<CR>",
      desc = "Remove all devcontainers",
    },
    {
      "<leader>Cl",
      ":DevcontainerLogs<CR>",
      desc = "Devcontainer logs",
    },
    {
      "<leader>Ce",
      ":DevcontainerEditNearestConfig<CR>",
      desc = "Edit a devcontainer.json file",
    },
  },
}
