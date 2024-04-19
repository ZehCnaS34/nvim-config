return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
            { "folke/neodev.nvim",  opts = {} },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require 'lspconfig'
            lspconfig.tsserver.setup {}
            -- lspconfig.lua.setup{}
            lspconfig.rust_analyzer.setup {
                settings = {
                    ['rust-analyzer'] = {},
                }
            }
            lspconfig.clojure_lsp.setup {}
            lspconfig.docker_compose_language_service.setup {}
            lspconfig.dockerls.setup {}
            lspconfig.htmx.setup {}
            lspconfig.html.setup {}
            lspconfig.marksman.setup {}
            lspconfig.clangd.setup {}
            lspconfig.lua_ls.setup {}

            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "welp" })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<space>ff', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })
        end
    },
    {
        'williamboman/mason.nvim',
        config = {},
    },
}
