-- early configuration
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes:1'
vim.opt.tabstop = 4
vim.opt.termguicolors = true -- replaced by plugin
vim.opt.rnu = true
vim.opt.nu = true

require('vim._core.ui2').enable {
    enable = true
}

vim.cmd[[colorscheme zonokai]]

-- plugin installation

vim.pack.add {
    "https://github.com/brenoprata10/nvim-highlight-colors",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/neogitorg/neogit",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/sindrets/diffview.nvim",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/tpope/vim-sleuth",
    {src="https://github.com/oribarilan/lensline.nvim",version="release/2.x"} ,
    {src="https://github.com/nvim-treesitter/nvim-treesitter",version="main"} ,
}

require('blink-cmp').setup()

do
    local tree_sitter = require('nvim-treesitter')
    tree_sitter.setup {
        install_dir = vim.fn.stdpath('data') .. '/site'
    }
    tree_sitter.install {
        'rust', 'clojure', 'lua', 'javascript', 'typescript', 'zig', 'html'
    }
end

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

require('mini.statusline').setup()

require('mini.starter').setup()

require('mini.sessions').setup()

require('oil').setup()

require("nvim-tree").setup()

require('gitsigns').setup()

require('lensline').setup()

-- keymaps
vim.keymap.set({'n'}, '<D-p>', '<cmd>Pick files<cr>', {desc = "Pick files"})
vim.keymap.set({'n'}, '<D-F>', '<cmd>Pick grep_live<cr>', {desc = "Grep Live"})
vim.keymap.set({'n'}, '<D-b>', '<cmd>NvimTreeToggle<cr>', {desc = "NvimTreeToggle"})
vim.keymap.set({'n'}, '<leader>gs', '<cmd>Neogit<cr>', {desc = "Git status"})
vim.keymap.set({'n'}, '<leader>?', function() require('which-key').show({global = false}) end)
vim.keymap.set({'n'}, '-', '<cmd>Oil<cr>', {desc = "Grep Live"})
vim.keymap.set({'n'}, '<leader>wh', '<C-w>h')
vim.keymap.set({'n'}, '<leader>wj', '<C-w>j')
vim.keymap.set({'n'}, '<leader>wk', '<C-w>k')
vim.keymap.set({'n'}, '<leader>wl', '<C-w>l')
vim.keymap.set({'n'}, '<leader>ws', '<C-w>s')
vim.keymap.set({'n'}, '<leader>wv', '<C-w>v')
vim.keymap.set({'n'}, '<leader>wq', '<C-w>c')

-- lsp
vim.lsp.enable({
    'lua_ls',
    'rust_analyzer',
    'ts_ls',
    'html',
    'marksman',
    'nixd',
    'nil_ls',
})
