-- live reload
Z34 = {
    modules = {}
}

function Z34.reload()
    for _, module in ipairs(Z34.modules) do
        module_name = "zehcnas34."..module
        package.loaded[module_name]=nil
        Z34[module]=require(module_name)
    end
end

function Z34.setup(opts)
    for _, module in ipairs(opts.modules) do
        module_name = "zehcnas34."..module
        package.loaded[module_name]=nil
        Z34.modules[module]=require(module_name)
    end
end


-- options
vim.g.mapleader = ' '
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

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

