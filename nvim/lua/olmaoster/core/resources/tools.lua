return {
  {
    "mg979/vim-visual-multi",
    event = "BufAdd",
  },

  {
    "moll/vim-bbye",
    event = { "BufRead" },
    keys = {
      { "<leader>d",  "<cmd>Bdelete!<cr>",        desc = "Close Buffer" },
      { "<leader>qa", "<cmd>bufdo Bdelete!<cr>", desc = "Close All Buffer" },
    },
  },
}
