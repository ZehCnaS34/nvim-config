local API = {}

-- files
require'mini.pick'.setup()

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


-- buffer
require'mini.bracketed'.setup()

return API

