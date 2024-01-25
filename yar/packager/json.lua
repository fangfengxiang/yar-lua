local cjson = require("cjson")

local _M = {}

-- packageName
_M._NAME = "JSON" -- 4A 53 4F 4E

local function getName()
    return _M._NAME
end

local function pack(payload)
    return cjson.encode(payload) -- ,{integer_as_number=true}
end

-- @return data = {"i":"time","s":10000,"r":"hello","o":"print","e":"error"}
local function unpack(payloadData)
    return cjson.decode(payloadData)
end


-- packageFun
_M.pack = pack
_M.unpack = unpack
_M.getName = getName

return _M