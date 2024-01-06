local M = {}

local init = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
end

M.spec = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = init,
	opts = {
	}
}

return M
