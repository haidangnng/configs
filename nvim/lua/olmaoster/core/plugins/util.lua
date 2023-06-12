return {
  --- MULTI CURSOR SELECT ---
  {
    "mg979/vim-visual-multi",
    event = "BufAdd",
  },

  --- TMUX WINDOW NAVIGATOR ---
  {
    "christoomey/vim-tmux-navigator",
  },

  --- BUFFER CLOSE ---
  {
    "moll/vim-bbye",
    event = { "BufRead" },
    keys = {
      { "<leader>d",  "<cmd>Bdelete!<cr>",        desc = "Close Buffer" },
      { "<leader>qa", "<cmd>bufdo Bdelete!<cr>", desc = "Close All Buffer" },
    },
  },

  --- ICONS ---
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  --- OPTIMIZE STARTUP TIME - 
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },

  ---- ESSENTIALS PLUGIN ----
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
}
