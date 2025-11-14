-- organic neovim config
require'zehcnas34.prelude'
local add = MiniDeps.add


require'mini.pick'.setup({})
vim.cmd[[noremap <silent> <leader>pf :lua MiniPick.builtin.files()<cr>]]


add {
  source = 'nvim-tree/nvim-web-devicons'
}

require('nvim-web-devicons').setup()

add {
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = {
        post_checkout = function()
            vim.cmd[[TSUpdate]]
        end
    }
}

require('nvim-treesitter.configs').setup{
    ensure_installed = { 'lua', 'vimdoc' },
    highlight = { enable = true },
}

