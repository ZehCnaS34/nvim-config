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


return API
