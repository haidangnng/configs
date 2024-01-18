local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

local M = {}

M.zen = {
  n = {
    ["<leader>z"] = {":ZenMode<CR>", "toggle Zenmode", opts}
  }
}

M.ufo = {
  n = {
    ["zr"] = { "<Cmd>lua require('ufo').openAllFolds()<CR>", "Open All Folds", opts},
    ["zm"] = { "<Cmd>lua require('ufo').closeAllFolds()<CR>", "Close All Folds", opts},
  }
}

M.maximize = {
  n = {
    ["<leader>m"] = { "<Cmd>lua require('maximize').toggle()<CR>", "toggle maximize", opts}
  }
}

M.bbye = {
  n = {
    ["<leader>d"] = { "<cmd>Bdelete!<cr>", "Close buffer", opts},
    ["<leader>qa"] = { "<cmd>bufdo Bdelete!<cr>", "Close all buffer", opts}
  }
}

M.nvterm = {
  t = {
    ["<C-t>"] = { "<Cmd>:ToggleTerm direction=float<CR>", "Toggle floating term", opts },
  },
  n = {
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
    ["<leader>rf"] =  {[[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replacing word in file",opts},
    ["<leader>rl"] =  {[[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replacing word line",opts},
    [ "<ESC>"] =  { ":nohl <CR>", "Remove words highlight", opts},
    [ "<C-h>"] =  { "<CMD>NavigatorLeft<CR>", "Navigate window Left", opts},
    [ "<C-j>"] =  { "<CMD>NavigatorDown<CR>", "Navigate window Down", opts},
    [ "<C-k>"] =  { "<CMD>NavigatorUp<CR>", "Navigate window Up", opts},
    [ "<C-l>"] =  { "<CMD>NavigatorRight<CR>", "Navigate window Right", opts},
    ["<leader>sj"] = {":split<Return><C-w>w", "Split window down", opts},
    ["<leader>sl"] = {":vsplit<Return><C-w>w", "Split window right", opts},
    ["<leader>sq"] = {":close<CR>", "Delete window", opts},
    ["<C-d>"] = {"<C-d>zz", "Page down centered cursor", opts},
    ["<C-u>"] = {"<C-u>zz", "Page up centered cursor", opts},

    ["<leader>k"] = {"10<C-w>+", "Resize Up", opts},
    ["<leader>j"] = {"10<C-w>-", "Resize Down", opts},
    ["<leader>h"] = {"10<C-w>>", "Resize left", opts},
    ["<leader>l"] = {"10<C-w><", "Resize right", opts},
  },

  i = {
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
  },

  v = {
    ["<C-k>"] = { ":m .-2<CR>==", "Move line block", opts },
    ["<C-j>"] = { ":m .+1<CR>==", "Move line block", opts },
    [">"] = { ">gv", "Stay indent mode", opts },
    ["<"] = { "<gv", "Stay indent mode", opts },
    ["p"] = { '"_dP', "paste without yanking", opts},
    ["q"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },

  x = {
    ["p"] = { '"_dP', "paste without yanking", opts},
    ["J"] = { ":move '>+1<CR>gv-gv", "Move line block", opts },
    ["K"] = { ":move '<-2<CR>gv-gv", "Move line block", opts },
    ["<C-j>"] = { ":move '>+1<CR>gv-gv", "Move line block", opts },
    ["<C-k>"] = { ":move '<-2<CR>gv-gv", "Move line block", opts },
  },
}

M.oil = {
  n = {
    ['-'] = { "<CMD>Oil<CR>", "Open parent directory" },
  }
}

M.trouble = {
  n = {
    ['-'] = { "<CMD>Oil<CR>", "Open parent directory" },
    ["<leader>xx"]= {function() require('trouble').toggle() end, "Toggle trouble", opts},
    ["<leader>xw"]= {function() require('trouble').toggle('workspace_diagnostics') end, "Toggle Trouble workspace_diagnostics", opts},
    -- ["<leader>xd"]= {function() require('trouble').toggle('document_diagnostics') end, "Toggle trouble document_diagnostics", opts},
    -- ["<leader>xq"]= {function() require('trouble').toggle('quickfix') end, "Toggle Trouble quickfix", opts},
    -- ["<leader>xl"]= {function() require('trouble').toggle('loclist') end, "Toggle Trouble loclist", opts},
    ["gR"]= {function() require('trouble').toggle('lsp_references') end, "Toggle Trouble lsp_references"},
  }
}

return M

