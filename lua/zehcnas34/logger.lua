-- logger

local API = {}

API.LEVEL_ERROR   = bit.lshift(1, 0)
API.LEVEL_WARN = bit.lshift(1, 1)
API.LEVEL_INFO    = bit.lshift(1, 2)
API.LEVEL_DEBUG   = bit.lshift(1, 3)
API.LEVEL_TRACE   = bit.lshift(1, 4)
API.LEVEL         = API.LEVEL_WARNING

function API.debug(msg, tabl)
    if API.LEVEL >= API.LEVEL_DEBUG then
        print(msg)
    end
end

return API
