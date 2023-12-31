require('olmaoster.core')
require('olmaoster.lazy')
require("olmaoster.core.utils").load_mappings()

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.cmd("colorscheme habamax")
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi LineNr guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE')
