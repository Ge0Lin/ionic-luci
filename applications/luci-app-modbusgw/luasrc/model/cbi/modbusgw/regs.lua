--
-- Copyright 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

local ds = require "luci.dispatcher"

m = Map("modbusgw", translate("Modbus Gateway - Device registers"), 
	translate("Edit the Modbus device registers on this page."))

device = m:section(NamedSection, arg[1], "device", translate("Device"))
device.anonymous = false
device.addremove = false

manufacturer = device:option(Value, "manufacturer", translate("Manufacturer"))
model = device:option(Value, "model", translate("Model"))
description = device:option(Value, "description", translate("Description"))

registers = m:section(TypedSection, "register", translate("Registers"))
registers.template = "cbi/tblsection"
registers.addremove = true
registers.anonymous = true
registers.sortable = true

registers.filter = function(self, section)
	return self.map:get(section, "id") == arg[1]
end

registers.create = function(self, section)
	created = TypedSection.create(self, section)
	self.map:set(created, "id", arg[1])
end

name = registers:option(Value, "name", translate("Name"))
register = registers:option(ListValue, "register", translate("Register"))
register:value("coil", translate("Coil"))
register:value("discrete", translate("Discrete"))
register:value("input", translate("Input"))
register:value("holding", translate("Holding"))
type = registers:option(ListValue, "type", translate("type"))
type:value("", translate("Undefined"))
type:value("float32", translate("Float"))
type:value("hex", translate("Hex"))
type:value("signed16", translate("Signed-16"))
type:value("unsigned16", translate("Unsigned-16"))
type:value("string", translate("String"))
address = registers:option(Value, "address", translate("Address"))
address.size = 3
description = registers:option(Value, "description", translate("Description"))

return m

