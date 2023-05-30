return {
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   cmd = "Neotree",
  --   keys = {
  --     {
  --       "<leader>e",
  --       function()
  --         require("neo-tree.command").execute({
  --           toggle = true,
  --           position = "right",
  --           dir = require("olmaoster.util").get_root(),
  --         })
  --       end,
  --       desc = "Explorer (root dir)",
  --       remap = true,
  --     },
  --     {
  --       "<leader>E",
  --       function()
  --         require("neo-tree.command").execute({
  --           toggle = true,
  --           dir = require("olmaoster.util").get_root(),
  --           position = "float",
  --         })
  --       end,
  --       desc = "Explorer Float (root dir)",
  --     },
  --   },
  --   init = function()
  --     vim.g.neo_tree_remove_legacy_commands = 1
  --     if vim.fn.argc() == 1 then
  --       local stat = vim.loop.fs_stat(vim.fn.argv(0))
  --       if stat and stat.type == "directory" then
  --         require("neo-tree")
  --       end
  --     end
  --   end,
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   },
  --   config = function()
  --     -- require("olmaoster.config.neo-tree")
  --   end,
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function () 
      require('olmaoster.config.nvim-tree')
    end
  },
  {
    "christoomey/vim-tmux-navigator",
  },
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
          "%.svg",
          "%.otf",
          "%.ttf",
          "%.webp",
          ".dart_tool/",
          ".github/",
          ".gradle/",
          ".idea/",
          ".settings/",
          ".vscode/",
          "__pycache__/",
          "build/",
          "gradle/",
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
      { "<leader>pf", require("olmaoster.util").telescope("find_files"), desc = "Find files" },
      -- { "<leader>F",  "<cmd>Telescope live_grep<cr>",                           desc = "Find Text" },
      { "<leader>ps", require("olmaoster.util").telescope("live_grep"),  desc = "Find Text" },
    },
    -- config = function() require("olmaoster.config.telescope") end,
  },

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

  -- references
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

  {
    "luukvbaal/statuscol.nvim",
    event = "BufReadPost",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = false,
        -- ft_ignore = { "neo-tree" },
        segments = {
          {
            -- line number
            text = { " ", builtin.lnumfunc },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          { text = { "%s" },      click = "v:lua.ScSa" }, -- Sign
          { text = { "%C", " " }, click = "v:lua.ScFa" }, -- Fold
        },
      })
      -- vim.api.nvim_create_autocmd({ "BufEnter" }, {
      --   callback = function()
      --     if vim.bo.filetype == "neo-tree" then
      --       vim.opt_local.statuscolumn = ""
      --     end
      --   end,
      -- })
    end,
  },
}
