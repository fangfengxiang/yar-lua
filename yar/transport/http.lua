local socket = require("socket")
local http = require("socket.http")
local ltn12 = require("ltn12")

local _M = {
    address = "http://127.0.0.1",
    options = {
        persistent = false,
        timeout = 3000,
        connect_timeout = 5000,
        header = {},
        proxy = "",
    },
}

local HTTPHeaders = {
    ["Connection"] = "Keep-Alive",
    ["Content-Type"] = "application/octet-stream",
    ["User-Agent"] = "Lua Yar RPC-1.0.0",
    ["Transport-Lib"] = http.USERAGENT,
}

function _M.new()
    local t  = {}
    setmetatable(t, {__index = _M})
    return t
end

function _M:open(address,options)
    self.address = address
    self.options.proxy = options.proxy
    --setmetatable(self.options,options)
    --print(options.proxy,self.options.proxy)
end

function _M:send(data)

    -- 创建一个持久化的 HTTP 连接

    -- 构造报文请求
    local response = {}
    local httpRequest = {
        url = self.address,
        method = "POST",
        headers = HTTPHeaders,
        source = ltn12.source.string(data),
        sink = ltn12.sink.table(response),
    }

    -- 设置参数
    if string.len(self.options.proxy) > 0 then
        http.PROXY = self.options.proxy
    end

    local ok, statusCode, responseHeader = http.request(httpRequest)
    if not ok or statusCode ~= 200 then
        error("http request err")
    end

    -- 响应正确返回
    return table.concat(response)
end

-- http自动关闭，所以空实现就好
function _M:close()
end

return _M
