local API = {}
local uv = vim.uv

print("*loading scaffold*") -- TODO: create debug module

API.module_dir = vim.fn.expand("~/.config/nvim/lua/zehcnas34")

-- create a [module_name].lua file in ~/.config/nvim/lua/zehcnas34
API.create_module = function(module_name)
    local module_path = API.module_dir.."/"..module_name..".lua"
    print("creating: "..module_path)
    local file = assert(uv.fs_open(module_path, "w+", tonumber('644', 8)))
    uv.fs_write(file, "-- "..module_name.."\n\nlocal API = {}\n\n\nreturn API")
    uv.fs_close(file)
    return module_path
end

return API
