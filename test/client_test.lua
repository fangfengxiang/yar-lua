-- 获取当前测试文件所在的路径
local test_path = debug.getinfo(1, "S").source:sub(2)

-- 获取 src 文件夹的路径
local src_path = test_path:match("(.-)[^\\/]+$") .. "/yar/"

-- 添加 src 路径到模块搜索路径中
package.path = package.path .. ";"  .. "./yar/?.lua"
print(package.path)

local lu = require("luaunit")

local YarClient = require("yar.client")

function TestClient()
    --lu.assertEquals(YarClient,{})
    local client = YarClient.new("http://localhost/test/server.php")
    client:setopt("proxy","http://127.0.0.1:8888")
    ret = client:call("hello",1)
    print(ret)
end

os.exit(lu.LuaUnit.run())

