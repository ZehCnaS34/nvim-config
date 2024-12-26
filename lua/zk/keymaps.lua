local scope = {}

local function description_to_command(desc)
    local words = vim.split(desc, " ")
    local descs = {}
    local chars = {}

    for i, word in ipairs(words) do
        chars[i] = string.sub(word, 1, 1)
        descs[i] = "[" .. string.upper(string.sub(word, 1, 1)) ..  "]" .. string.sub(word, 2, #word)
    end

    return {
        lhs = "<leader>" .. vim.iter(chars):join(""),
        desc = vim.iter(descs):join(" ")
    }
end

scope.keymaps = {
    --- @param desc string
    --- @param action string | function
    basic = function(desc, action)
        local opt = description_to_command(desc)
        vim.keymap.set('n', opt.lhs, action, { nowait = true, desc = opt.desc })
    end,
    --- @param lhs string
    --- @param rhs string | function
    --- @param desc string | nil
    insert = function(lhs, rhs, desc)
        vim.keymap.set('i', lhs, rhs, { nowait = true, desc = desc })
    end,
    normal = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { nowait = true, desc = desc })
    end,
    visual = function(lhs, rhs, desc)
        vim.keymap.set('v', lhs, rhs, { nowait = true, desc = desc })
    end
}

scope.setup = function()
    local km = scope.keymaps

    -- quick normal mode
    km.insert('kj', '<C-[>')
    km.insert('jk', '<C-[>')

    -- reload current lua file
    -- TODO: make this only work for lua files...
    km.basic(
        'config reload', -- not the best choice
        function()
            vim.cmd [[:source %]]
            vim.cmd [[:echom "[reloaded] ".expand("%")]]
        end
    )

    -- project navigation
    km.basic("git status", ":Neogit<cr>")

    km.normal('<leader><tab>', ':b#<cr>', 'last buffer')

    -- buffer management
    km.basic('buffer delete', ':bdel<cr>')

    -- conjure. this should be only applied in a particular mode
    -- km.normal('<leader>mee', ':ConjureEvalRootForm<cr>')

    km.normal('<leader>ws', ':split<cr>', 'window split')
    km.normal('<leader>wv', ':vsplit<cr>', 'window vsplit')
    km.normal('<leader>wh', '<C-w>h', 'window left')
    km.normal('<leader>wj', '<C-w>j', 'window down')
    km.normal('<leader>wk', '<C-w>k', 'window up')
    km.normal('<leader>wl', '<C-w>l', 'window right')
    km.normal('<leader>wc', '<C-w>c', 'window close')

    km.normal('<leader>fs', ':w<cr>', 'Save Window')
end

return scope
