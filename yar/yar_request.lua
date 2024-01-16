local os = require("os")

local yar_request = {
    id = 0,
    method = "",
    params = {},
}

function yar_request:New(t)
    t = t or {}
    setmetatable(t, self)
    self.__index = self

    local reqId =  os.time() .. math.random(1000, 9999)
    self:setId(reqId)

    return t
end

function yar_request:setId(id)
    self.id = id
end

function yar_request:getId()
    return self.id
end



return yar_request