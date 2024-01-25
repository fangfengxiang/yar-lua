local yar_header = {
    id = 0, -- 替换为实际id 值
    version = 0, -- version 值
    magic_num = 0x80DFEC60, -- magic_num固定为0x80DFEC60
    reserved = 0, -- 替换 987 为实际的 reserved 值
    provider = string.rep("\0", 32), -- 32 字节的空字符串
    token = string.rep("\0", 32), -- 32 字节的空字符串
    body_len = 0 -- 替换 1000 为实际的 body_len 值
}

local _M = yar_header

_M.new = function ()
    local t = {}
    setmetatable(t, { __index = _M})
    -- 其他初始化操作
    return t
end


_M.pack = function(self)
    return string.pack(">I4", self.id)
        .. string.pack(">H", self.version)
        .. string.pack(">I4", self.magic_num)
        .. string.pack(">I4", self.reserved)
        .. string.pack(">c32", self.provider)
        .. string.pack(">c32", self.token)
        .. string.pack(">I4", self.body_len)
end

_M.unpack = function (data)
    local self = {}
    self.id = string.unpack(">I4", data)
    self.version = string.unpack(">H", data, 5)
    self.magic_num = string.unpack(">I4", data, 7)
    self.reserved = string.unpack(">I4", data, 11)
    self.provider = string.unpack(">c32", data, 15)
    self.token = string.unpack(">c32", data, 47)
    self.body_len = string.unpack(">I4", data, 79)
    return self
end

return _M