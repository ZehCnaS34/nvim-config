return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
            { "folke/neodev.nvim", opts = {} },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require'lspconfig'
            lspconfig.tsserver.setup{}
            -- lspconfig.lua.setup{}
            lspconfig.rust_analyzer.setup {
                settings = {
                    ['rust-analyzer'] = {},
                }
            }

            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "welp" })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local opts = { buffer = ev.buf }
                end,
            })
        end
    },
    {
        'williamboman/mason.nvim',
        config = {},
    }
}
