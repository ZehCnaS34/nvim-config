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
            local config = vim.lsp.config

            config('gopls', {})
            config('ts_ls', {})
            config('rust_analyzer', {
                settings = {
                    ['rust-analyzer'] = {},
                }
            })
            config('clojure_lsp', {})
            config('docker_compose_language_service', {})
            config('dockerls', {})
            config('htmx', {})
            config('html', {})
            config('marksman', {})
            config('clangd', {})
            config('luals', {})
            config('pyright', {})
            config('zls', {})

            config['pyright'] = {
                filetypes={'py'}
            }

            config['lua_ls'] = {}

            vim.lsp.enable('lua_ls')

            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "welp" })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.document_symbol, opts)
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
        opts = {},
    },
}
