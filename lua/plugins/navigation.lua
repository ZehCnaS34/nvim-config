return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
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

        km.normal('<leader><leader>', function()
            builtin.buffers(themes.get_ivy(opts))
        end, "choose buffer")
        km.basic('project files', function()
            builtin.find_files(themes.get_ivy(opts))
        end)
        km.basic('project buffers', function()
            builtin.buffers(themes.get_ivy(opts))
        end)
        km.basic('project grep', function()
            builtin.live_grep(themes.get_ivy(opts))
        end)
        km.basic('telescope builtin', function ()
            builtin.builtin(themes.get_ivy(opts))
        end)

        km.basic('edit dev plugin config', function()
            opts = opts or {}
            opts.cwd = "~/.config/nvim/lua/plugins/dev"
            builtin.find_files(themes.get_ivy(opts))
        end)
        km.basic('edit config', function()
            opts = opts or {}
            opts.cwd = "~/.config/nvim"
            opts = themes.get_ivy(opts)
            opts.prompt_title = 'Config Files'
            builtin.find_files(opts)
        end)
        km.basic('edit plugin', function()
            opts = opts or {}
            opts.cwd = "~/.local/share/nvim/lazy"
            opts = themes.get_ivy(opts)
            opts.prompt_title = 'Plugin Files'
            builtin.find_files(opts)
        end)
    end,
}
}
