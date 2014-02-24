#!/usr/bin/lua 

sf=string.format
local lines = 0
local txpowerset = false
local s1 =[[
mesh_id = s:taboption("general", Value, "mesh_id", translate("Mesh-ID"))
mesh_id:depends({mode="mesh"})
mesh_root = s:taboption("general", ListValue, "mesh_root", translate("Root Announcement"))
mesh_gate = s:taboption("general", ListValue, "mesh_gate", translate("Gate Announcement"))
mesh_root:depends({mode="mesh"})
mesh_root:value("0", translate("no"))
mesh_root:value("1", translate("yes"))
mesh_gate:depends({mode="mesh"})
mesh_gate:value("0", translate("no"))
mesh_gate:value("1", translate("yes"))
]]

for line in io.lines("/tmp/wifi.lua.meshadd") do
	if (string.match(line,'mode:value%(.*adhoc.*,%s*translate%(.*Ad.*Hoc.*%)%)') ~= nil) then
		print(line)
		print(s1)
	else
		print(line)
	end
end
