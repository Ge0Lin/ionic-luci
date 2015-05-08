--
-- Copyright 2015 Bright Things UN Ltd. 
-- 
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

local ds = require "luci.dispatcher"

m = Map("modbusgw", translate("Modbus Gateway - Device definitions"), 
	translate("The following is a list of all Modbus device types \
                   currently supported by this Modbus Gateway.  To add a \
                   new device, please define it here, or check \
                   <a href='#'>here</a> if any pre-defined devices are \
                   available."))

s = m:section(TypedSection, "definition", translate("Device Definitions"))
s.template = "cbi/tblsection"
s.addremove = true
s.anonymous = false
s.sortable = false
s.extedit = ds.build_url("admin/modbusgw/registers", "%s")

ma = s:option(Value, "manufacturer", translate("Manufactuer"))

mo = s:option(Value, "model", translate("Model"))

de = s:option(Value, "description", translate("Description"))

return m

