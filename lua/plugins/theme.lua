return {
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.o.bg = [[dark]]
            vim.cmd [[colors tokyonight]]
            -- vim.cmd [[colors solarized]]
            -- vim.cmd [[colors modus]]
            vim.o.scl = "yes:1"
        end
    },
    { "altercation/vim-colors-solarized" },
    { 'miikanissi/modus-themes.nvim', },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
}
