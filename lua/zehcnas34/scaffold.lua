local API = {}
local uv = vim.uv
local api = vim.api
local logger = require'zehcnas34.logger'

API.module_dir = vim.fn.expand("~/.config/nvim/lua/zehcnas34")

-- create a [module_name].lua file in ~/.config/nvim/lua/zehcnas34
API.create_module = function(module_name)
    local module_path = API.module_dir.."/"..module_name..".lua"
    logger.info("creating", {module_path=module_path})
    local file = assert(uv.fs_open(module_path, "w+", tonumber('644', 8)))
    uv.fs_write(file, "-- "..module_name.."\n\nlocal API = {}\n\n\nreturn API")
    uv.fs_close(file)
    return module_path
end

api.nvim_create_user_command(
    'ZScaffold',
    function(module_name)
        API.create_module(module_name.args)
    end,
    {
        desc = 'Create a [module_name].lua file in the $CONFIG/lua/zehcnas34 directory.',
        nargs = 1
    }
)

return API
