return {
  --- FILE TREE ---
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require('olmaoster.config.editor.nvim-tree')
    end
  },

  --- FUZZY FINDER ---
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    opts = {
      defaults = {
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
      -- goto
      { "gd",         "<cmd>Telescope lsp_definitions<cr>",              desc = "Go to definition" },
      { "gr",         "<cmd>Telescope lsp_references<cr>",               desc = "Go to references" },
      { "gi",         "<cmd>Telescope lsp_implementations<cr>",          desc = "Go to implementations" },
      -- search
      -- { "sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      -- { "sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
      -- { "sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "sh",         "<cmd>Telescope help_tags<cr>",                    desc = "Find Help" },
      { "sr",         "<cmd>Telescope oldfiles<cr>",                     desc = "Open Recent File" },
      -- { "sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "sk",         "<cmd>Telescope keymaps<cr>",                      desc = "Keymaps" },
      { "sC",         "<cmd>Telescope commands<cr>",                     desc = "Commands" },
      -- Git
      { "<leader>gs", "<cmd>Telescope git_status<cr>",                   desc = "Open changed file" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>",                 desc = "Checkout branch" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>",                  desc = "Checkout commit" },
      -- Find
      -- { "<leader>f",  "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
      { "<leader>pf", require("olmaoster.util").telescope("find_files", nil, { hidden = true }), desc = "Find files" },
      -- { "<leader>F",  "<cmd>Telescope live_grep<cr>",                           desc = "Find Text" },
      { "<leader>ps", require("olmaoster.util").telescope("live_grep"),  desc = "Find Text" },
    },
    -- config = function() require("olmaoster.config.telescope") end,
  },

  --- GITS STATUS ICONS ---
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┋" },
        delete = { text = "契" },
        topdelhfe = { text = "契" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
      },
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
      delay = 200,
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
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "toml",
        "rust",
        "markdown_inline",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "scss",
      },
      highlight = { enable = true },
      indent = { enable = true, disable = { "yaml", "python", "html" } },
      context_commentstring = { enable = true },
      rainbow = {
        enable = false,
        query = "rainbow-parens",
        disable = { "jsx", "html" },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  --- DASHBOARD STARTUP ---
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    keys = { { "<leader>0", "<cmd>Dashboard<CR>", desc = "Dashboard" } },
    config = function()
      require("olmaoster.config.dashboard")
    end,
  }
}
