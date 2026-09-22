local util = require("config.keymaps.util")
local map = util.map
local desc = util.desc

--------------------------------------------------------------------------------
-- BUFFER MANAGEMENT
--------------------------------------------------------------------------------
-- Cache bufdelete module
local bufdelete
local function get_bufdelete()
	if not bufdelete then
		bufdelete = require("snacks.bufdelete")
	end
	return bufdelete
end

-- Helper function to delete buffers
local function delete_buffers(filter_fn)
	local bd = get_bufdelete()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and filter_fn(buf) then
			bd.delete(buf)
		end
	end
end

map("n", "<leader>qc", function()
	local bufs = vim.fn.getbufinfo({ buflisted = 1 })
	if #bufs <= 1 then
		vim.cmd("Oil " .. vim.fn.getcwd())
	else
		Snacks.bufdelete()
	end
end, desc("Close current buffer"))

map("n", "<leader>qa", function()
	local current_buf = vim.api.nvim_get_current_buf()
	delete_buffers(function(buf)
		return buf ~= current_buf
	end)
end, desc("Close all buffers except current"))

map("n", "<leader>qq", function()
	delete_buffers(function()
		return true
	end)
	vim.cmd("Oil " .. vim.fn.getcwd())
end, desc("Close all buffers"))

--------------------------------------------------------------------------------
-- FILE EXPLORER (Oil)
--------------------------------------------------------------------------------
map("n", "-", "<CMD>Oil<CR>", desc("Open parent directory"))
