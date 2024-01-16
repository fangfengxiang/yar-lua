local http = require("http")

local http_transport = {}
local http_proxy = {
    host = "",
    port = "",
    username = "",
    password = ""
}
function http_transport:New(t)
    t = t or {}
    setmetatable(t, self)
    self.__index = self
    return t
end

function http_transport:send(msg)
    http.request(url, {
        method = "POST",  -- 请求方法：GET、POST等
        body = msg,
        proxy = {}
    }, function(response)
        if response then
          handleResponse(response)
        else
          handleError("Request failed")
        end
        end
    )
end



local function handleResponse(response)
    -- 处理响应
    print("Response Code:", response.code)
    print("Response Body:", response.body)
end
  
local function handleError(error)
    -- 处理错误
    print("Error:", error)
end



return http_transport
