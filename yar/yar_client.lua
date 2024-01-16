
local local_http_gateway = "http://127.0.0.1"
local yar_client = {
    remote_gateway = local_http_gateway,
}


function yar_client:New(url)
    local client = {remote_gateway = url}
    setmetatable(client, self)
    self.__index = self
    return client
end

function yar_client:callFun(fun_name,params)
    print(fun_name)
    print(params)
    print(self)
    return params["k"]
end

function yar_client:setOpt(k,v)
    self[k] = v
end


return yar_client

