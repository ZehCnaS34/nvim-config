-- setup mini.deps
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
    vim.cmd[[echo "Installing `mini.nvim`" | redraw]]
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/nvim-mini/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd[[packadd mini.nvim | helptags ALL]]
    vim.cmd[[echo "Installed `mini.nvim`" | redraw]]
end

require('mini.deps').setup({ path = { package = path_package }})

-- setup global state and live reload
Z34 = {
    modules = {}
}

function Z34.module_path(module)
    assert(type(module) == "string", "module must be a string")
    assert(not module:match("%."), "module must not contain a period '.'")
    return "zehcnas34."..module
end

function Z34.reload()
    for _, module in ipairs(Z34.modules) do
        module_name = Z34.module_path(module)
        package.loaded[module_name]=nil
        Z34[module]=require(module_name)
    end
end

function Z34.setup(opts)
    -- options
    require('mini.basics').setup()
    require('mini.extra').setup()
    require('mini.indentscope').setup()
    require('mini.sessions').setup()

    vim.g.mapleader = ' '
    vim.o.shiftwidth = 4
    vim.o.tabstop = 4
    vim.o.expandtab = true


    -- start screen
    local starter = require('mini.starter')
    starter.setup({
        items = {
            starter.sections.builtin_actions(),
            starter.sections.recent_files(10, false),
            starter.sections.sessions(5, true),
        }
    })

    for _, module in ipairs(opts.modules) do
        module_name = "zehcnas34."..module
        Z34.modules[module]=require(module_name)
    end
end

