local M = {}

M.attach = function(client, buffer)
  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_buf_set_keymap
  map(buffer, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map(buffer, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  map(buffer, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  map(buffer, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

return M
