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
	require('zk.plugins.lualine').spec,
	require('zk.plugins.telescope').spec,
	require('zk.plugins.vcs').spec,
	require('zk.plugins.lsp').spec,
	require('zk.plugins.startup').spec,
	require('zk.plugins.oil').spec,
	require('zk.plugins.tree-sitter').spec,
	require('zk.plugins.completion').spec,
	require('zk.plugins.conjure').spec,
    'miikanissi/modus-themes.nvim',
    { url = 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim' }
})

