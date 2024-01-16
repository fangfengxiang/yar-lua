local yar_client = require "yar.yar_client"
local yar = require("yar")

local client = yar_client:New("http://www.yar.com")

print(client.remote_gateway)

local ret = client:callFun("hello",{k="2",3})

print(ret)

local yar_request = yar.request:New({id=2})
print(yar_request.id)
print(yar_request:serialized())