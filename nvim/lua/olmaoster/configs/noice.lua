local options = {
    cmdline = {
    view = "cmdline",
    format = {
      cmdline = { icon = "  " },
      search_down = { icon = "  󰄼" },
      search_up = { icon = "  " },
      lua = { icon = "  " },
    },
  },
  lsp = {
    progress = { enabled = true },
    hover = { enabled = false },
    signature = { enabled = false },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  views = {
    mini = {
      win_options = {
        winblend = 0
      }
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        find = "%d+L, %d+B",
      },
    },
  },
}

require("noice").setup(options)