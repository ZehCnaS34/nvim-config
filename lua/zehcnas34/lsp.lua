local API = {}


vim.lsp.config['lua_ls'] = {
    cmd = {'lua-language-server'},
    filetypes = {'lua'},
    root_markers = { {'.luarc.json', '.luarc.jsonc'}, '.git'},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            }
        }
    }
}
vim.lsp.enable('lua_ls')


vim.lsp.config['rust-analyzer'] = {
    cmd = {'rust-analyzer'},
    filetypes = {'rust'},
    root_markers = { 'Cargo.toml', '.git'},
}
vim.lsp.enable('rust-analyzer')


vim.lsp.config['zls'] = {
    cmd = {'zls'},
    filetypes = {'zig','zir'},
    root_markers = {'zls.json', 'build.zig', '.git'},
    workspace_required = false,
}
vim.lsp.enable('zls')


vim.keymap.set('n', '<leader>ca', function()
    vim.lsp.buf.code_action()
end)


return API
