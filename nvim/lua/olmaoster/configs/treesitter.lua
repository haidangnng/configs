local status, treesitter_config = pcall(require, 'nvim-treesitter.configs')

if not status then
  print('Something went wrong:', treesitter_config)
else
  treesitter_config.setup({
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "elixir",
      "heex",
      "javascript",
      "html",
      "typescript",
      "tsx"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
end