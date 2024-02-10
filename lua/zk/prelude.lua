vim.g.mapleader = ' '
vim.wo.colorcolumn = '80'
vim.o.rnu=true
vim.o.nu=true
vim.o.shiftwidth=4
vim.o.tabstop=4
vim.o.expandtab=true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
