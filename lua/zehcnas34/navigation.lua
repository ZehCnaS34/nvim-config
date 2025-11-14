local API = {}

-- files
require'mini.pick'.setup()
require'mini.files'.setup()

local km = vim.keymap

km.set({'n'}, '<leader>pf', function()
    MiniPick.builtin.files()
end)

km.set({'n'}, '<leader><leader>', function()
    MiniPick.builtin.buffers()
end)

km.set({'n'}, '<leader>pb', function()
    MiniPick.builtin.buffers()
end)

km.set({'n'}, '<leader>pg', function()
    MiniPick.builtin.grep_live()
end)

km.set({'n'}, '<leader>ph', function()
    MiniPick.builtin.help()
end)

km.set({'n'}, '<leader>pe', function()
    MiniExtra.pickers.explorer()
end)

km.set({'n'}, '-', function()
    MiniFiles.open()
end)

-- windows
km.set('n', '<leader>ws', ':split<cr>')
km.set('n', '<leader>wd', ':close<cr>')
km.set('n', '<leader>wv', ':vsplit<cr>')
km.set('n', '<c-h>', '<c-w>h')
km.set('n', '<c-j>', '<c-w>j')
km.set('n', '<c-k>', '<c-w>k')
km.set('n', '<c-l>', '<c-w>l')

-- buffer
require'mini.bracketed'.setup()
require'mini.statusline'.setup()

return API

