return {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    opts = {
        defaults = {
            border = false,
        }
    },
    config = function(_, opts)
        local km = require 'zk.keymaps'.keymaps
        local builtin = require 'telescope.builtin'
        local themes = require 'telescope.themes'

        km.normal('<leader><leader>', require('telescope.builtin').buffers, "choose buffer")
        km.basic('project files', function()
            builtin.find_files(themes.get_ivy(opts))
        end)
        km.basic('project buffers', require('telescope.builtin').buffers)
        km.basic('project grep', function()
            require('telescope.builtin').live_grep(themes.get_ivy(opts))
        end)
        km.basic('telescope builtin', require('telescope.builtin').builtin)

        km.normal('<leader>ec', function()
            opts = opts or {}
            opts.cwd = "~/.config/nvim"
            builtin.find_files(themes.get_ivy(opts))
        end)
        km.normal('<leader>ep', function()
            opts = opts or {}
            opts.cwd = "~/.local/share/nvim/lazy"
            builtin.find_files(themes.get_ivy(opts))
        end)
    end,
}
