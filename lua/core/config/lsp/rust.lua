local mason_registry = require("mason-registry")

local this_os = vim.loop.os_uname().sysname

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"

local codelldb_path = extension_path .. "/adapter/codelldb"
local liblldb_path = extension_path .. "/lldb/bin/liblldb"

if this_os:find("Windows") then
	codelldb_path = extension_path .. "\\adapter\\codelldb.exe"
	liblldb_path = extension_path .. "\\lldb\\bin\\liblldb.dll"
else
	liblldb_path = extension_path .. (this_os == "Linux" and ".so" or ".dylib")
end

vim.g.rustaceanvim = {
	dap = {
		adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
}
