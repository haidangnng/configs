local status, gitsigns = pcall(require, 'gitsigns')

local opts = {
    numhl = true,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 100,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    preview_config = {
      border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" }, -- [ top top top - right - bottom bottom bottom - left ]
    },
    signs = {
      add          = { text = '┃' },
      change       = { text = '┋' },
      delete       = { text = '' },
      topdelete    = { text = '' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    watch_gitdir = {
      follow_files = true
    },
    attach_to_untracked = true,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
}

if not status then
  print('Something went wrong:', gitsigns)
else
  gitsigns.setup(opts)
end
