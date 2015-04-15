-- Copyright 2015 Bright Things UN Ltd. <lth@bright-things.com>

local fs = require "nixio.fs"

local f = SimpleForm("modbusgw", translate("Modbus Gateway"), translate("Explanation here"))
local o = f:field(Value, "_custom")

o.template = "cbi/tvalue"
o.rows = 20

function o.cfgvalue(self, section) 
	return fs.readfile("/etc/modbusgw.json")
end

function o.write(self, section, value)
	value = value:gsub("\r\n?", "\n")
	fs.writefile("/etc/modbusgw.json", value)
end

return f
