local status_ok, conform = pcall(require, "conform")
if not status_ok then
	return
end

local options = {
	-- format_on_save = function(bufnr)
	-- 	-- Disable "format_on_save lsp_fallback" for languages that don't
	-- 	-- have a well standardized coding style. You can add additional
	-- 	-- languages here or re-enable it for the disabled ones.
	-- 	local disable_filetypes = { c = true, cpp = true }
	-- 	local lsp_format_opt
	-- 	if disable_filetypes[vim.bo[bufnr].filetype] then
	-- 		lsp_format_opt = "never"
	-- 	else
	-- 		lsp_format_opt = "fallback"
	-- 	end
	-- 	return {
	-- 		timeout_ms = 1500,
	-- 		lsp_format = lsp_format_opt,
	-- 	}
	-- end,
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		-- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		-- rust = { "rustfmt", lsp_format = "fallback" },
		lua = { "stylua" },
		python = { "ruff", "pylsp" },
		cpp = { "clang-format" },
		-- latex = { "latexindent" },
		-- svelte = { "prettierd", "prettier" },
		go = { "gofmt" },
		json = { "jq" },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		gdscript = { "gdformat" },
		ocaml = { "ocamlformat" },
	},
	formatters = {
		ocamlformat = {
			prepend_args = {
				"--if-then-else",
				"vertical",
				"--break-cases",
				"fit-or-vertical",
				"--type-decl",
				"sparse",
			},
		},
	},
}

conform.setup(options)
