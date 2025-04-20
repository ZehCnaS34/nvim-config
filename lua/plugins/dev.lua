return {
    {
        dir = "~/Workspaces/plugins/factorio.nvim",
        config = function()
            require'factorio'.setup()
        end
    },
    {
        dir = "~/Workspaces/plugins/kit.nvim",
        config = function()
            require'zk.kit'.setup()
        end
    },
    {
        dir = "~/Workspaces/plugins/nd.nvim",
        config = function()
            require'nomad'.setup()
        end
    },
    {
        dir = "~/Workspaces/plugins/modal.nvim",
        main = 'com.zehcnas34.nvim.modal',
        config = function()
            require'com.zehcnas34.nvim.modal'.setup()
        end
    }
}
