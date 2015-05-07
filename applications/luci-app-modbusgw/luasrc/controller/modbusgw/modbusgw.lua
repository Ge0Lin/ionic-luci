--
-- Copyright (C) 2015 Bright Things UN Ltd. <lth@bright-things.com>
--

module("luci.controller.modbusgw.modbusgw", package.seeall)

function index() 

	entry({"admin", "modbusgw"}, firstchild(), translate("Modbus Gateway"), 30).dependent=false
	entry({"admin", "modbusgw", "devices"}, cbi("modbusgw/devs"), translate("Devices"), 1)
	entry({"admin", "modbusgw", "definitions"}, cbi("modbusgw/defs"), translate("Device Definitions"), 2)
	entry({"admin", "modbusgw", "registers"}, cbi("modbusgw/regs"), nil).leaf=true

end
