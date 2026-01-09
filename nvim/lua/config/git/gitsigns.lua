local status, gitsigns = pcall(require, 'gitsigns')

local opts = {
  signcolumn = true,   -- Show signs in the sign column
  numhl = true,        -- Highlight line numbers
  linehl = false,      -- Don't highlight the entire line
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',   -- 'eol' | 'overlay' | 'right_align'
    delay = 100,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  preview_config = {
    border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" }, -- [ top top top - right - bottom bottom bottom - left ]
  },
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,   -- Toggle with `:Gitsigns toggle_signs`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,    -- Use default
  max_file_length = 40000,   -- Disable if file is longer than this (in lines)
}

if not status then
  print('Something went wrong:', gitsigns)
else
  gitsigns.setup(opts)
  
  -- Set explicit highlight colors for git signs
  vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#a6e3a1', bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#f9e2af', bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#f38ba8', bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { fg = '#f38ba8', bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { fg = '#fab387', bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsUntracked', { fg = '#94e2d5', bold = true })
end
