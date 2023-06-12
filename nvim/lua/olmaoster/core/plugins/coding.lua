return {
  --- HTML EMMET ---
  {
    "mattn/emmet-vim",
    event = { "BufRead" },
    init = function()
      vim.g.user_emmet_leader_key = "f"
      vim.g.user_emmet_mode = "n"
      vim.g.user_emmet_settings = {
        variables = { lang = "ja" },
        javascript = {
          extends = "jsx",
        },
        html = {
          default_attributes = {
            option = { value = vim.null },
            textarea = {
              id = vim.null,
              name = vim.null,
              cols = 10,
              rows = 10,
            },
          },
          snippets = {},
        },
      }
    end,
  },

  --- AUTO TAGS PAIRS ---
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  --- COMMENTS ---
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  --- AUTO TAGS BUT FOR TS (REACT/SVELTE)---
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "rust",
      "svelte",
      "tsx",
      "jsx",
      "xml",
    },
    opts = {
      enable = true,
      filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "xml",
        "rust",
      },
    },
  },

  --- SURROUND TAGS SHORTCUTS ---
	{
    'echasnovski/mini.surround', version = false, config = function ()
      require('mini.surround').setup()
    end
  },
  --
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = { "InsertEnter" },
  --   opts = {
  --     floating_window = false,               -- show hint in a floating window, set to false for virtual text only mode
  --     floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  --     bind = false,
  --     hint_scheme = "Comment",               -- highlight group for the virtual text
  --   },
  -- },
  --
  -- {
  --   "glepnir/lspsaga.nvim",
  --   event = "LspAttach",
  --   lazy = true,
  --   config = function()
  --     require("lspsaga").setup({})
  --   end,
  --   dependencies = {
  --     { "nvim-tree/nvim-web-devicons" },
  --     --Please make sure you install markdown and markdown_inline parser
  --     { "nvim-treesitter/nvim-treesitter" },
  --   },
  -- },
}
