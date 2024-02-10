-- vim.defer_fn(function() 
--     require('nvim-treesitter.configs').setup {
--         ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },
--         highlight = {
--             enable = true,
--             additional_vim_regex_highlighting = false,
--         },
--         indent = {
--             enable = true,
--         },
--     }
-- end, 0)

return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
}

