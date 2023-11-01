return {
  'ThePrimeagen/vim-be-good',

	"nvim-lua/plenary.nvim",
  --- MINI SURROUND ---
  {
    'echasnovski/mini.surround',
    version = false,
    config = function ()
      require('mini.surround').setup()
    end
  },
  --- MAXIMIZE WINDOW PANE ---
  {
    'declancm/maximize.nvim',
    lazy = false,
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
      { "<leader>d",  "<cmd>Bdelete!<cr>",        desc = "Close Buffer" },
      { "<leader>qa", "<cmd>bufdo Bdelete!<cr>", desc = "Close All Buffer" },
    },
  },

  --- ICONS ---
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  --- OPTIMIZE STARTUP TIME - 
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },

  --- NOTES NEORG ---
  {
    "nvim-neorg/neorg",
    ft = 'norg', -- lazy load on filetype
    cmd = 'Neorg', -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
    --  (you could also just remove both lazy loading things)
    priority = 10, -- treesitter is on default priority of 50, neorg should load after it.
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('olmaoster.configs.neorg')
    end,
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
    lazy = false,
    config = function(_)
      require('nvim-ts-autotag').setup()
    end,
  },

  --- VIRTUAL ENV SWITCHER ---
  {
    'AckslD/swenv.nvim',
    config = function ()
      require("olmaoster.configs.swenv")
    end
  },
  --- LEET CODE ---
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-tree/nvim-web-devicons",

        -- recommended
        -- "rcarriga/nvim-notify",
    },
    opts = {
        -- configuration goes here
      lang = "javascript",
    },
}}
