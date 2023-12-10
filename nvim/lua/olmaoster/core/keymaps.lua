local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>z", ":ZenMode<Cr>", opts)

local M = {}

M.zen = {
  n = {
    ["<leader>z"] = {":ZenMode<CR>", "toggle Zenmode", opts}
  }
}

M.maximize = {
  n = {
    ["<leader>m"] = { "<Cmd>lua require('maximize').toggle()<CR>", "toggle maximize", opts}
  }
}

M.nvterm = {
  t = {
    -- toggle in terminal mode
    ["<C-t>"] = { "<Cmd>:ToggleTerm direction=float<CR>", "Toggle floating term", opts },
  },

  n = {
    -- toggle in normal mode
    ["<C-t>"] = { "<Cmd>:ToggleTerm direction=float<CR>", "Toggle floating term", opts },
  },
}

M.telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case <CR>", "Find current buffer" },
    ["<leader>pf"] = { "<cmd> Telescope find_files <CR>", "Find all" },
    ["<leader>ps"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>pb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
  },
}

M.lspsaga = {
  n = {
    ["gf"] =  { "<cmd>Lspsaga finder<CR>", "LSP Finder", opts},
    ["<leader>ca"] =  { "<cmd>Lspsaga code_action<CR>", "LSP code action", opts},
    ["gr"] =  { "<cmd>Lspsaga rename<CR>", "LSP rename", opts},
    ["gp"] =  { "<cmd>Lspsaga peek_definition<CR>", "LSP Peek definition", opts},
    ["gd"] =  { "<cmd>Lspsaga goto_definition<CR>", "LSP Go to definition", opts},
    ["gt"] =  { "<cmd>Lspsaga peek_type_definition<CR>", "LSP Peek type definition", opts},
    ["<leader>pd"] =  { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "LSP Show workspace diagnostics", opts},
    ["]d"] =  { "<cmd>Lspsaga diagnostic_jump_next<CR>", "LSP jump next diagnostics", opts},
    ["[d"] =  { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "LSP jump prev diagnostics", opts},
    ["[D"] =  {
      function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end, "go to prev error", opts},
    ["]D"] =  {
      function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end, "go to next error", opts},
    ["K"] =  { "<cmd>Lspsaga hover_doc<CR>", "Hover docs", opts},
   },
}

-- Your custom mappings
M.general = {
  n = {
    ["<leader>s"] =  {[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replacing word",opts},
    [ "<ESC>"] =  { ":nohl <CR>", "Navigate window", opts},
    [ "<C-h>"] =  { "<CMD>NavigatorLeft<CR>", "Navigate window", opts},
    [ "<C-j>"] =  { "<CMD>NavigatorDown<CR>", "Navigate window", opts},
    [ "<C-k>"] =  { "<CMD>NavigatorUp<CR>", "Navigate window", opts},
    [ "<C-l>"] =  { "<CMD>NavigatorRight<CR>", "Navigate window", opts},
    ["<leader>sj"] = {":split<Return><C-w>w", "Split window", opts},
    ["<leader>sl"] = {":vsplit<Return><C-w>w", "Split window vertically", opts},
    ["<leader>sq"] = {":close<CR>", "Delete window", opts},
    ["<C-d>"] = {"<C-d>zz", "Centered cursor", opts},
    ["<C-u>"] = {"<C-u>zz", "Centered cursor", opts},

    ["<leader>tt"] = {":tab new<CR>", "Create new tab", opts},
    ["<leader>tw"] = {":tabclose<CR>", "Close current tab", opts},
    ["<leader>ti"] = {":tabnext<CR>", "Next tab", opts},
    ["<leader>to"] = {":tabprev<CR>", "Previous tab", opts},

    -- ["<leader>k"] = {"<C-w>+", "Resize Up", opts},
    -- ["<leader>j"] = {"<C-w>-", "Resize Down", opts},
    -- ["<leader>h"] = {"<C-w><", "Resize left", opts},
    -- ["<leader>l"] = {"<C-w>>", "Resize right", opts},
  },

  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },

   -------------------- Press jk fast to enter --------------------
   ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
   ["jK"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
   ["Jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
   ["JK"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},

   -- ["<C-j>"] = { "<ESC>:m .+1<CR>==gi", "Move line block", opts },
    -- ["<C-k>"] = { "<ESC>:m .-2<CR>==gi", "Move line block", opts },
  },

  v = {
    ["<C-j>"] = { ":m .+1<CR>==", "Move line block", opts },
    ["<C-k>"] = { ":m .-2<CR>==", "Move line block", opts },
    [">"] = { ">gv", "Stay indent mode", opts },
    ["<"] = { "<gv", "Stay indent mode", opts },
    ["p"] = { '"_dP', "paste without yanking", opts},
    ["q"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },
  x = {
    ["J"] = { ":move '>+1<CR>gv-gv", "Move line block", opts },
    ["K"] = { ":move '<-2<CR>gv-gv", "Move line block", opts },
    ["<C-j>"] = { ":move '>+1<CR>gv-gv", "Move line block", opts },
    ["<C-k>"] = { ":move '<-2<CR>gv-gv", "Move line block", opts },
  },
}

M.oil = {
  n = {
    ['-'] = {
      -- "<CMD>Oil --float<CR>",
      "<CMD>Oil<CR>",
      "Open parent directory"
    }
  }
}

-- DAP MAPPINGS --
M.dap = {
  n = {
    ["<leader>tb"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    -- ["<leader>tsb"] = {
    --   function ()
    --     local widgets = require('dap.ui.widgets');
    --     local sidebar = widgets.sidebar(widgets.scopes);
    --     sidebar.open();
    --   end,
    --   "Open debugging sidebar"
    -- },
    ["<leader>td"] = {
      function ()
        local dapui = require('dapui');
        dapui.toggle()
      end,
      "Toggle dap ui"
    },
  }
}

M.dap_py = {
  n = {
    ['<leader>pt'] = {
      function()
        require('dap-python').test_method()
      end,
      "Debug python test"
    }
  }
}

M.dap_go = {
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

M.swenv = {
  n = {
    ["<leader>pe"] = {
      "<cmd>lua require('swenv.api').pick_venv()<CR>",
      "choose python env"
    }
  }
}

return M

