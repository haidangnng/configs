local status, treesitter_config = pcall(require, "nvim-treesitter.configs")

if not status then
	print("Something went wrong:", treesitter_config)
else
	treesitter_config.setup({
		ensure_installed = {
			"python",
			"lua",
			"query",
			"javascript",
			"html",
			"typescript",
			"tsx",
			"toml",
			"svelte",
			"css",
			"prisma",
			"yaml",
		},
		auto_install = true,
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = false },
	})
end
