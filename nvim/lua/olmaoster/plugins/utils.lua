-- local leet_arg = "leetcode.nvim"

return {
	"nvim-lua/plenary.nvim",
  ---- CO PILOT ----
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
    config = function()
      require("copilot").setup({})
    end,
  },

  --- TREE SITTER ---
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      require("olmaoster.configs.treesitter")
    end
  },

  --- SURROUND ---
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  --- MAXIMIZE WINDOW PANE ---
  {
    'declancm/maximize.nvim',
    config = function() require('maximize').setup() end
  },

  --- ZEN MODE ---
  {
    "folke/zen-mode.nvim",
  },

  --- NAVIGATOR ---
  {
      'numToStr/Navigator.nvim',
      config = function()
          require('Navigator').setup()
      end
  },

  --- BUFFER CLOSE ---
  {
    "moll/vim-bbye",
    event = { "BufRead" },
    keys = {
    },
  },

  --- ICONS ---
  {
    "nvim-tree/nvim-web-devicons",
  },

  --- ILLUMINATE ---
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "neo-tree",
        "alpha",
        "NvimTree",
        "dashboard",
        "TelescopePrompt",
        "TelescopeResult",
        "DressingInput",
        "neo-tree-popup",
        "",
      },
      delay = 100,
     modes_denylist = {'i', 'v'},
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },

  --- AUTOPAIRS BRACKETS ---
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "xml" },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  --- LEET CODE ---
  -- {
  --   "kawre/leetcode.nvim",
  --   event = "VeryLazy",
  --   lazy = leet_arg ~= vim.fn.argv()[1],
  --   build = ":TSUpdate html",
  --   dependencies = {
  --       "nvim-treesitter/nvim-treesitter",
  --       "nvim-telescope/telescope.nvim",
  --       "nvim-lua/plenary.nvim", -- required by telescope
  --       "MunifTanjim/nui.nvim",
  --   },
  --   opts = {
  --       -- configuration goes here
  --     arg = leet_arg,
  --     lang = "typescript",
  --     directory = vim.fn.stdpath("data") .. "/leetcode/"
  --   },
  -- },

  --- COMMENTS ---
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function(_, opts)
      require("Comment").setup(vim.tbl_deep_extend('force', opts, {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }))
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
}
