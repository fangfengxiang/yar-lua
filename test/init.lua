-- 获取当前测试文件所在的路径
local test_path = debug.getinfo(1, "S").source:sub(2)

-- 获取 src 文件夹的路径
local src_path = test_path:match("(.-)[^\\/]+$") .. "../yar/"

-- 添加 src 路径到模块搜索路径中
package.path = package.path .. ";" .. src_path .. "?.lua"

print(debug.getinfo(1,"S"))
print(test_path .. "\n")
print(src_path .. "\n")
print(package.path .. "\n")