vim.cmd[[colorscheme zonokai]]

vim.g.mapleader = ' '
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.pack.add {
    "https://github.com/brenoprata10/nvim-highlight-colors",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/tpope/vim-sleuth",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/neogitorg/neogit",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/sindrets/diffview.nvim",
}


require('blink-cmp').setup()

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'vimdoc', 'rust', 'python', 'javascript', 'haskell', 'zig' },
    version = 'main',
    highlight = { enable = true },
}

require('fzf-lua').setup()

require('mini.pick').setup()

require('mini.hipatterns').setup({
    highlighters = {
        fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
        hack  = { pattern = 'HACK',  group = 'MiniHipatternsHack'  },
        todo  = { pattern = 'TODO',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = 'NOTE',  group = 'MiniHipatternsNote'  },
    }
})

require('mini.cmdline').setup()

require('mini.pairs').setup()

-- keymaps

vim.keymap.set({'n'}, '<D-p>', '<cmd>Pick files<cr>', {desc = "Pick files"})
vim.keymap.set({'n'}, '<D-F>', '<cmd>Pick grep_live<cr>', {desc = "Grep Live"})
vim.keymap.set({'n'}, '<leader>gs', '<cmd>Neogit<cr>', {desc = "Git status"})
vim.keymap.set({'n'}, '<leader>?', function() require('which-key').show({global = false}) end)
