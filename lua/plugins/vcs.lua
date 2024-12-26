return {
    {
        'lewis6991/gitsigns.nvim',
        opts = {}
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require'neogit'.setup({})
        end
    },
    -- {
    --     import = 'zk.plugins'
    -- }
}
