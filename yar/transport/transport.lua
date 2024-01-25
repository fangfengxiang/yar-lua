-- transport.lua

local http = require("yar.transport.http")

local _M = {}
local function getTransport(url)
    -- 根据 URL 或其他条件生成相应的传输器
    local transport = http -- 默认http传输
    if string.match(url, "^http") then
        transport = http
    elseif string.match(url, "^tcp") then
        ---
    end

    return transport
end

_M.getTransport = getTransport

return _M




