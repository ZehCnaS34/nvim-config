local API = {}

-- files
require'mini.pick'.setup()
require'mini.files'.setup()

local km = vim.keymap

local function nleadermap(suffix, rhs)
    km.set('n', '<leader>'..suffix, rhs)
end

km.set({'n'}, '<D-x>', FzfLua.commands)
km.set({'n'}, '<D-p>', FzfLua.files)
km.set({'n'}, '-', MiniFiles.open)
nleadermap('pf', FzfLua.files)
nleadermap('<leader>', MiniPick.builtin.buffers)
nleadermap('pb', MiniPick.builtin.buffers)
nleadermap('pg', MiniPick.builtin.grep_live)
nleadermap('bl', FzfLua.blines)
nleadermap('h', FzfLua.helptags)
nleadermap('e', MiniExtra.pickers.explorer)

-- windows
nleadermap('ws', '<Cmd>split<cr>')
nleadermap('wd', '<Cmd>close<cr>')
nleadermap('wv', '<Cmd>vsplit<cr>')
nleadermap('wo', '<c-w>o')
nleadermap('wh', '<c-w>h')
nleadermap('wj', '<c-w>j')
nleadermap('wk', '<c-w>k')
nleadermap('wl', '<c-w>l')
km.set('n', '<c-h>', '<c-w>h')
km.set('n', '<c-j>', '<c-w>j')
km.set('n', '<c-k>', '<c-w>k')
km.set('n', '<c-l>', '<c-w>l')

-- buffer
require'mini.bracketed'.setup()

-- git
nleadermap('gs', '<Cmd>term lazygit<cr>')

return API

