return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        config = function()
            require("neo-tree").setup({})
        end,
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    }
}
