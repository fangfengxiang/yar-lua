local packager = require("yar.packager.packager")
local request = require("yar.message.request")
local protocol = require("yar.protocol.protocol")
local yarTransport = require("yar.transport.transport")
local yarResponse = require("yar.message.response")

local _M = {}

_M.options = {
    packager = "JSON",
    persistent = false,
    timeout = 3000,
    connect_timeout = 5000,
    header = {},
    proxy = "",
    provider = "",
    token = "",
}

function _M.new(hostname)
    local client = setmetatable({}, { __index = _M })
    client.hostname = hostname or "http://localhost"
    --self.options = {}
    --print(client.options.packager)
    return client
end


function _M:setopt(option, value)
    self.options[option] = value
end


function _M:call(method,params)

    local options = self.options
    -- 获取打包方式
    local packager = packager.getPackager(options.packager)
    -- 构造请求
    local request = request.new({
        method=method,
        params={params},
        options={
          provider = options.provider,
          token = options.token
        },
    })
    -- 构造报文
    local message = protocol.render(request,packager)
    --print(message)
    --print(self.hostname)
    -- 获取传输器
    local transport = yarTransport.getTransport(self.hostname)
    -- 打开传输
    transport:open(self.hostname,self.options)
    -- 发送数据 获取响应
    local respData = transport:send(message)
    transport:close()
    -- 响应解析
    local responseData = protocol.parse(respData,packager)
    local response = yarResponse.unpack(responseData)
    --print(response.id)

    -- 返回结果
    return response.retval
end


return _M