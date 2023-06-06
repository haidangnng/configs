local function augroup(name)
  return vim.api.nvim_create_augroup("olmaoster_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual" })
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = "?*",
  group = augroup("remember_folds"),
  callback = function()
    vim.cmd([[silent! mkview 1]])
  end,
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "?*",
  group = augroup("remember_folds"),
  callback = function()
    vim.cmd([[silent! loadview 1]])
  end,
})

-- fix comment
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = augroup("comment_newline"),
  pattern = { "*" },
  callback = function()
    vim.cmd([[set formatoptions-=cro]])
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, "/")
      local project_name = project_dir[#project_dir]
      return project_name
    end

    vim.opt.titlestring = get_project_dir()
  end,
})

-- fix comment on new line
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd([[set formatoptions-=cro]])
  end,
})
