local add = MiniDeps.add

-- web dev icons
--
add {
  source = 'nvim-tree/nvim-web-devicons'
}

require('nvim-web-devicons').setup()

-- tree sitter
--
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

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'vimdoc' },
    highlight = { enable = true },
}

