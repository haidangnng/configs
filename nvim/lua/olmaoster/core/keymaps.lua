local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-------------------- Replacing word regex ------------------
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
keymap("n", "x", '"_x', opts)

-------------------- Make life easier ------------------
keymap("", "<Space>", "<Nop>", opts)
keymap("n", "<leader>pv", ":Ex<CR>", opts)
keymap("i", "<C-c>", "<ESC>:w<CR>", opts)

-------------------- Better window navigation ------------------
keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)

-------------------- Windows panel --------------------------
keymap("n", "<leader>sj", ":split<Return><C-w>w", opts)
keymap("n", "<leader>sl", ":vsplit<Return><C-w>w", opts)
keymap("n", "<leader>sq", ":close<CR>", opts)

-------------------- Navigate buffers --------------------------
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)

-------------------- Press jk fast to enter --------------------
keymap("i", "jk", "<ESC>", opts)
keymap("i", "Jk", "<ESC>", opts)
keymap("i", "jK", "<ESC>", opts)
-- keymap("i", "JK", "<ESC>", opts)

-------------------- NvimTreeToggle --------------------
keymap("", "<leader>e", "<Nop>", opts)
keymap("", "<leader>e", ":NvimTreeToggle toggle<CR>", opts)
-- keymap("", "<leader>E", ":NvimTreeToggle toggle<CR>", opts)

-------------------- Stay in indent mode ------------------------
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

-------------------- Resize windows ----------------------------
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-------------------- Move text up/ down ------------------------
-- Visual --
keymap("v", "<C-j>", ":m .+1<CR>==", opts)
keymap("v", "<C-k>", ":m .-2<CR>==", opts)
-- Block --
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)
-- Normal --
-- keymap("n", "<C-j>", ":m .+1<CR>==", opts)
-- keymap("n", "<C-k>", ":m .-2<CR>==", opts)
-- Insert --
-- keymap("i", "<C-j>", "<ESC>:m .+1<CR>==gi", opts)
-- keymap("i", "<C-k>", "<ESC>:m .-2<CR>==gi", opts)

-------------------- No highlight ------------------------------
keymap("n", "<leader>n", ":noh<CR>", opts)

-------------------- Go to buffer quickly ----------------------
keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

-------------------- Fuzzy Search --------------------------------
vim.keymap.set("n", "<C-f>", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes"))
end, { desc = "[/] Fuzzily search in current buffer]" })
