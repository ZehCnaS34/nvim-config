-- zehcnas34

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '

-- conjure overrides
vim.g['conjure#filetypes'] = {'clojure'}

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

-- plugin installation

do
    local function gh(x) return 'https://github.com/' .. x end

    vim.pack.add {
        gh("brenoprata10/nvim-highlight-colors"),
        gh("folke/which-key.nvim"),
        gh("ibhagwan/fzf-lua"),
        gh("lewis6991/gitsigns.nvim"),
        gh("neogitorg/neogit"),
        gh("neovim/nvim-lspconfig"),
        gh("nvim-lua/plenary.nvim"),
        gh("nvim-mini/mini.nvim"),
        gh("nvim-tree/nvim-tree.lua"),
        gh("nvim-tree/nvim-web-devicons"),
        gh("rafamadriz/friendly-snippets"),
        gh("saghen/blink.lib"),
        gh("saghen/blink.cmp"),
        gh("sindrets/diffview.nvim"),
        gh("stevearc/oil.nvim"),
        gh("tpope/vim-sleuth"),
        gh("Olical/conjure"),
        {src=gh("oribarilan/lensline.nvim"),version="release/2.x"},
        {src=gh("nvim-treesitter/nvim-treesitter"),version="main"},
    }
end

do
    local cmp = require('blink.cmp')
    cmp.build():pwait()
    cmp.setup()
end

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

require('mini.sessions').setup()

require('oil').setup()

require("nvim-tree").setup()

require('gitsigns').setup()

require('lensline').setup()

-- keymaps
vim.keymap.set({'n'}, ';f', '<cmd>FzfLua files<cr>', {desc = "Pick files"})
vim.keymap.set({'n'}, ';b', '<cmd>FzfLua buffers<cr>', {desc = "Pick buffers"})
vim.keymap.set({'n'}, ';;', '<cmd>FzfLua resume<cr>', {desc = "Pick resume"})
vim.keymap.set({'n'}, ';g', '<cmd>FzfLua grep<cr>', {desc = "Grep Live"})
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
    'clojure_lsp',
})

-- extensions

require('zehcnas34.pickers')


