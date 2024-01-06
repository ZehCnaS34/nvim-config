require("lazy").setup({
	require('zk.plugins.which-key').spec,
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	require('zk.plugins.lualine'),
	require('zk.plugins.telescope').spec,
})
