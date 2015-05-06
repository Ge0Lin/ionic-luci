--
-- Copyright (C) 2015 Bright Things UN Ltd. <lth@bright-things.com>
--

module("luci.controller.modbusgw.modbusgw", package.seeall)

function index() 

	entry({"admin", "modbusgw"}, firstchild(), "Modbus Gateway", 30).dependent=false
	entry({"admin", "modbusgw", "devices"}, cbi("modbusgw/devices"), "Devices", 1)
	entry({"admin", "modbusgw", "definitions"}, cbi("modbusgw/defs"), "Device Definitions", 2)
	entry({"admin", "modbusgw", "registers"}, cbi("modbusgw/regs"), nil).leaf=true


end
