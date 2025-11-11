vim.api.nvim_create_autocmd('User', {
    pattern = 'LazyDone',
    callback = function ()
        require'zk.keymaps'.setup()
        require'zk.styling'.setup()
    end
})

require'zk.prelude'


