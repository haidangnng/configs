local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with({
     filetypes = { "html", "markdown", "css", "svelte", "typescript", "typescriptreact", "javascript", "javascriptreact"},
    }),
    null_ls.builtins.diagnostics.eslint.with({
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    }),
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.mypy.with({
        extra_args = function()
        local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/opt/homebrew/"
        return { "--python-executable", virtual .. "/bin/python3" }
        end,
    }),
    null_ls.builtins.formatting.black.with({
          args = {
            "--fast",
            "--quiet",
            "--stdin-filename",
            "$FILENAME",
            "-",
          },
        }),
    null_ls.builtins.formatting.rustywind,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.mlint,
    null_ls.builtins.formatting.smlfmt,
    null_ls.builtins.formatting.gdformat,
    -- null_ls.builtins.diagnostics.gdlint
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})
