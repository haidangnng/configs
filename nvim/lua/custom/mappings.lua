local opts = { noremap = true, silent = true }
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<C-a>"] = "",
  }
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>pf"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>ps"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>pb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<C-j>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<C-l>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<C-tj>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<C-tl>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    -- new
    ["<leader>h"] = {
      "",
      "",
    },

    ["<leader>v"] = {
      "",
      "",
    },
  },
}

M.lspsaga = {
  n = {
   ["gf"] =  { "<cmd>Lspsaga finder<CR>", "Navigate window", opts},
   ["<leader>ca"] =  { "<cmd>Lspsaga code_action<CR>", "Navigate window", opts},
   ["gr"] =  { "<cmd>Lspsaga rename<CR>", "Navigate window", opts},
   ["gp"] =  { "<cmd>Lspsaga peek_definition<CR>", "Navigate window", opts},
   ["gd"] =  { "<cmd>Lspsaga goto_definition<CR>", "Navigate window", opts},
   ["gt"] =  { "<cmd>Lspsaga peek_type_definition<CR>", "Navigate window", opts},
   ["<leader>pd"] =  { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "Navigate window", opts},
   ["]d"] =  { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Navigate window", opts},
   ["[d"] =  { "<cmd>Lspsaga lsp_finder<CR>", "Navigate window", opts},
   ["[D"] =  {
      function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end, "Navigate window", opts},
   ["]D"] =  {
      function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end, "Navigate window", opts},
   ["K"] =  { "<cmd>Lspsaga hover_doc<CR>", "Navigate window", opts},
   },
}

-- Your custom mappings
M.general = {
  n = {
   ["<leader>s"] =  {[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replacing word",opts},
   -- [ "<C-h>"] =  { ":TmuxNavigateLeft<CR>", "Navigate window", opts},
   -- [ "<C-j>"] =  { ":TmuxNavigateDown<CR>", "Navigate window", opts},
   -- [ "<C-k>"] =  { ":TmuxNavigateUp<CR>", "Navigate window", opts},
   -- [ "<C-l>"] =  { ":TmuxNavigateRight<CR>", "Navigate window", opts},
   [ "<C-h>"] =  { "<CMD>NavigatorLeft<CR>", "Navigate window", opts},
   [ "<C-j>"] =  { "<CMD>NavigatorDown<CR>", "Navigate window", opts},
   [ "<C-k>"] =  { "<CMD>NavigatorUp<CR>", "Navigate window", opts},
   [ "<C-l>"] =  { "<CMD>NavigatorRight<CR>", "Navigate window", opts},
   ["<leader>sj"] = {":split<Return><C-w>w", "Split window", opts},
   ["<leader>sl"] = {":vsplit<Return><C-w>w", "Split window vertically", opts},
   ["<leader>sq"] = {":close<CR>", "Delete window", opts},

   ["<S-Tab>"] = {":BufferLineCyclePrev<CR>", "Cycle Next Tab", opts},
   ["<Tab>"] = {":BufferLineCycleNext<CR>", "Cycle Previous Tab", opts},

  -------------------- NvimTreeToggle --------------------
   ["<leader>e"] = {":NvimTreeToggle toggle<CR>", "Toggle tree view", opts},

   ["<S-Up>"] = {":resize +2<CR>", "Resize Up", opts},
   ["<S-Down>"] = {":resize -2<CR>", "Resize Up", opts},
   ["<S-Left>"] = {":vertical resize -2<CR>", "Resize Up", opts},
  },

  i = {
   -------------------- Press jk fast to enter --------------------
   ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
   ["jK"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
   ["Jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
   ["JK"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},

   ["<C-j>"] = { "<ESC>:m .+1<CR>==gi", "Move line block", opts },
   ["<C-k>"] = { "<ESC>:m .-2<CR>==gi", "Move line block", opts },
  },

  v = {
    ["<C-j>"] = { ":m .+1<CR>==", "Move line block", opts },
    ["<C-k>"] = { ":m .-2<CR>==", "Move line block", opts },
    [">"] = { ">gv", "Stay indent mode", opts },
    ["<"] = { "<gv", "Stay indent mode", opts },
    ["p"] = { "_dP", "paste without yanking", opts}
  },
  x = {
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>tb"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>gsb"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>gt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>glt"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}
return M
