local msgpack = require("msgpack")

local _M = {}

-- packageName
_M._NAME = "MSGPACK"

local function getName()
    return _M._NAME
end

local function pack(payload)
    return msgpack.pack(payload)
end

-- @return data = {"i":"time","s":10000,"r":"hello","o":"print","e":"error"}
local function unpack(payloadData)
    return msgpack.unpack(payloadData)
end


-- packageFun
_M.pack = pack
_M.unpack = unpack
_M.getName = getName

return _M