local scope = {}

scope.setup = function ()
    vim.o.bg = [[dark]]
    vim.cmd [[colors tokyonight]]
    -- vim.cmd [[colors solarized]]
    -- vim.cmd [[colors modus]]
    vim.o.scl = "yes:1"
end

return scope
