require("olmaoster.core.options")
require("olmaoster.core.utils").load_mappings()
require('olmaoster.lazy')

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.cmd[[colorscheme onedark]]
-- vim.cmd("colorscheme habamax")
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi LineNr guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE')


-- split highlight
vim.cmd('highlight VertSplit guibg=NONE guifg=#5f875f gui=bold')

-- git signs
vim.cmd('highlight GitSignsChange guibg=NONE guifg=#5f875f gui=bold')

local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-------------------------------------- commands ------------------------------------------
-- local new_cmd = vim.api.nvim_create_user_command

-- redraw statusline on LspProgressUpdate event & fixes #145
autocmd("User", {
  pattern = "LspProgressUpdate",
  callback = function()
    vim.cmd "redrawstatus"
  end,
})
