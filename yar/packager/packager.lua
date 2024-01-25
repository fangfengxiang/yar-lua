
local json = require("yar.packager.json")
--local msgpack = require("yar.packager.msgpack")


local _M  = {}
local function getPackager(name)
    name = name or ""
    name = string.upper(name) -- 转大写再判断
    local packager = json -- 默认json打包
    if name == json.getName() then
        packager = json
    --elseif name == msgpack.getName() then
        --packager = msgpack
    end

    return packager
end

_M.getPackager = getPackager
return _M