local os = require("os")

local yar_request = {
    id = 0,
    method = "",
    params = {},
    options = {
        provider = "",
        token = ""
    },
}

local _M  = yar_request

local function genRequestId()
    math.randomseed(os.time()) -- 设置随机种子为当前时间戳263569782
    local requestId = math.random(1000000000, 4294967295) --   4294967295 = 2^32-1 = 4个字节
    return requestId
end

_M.new = function(t)
    t = t or {}
    setmetatable(t, {__index = _M})
    --- 初始化请求id
    t:setId(genRequestId())
    return t
end

function _M:setId(id)
    self.id = id
end

function _M:getId()
    return self.id
end

function _M:pack()
    local packager = self.options["packager"]
    return {i=self.id,m=self.method,p=self.params}
end

return _M