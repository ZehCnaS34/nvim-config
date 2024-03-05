local km = {}

km.insert = function(lhs, rhs, desc)
    vim.keymap.set('i', lhs, rhs, { nowait = true, desc = desc })
end

km.normal = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { nowait = true, desc = desc })
end

km.visual = function(lhs, rhs, desc)
    vim.keymap.set('v', lhs, rhs, { nowait = true, desc = desc })
end

-- quick normal mode
km.insert('kj', '<C-[>')
km.insert('jk', '<C-[>')

-- reload current lua file
-- TODO: make this only work for lua files...
km.normal(
    '<leader>cr', -- not the best choice
    function()
        vim.cmd [[:source %]]
        vim.cmd [[:echom "[reloaded] ".expand("%")]]
    end
)

-- project navigation
km.normal('<leader><leader>', require('telescope.builtin').buffers)
km.normal('<leader>pf', require('telescope.builtin').find_files)
km.normal('<leader>pb', require('telescope.builtin').buffers, "[P]roject [B]uffers")
km.normal('<leader>pt', require('telescope.builtin').builtin)
km.normal('<leader>/', require('telescope.builtin').live_grep)

km.normal('<leader>gs', ':Neogit<cr>')

km.normal('<leader><tab>', ':b#<cr>')

-- buffer management
km.normal('<leader>bd', ':bdel<cr>')

-- conjure. this should be only applied in a particular mode
km.normal('<leader>mee', ':ConjureEvalRootForm<cr>')
