local M = {}

local init = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
end

local opts = {}

M.spec = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = init,
	opts = opts
}

return M
