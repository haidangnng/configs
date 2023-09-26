require("olmaoster.core.options")

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
