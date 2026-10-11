-- nvim-treesitter (main branch): installs parsers, highlighting is built into nvim
local ts = require("nvim-treesitter")

ts.install({
	"python",
	"lua",
	"luadoc",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
	"bash",
	"javascript",
	"html",
	"typescript",
	"tsx",
	"json",
	"toml",
	"svelte",
	"css",
	"prisma",
	"yaml",
	"go",
	"vue",
	"ocaml",
	"cpp",
})

local available = {}
for _, lang in ipairs(ts.get_available()) do
	available[lang] = true
end

local function start(buf, lang)
	pcall(vim.treesitter.start, buf, lang)
end

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
	callback = function(event)
		local lang = vim.treesitter.language.get_lang(event.match)
		if not lang then
			return
		end

		if vim.treesitter.language.add(lang) then
			start(event.buf, lang)
		elseif available[lang] then
			-- auto install missing parsers, then attach
			ts.install({ lang }):await(function()
				if vim.api.nvim_buf_is_valid(event.buf) then
					start(event.buf, lang)
				end
			end)
		end
	end,
})
