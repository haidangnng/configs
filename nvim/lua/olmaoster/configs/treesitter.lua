local status, treesitter_config = pcall(require, 'nvim-treesitter.configs')

if not status then
  print('Something went wrong:', treesitter_config)
else
  treesitter_config.setup({
    ensure_installed = {
      "c",
      "go",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "html",
      "typescript",
      "tsx",
      "python",
      "toml",
      "svelte",
      "css",
      "rust",
      "gdscript",
      "godot_resource",
      "gdshader",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = false },
  })
end
