-- Better movement by subwords
return {
  "chrisgrieser/nvim-spider",
  keys = {
    {
      "w",
      function()
        require("spider").motion("w")
      end,
      mode = { "n", "x", "o" },
      desc = "Next word",
    },
    {
      "e",
      function()
        require("spider").motion("e")
      end,
      mode = { "n", "x", "o" },
      desc = "Next end of word",
    },
    {
      "b",
      function()
        require("spider").motion("b")
      end,
      mode = { "n", "x", "o" },
      desc = "Previous word",
    },
    {
      "ge",
      function()
        require("spider").motion("ge")
      end,
      mode = { "n", "x", "o" },
      desc = "Previous end of word",
    },
  },
  opts = { skipInsignificantPunctuation = false },
}
