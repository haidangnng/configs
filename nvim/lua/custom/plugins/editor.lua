local Icons = require("custom.icons")

return {
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = false },
  {
    "NvChad/nvterm",
    opts = {
      terminals = {
        type_opts = {
          float = {
            relative = "editor",
            row = 0.1,
            col = 0.1,
            width = 0.8,
            height = 0.8,
            border = "single",
          },
        }
      }
    },
    config = function(_, opts)
      require "base46.term"
      require("nvterm").setup(opts)
    end,
  },
  --- FILE TREE ---
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require('custom.configs.nvim-tree')
    end
  },

  --- FUZZY FINDER ---
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = {
      pickers = {
        find_files = {
          find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
        },
      },
      defaults = {
        mappings = {
          i = {
            ['<C-l>'] = 'select_vertical',
            ['<C-j>'] = 'select_horizontal',
          }
        },
        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local is_image = function(path)
              local image_extensions = {'png','jpg'}   -- Supported image formats
              local split_path = vim.split(path:lower(), '.', {plain=true})
              local extension = split_path[#split_path]
              return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _ )
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d..'\r\n')
                end
              end
              vim.fn.jobstart(
                {
                  'catimg', filepath  -- Terminal image viewer command
                },
                {on_stdout=send_output, stdout_buffered=true, pty=true})
            else
              require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
            end
          end
            },
        prompt_prefix = "   ",
        selection_caret = " ❯ ",
        sorting_strategy = "ascending",
        file_ignore_patterns = {
          ".git/",
          "target/",
          "docs/",
          "vendor/*",
          "%.lock",
          "__pycache__/*",
          "%.sqlite3",
          "%.ipynb",
          "node_modules/*",
          -- "%.jpg",
          -- "%.jpeg",
          -- "%.png",
          "%.webp",
          ".github/",
          ".idea/",
          ".settings/",
          ".vscode/",
          "__pycache__/",
          "node_modules/",
          "%.pdb",
          "%.dll",
          "%.class",
          "%.exe",
          "%.cache",
          "%.ico",
          "%.pdf",
          "%.dylib",
          "%.jar",
          "%.docx",
          "%.met",
          "smalljre_*/*",
          ".vale/",
          "%.burp",
          "%.mp4",
          "%.mkv",
          "%.rar",
          "%.zip",
          "%.7z",
          "%.tar",
          "%.bz2",
          "%.epub",
          "%.flac",
          "%.tar.gz",
        },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
    },
    keys = {
      { "<leader>pf", require("telescope.builtin").find_files, desc = "Find files" },
      { "<leader>ps", require("telescope.builtin").live_grep,  desc = "Find Text" },
    },
  },

  --- GITS STATUS ICONS ---
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = Icons.gitsigns.add },
        change = { text = Icons.gitsigns.change },
        delete = { text = Icons.gitsigns.delete },
        topdelhfe = { text = Icons.gitsigns.topdelhfe },
        changedelete = { text = Icons.gitsigns.changedelete },
        untracked = { text = Icons.gitsigns.untracked },
      },
      numhl = true,
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      preview_config = {
        border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" }, -- [ top top top - right - bottom bottom bottom - left ]
      },
    },
    keys = {
      { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>",                    desc = "Lazygit" },
      { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>",       desc = "Next Hunk" },
      { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",       desc = "Prev Hunk" },
      { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",      desc = "Blame" },
      { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",    desc = "Preview Hunk" },
      { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",      desc = "Reset Hunk" },
      { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",    desc = "Reset Buffer" },
      { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",      desc = "Stage Hunk" },
      { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",                   desc = "Diff" },
    },
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    -- opts = {
    -- },
    init = function()
      require("core.utils").load_mappings "comment"
    end,
    config = function(_, opts)
      require("Comment").setup(vim.tbl_deep_extend('force', opts, {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }))
    end,
  },
  --- UNDER CURSOR REFERENCES ---
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
        -- "neo-tree",
        -- "dashboard",
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

  --- SYNTAX HIGHLIGHT ---
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "svelte",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "toml",
        "markdown_inline",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "scss",
        "rust"
      },
      auto_install = true,
      highlight = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
    },
  },

  --- MAXIMIZE WINDOW PANE ---
  {
    'declancm/maximize.nvim',
    config = function() require('maximize').setup() end
  },
    --- TMUX WINDOW NAVIGATOR ---
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   lazy = false
  -- },
  {
   'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end,
    lazy = false
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
       "williamboman/mason-lspconfig.nvim",
    },
     config = function()
       require "plugins.configs.lspconfig"
       require "custom.configs.lspconfig"
     end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    config = function()
      require("custom.configs.null-ls")
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "svelte",
        "prettier",
        "lua_ls",
        "cssls",
        "html",
        "tsserver",
        "eslint",
        "stylua",
        "goimports",
        "gofumpt",
        "tailwindcss"
      },
      automatic_setup = true,
    },
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    dependencies = "neovim/nvim-lspconfig"
  },
  {
    "ray-x/lsp_signature.nvim",
    event = { "InsertEnter" },
    opts = {
      floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
      floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
      hint_scheme = "Comment", -- highlight group for the virtual text
    },
  },
  {
   'nvimdev/lspsaga.nvim',
    lazy = false,
    config = function()
      require('lspsaga').setup({})
      -- require('custom.configs.lspsaga')
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {"b0o/schemastore.nvim"},
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {
            max_lines = 1000,
            max_num_results = 20,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = "..",
          } -- put your options here
        end,
      },
    },
     opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "cmp_tabnine" },
      },
    },
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  {
    'echasnovski/mini.surround',
    lazy = false,
    version = false,
    config = function ()
      require('mini.surround').setup()
    end
  },
  -- { 
  --   'simrat39/rust-tools.nvim',
  --   config = function ()
  --     local rt = require("rust-tools")
  --
  --     rt.setup({
  --       server = {
  --         on_attach = function(_, bufnr)
  --           -- Hover actions
  --           vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
  --           -- Code action groups
  --           vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
  --         end,
  --       },
  --     })
  --   end
  -- }
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
