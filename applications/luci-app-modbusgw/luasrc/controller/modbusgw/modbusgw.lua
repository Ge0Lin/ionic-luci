--
-- Copyright (C) 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

module("luci.controller.modbusgw.modbusgw", package.seeall)

function index() 

	entry({"admin", "modbusgw"}, firstchild(), translate("Rio350"), 1).dependent=false
	entry({"admin", "modbusgw", "gui"}, cbi("modbusgw/gui"), translate("Web Interface"), 1)
	entry({"admin", "modbusgw", "devices"}, cbi("modbusgw/devs"), translate("Devices"), 2)
	entry({"admin", "modbusgw", "definitions"}, cbi("modbusgw/defs"), translate("Device Definitions"), 3)
	entry({"admin", "modbusgw", "registers"}, cbi("modbusgw/regs"), nil).leaf=true
	entry({"admin", "modbusgw", "addresses"}, cbi("modbusgw/addr"), nil).leaf=true

end
