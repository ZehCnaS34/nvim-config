-- logger

local API = {}

API.LEVEL_ERROR   = bit.lshift(1, 0)
API.LEVEL_WARNING = bit.lshift(1, 1)
API.LEVEL_INFO    = bit.lshift(1, 2)
API.LEVEL_DEBUG   = bit.lshift(1, 3)
API.LEVEL_TRACE   = bit.lshift(1, 4)
API.LEVEL         = API.LEVEL_WARNING


function API.log(level, msg, table)
    if API.LEVEL >= level then
        print(msg)
    end
end


API.error = function(msg, table) API.log(API.LEVEL_ERROR, msg, table) end
API.warning = function(msg, table) API.log(API.LEVEL_WARNING, msg, table) end
API.info = function(msg, table) API.log(API.LEVEL_INFO, msg, table) end
API.debug = function(msg, table) API.log(API.LEVEL_DEBUG, msg, table) end
API.trace = function(msg, table) API.log(API.LEVEL_TRACE, msg, table) end

return API
