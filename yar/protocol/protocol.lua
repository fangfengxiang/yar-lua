-- Yar协议定义


local yarHeader = require("yar.protocol.header")

-- Yar协议魔数
local YAR_PROTOCOL_MAGIC_NUM = 0x80DFEC60

local _M = {}


-- render
local function render(message,packager)

  -- @see yar.package.json.packager
  local payload = packager.pack(message:pack())
  local packagerName = string.pack(">c8",packager.getName())

  local header = yarHeader.new()
  -- @see yar.yar_header
  header.id = message:getId()
  header.magic_num = YAR_PROTOCOL_MAGIC_NUM
  header.body_len = string.len(payload)

  if string.len(message.options["provider"]) > 0 then
    header.provider = message.options["provider"]
  end

  if string.len(message.options["token"]) > 0 then
    header.provider = message.options["token"]
  end

  return header:pack() .. packagerName .. payload
end




local function parse(unpackData,packager)
  --local header = yarHeader.unpack(unpackData)
  --packagerName = string.unpack(">c8", unpackData, 83)
  local payloadData = string.sub(unpackData, 91)
  local responseData = packager.unpack(payloadData)
  --print(responseData.i)
  --print(payloadData)
  return responseData
end


_M.render = render
_M.parse = parse
return _M