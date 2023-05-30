return {
  -- add gruvbox
  { "morhetz/gruvbox", name = "gruvbox" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  }
}
