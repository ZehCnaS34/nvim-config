local scope = {}

scope.setup = function (config)
    vim.o.bg = [[dark]]
    -- vim.cmd [[colors tokyonight-night]]
    vim.cmd[[colors modus_vivendi]]
    -- require 'lualine'.setup {}
end

return scope
