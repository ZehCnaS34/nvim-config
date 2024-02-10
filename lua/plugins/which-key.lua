local init = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
end

local opts = {}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = init,
	opts = opts
}

