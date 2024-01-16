local cjson = require("cjson")
local json_packager = {}

function json_packager:getName()
    return "JSON"
end

function json_packager:pack(req)
    local msg = {
        i = req.id,
        m = req.method,
        p = req.params,
    }
    return cjson.encode(msg)
end

function json_packager:unpack()

end

return json_packager