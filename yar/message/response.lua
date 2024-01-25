local yarResponse = {
    id = 0,
    status = 0,
    output = "",
    err = "",
    retval = nil
}

local _M  = yarResponse


_M.new = function(t)
    t = t or {}
    setmetatable(t, {__index = _M})
    return t
end

function _M:setId(id)
    self.id = id
end

function _M:getId()
    return self.id
end


_M.unpack = function (packVal)
    local r = {}
    setmetatable(r, {__index = _M})
    r.id = packVal.i
    r.status = packVal.s
    r.output = packVal.o
    r.err = packVal.e
    r.retval = packVal.r
    return r
end

return _M