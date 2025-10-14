local status, toggleterm = pcall(require, "toggleterm")

if not status then
	print("Something went wrong:", toggleterm)
else
	toggleterm.setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.3
			end
		end,
	})
end
