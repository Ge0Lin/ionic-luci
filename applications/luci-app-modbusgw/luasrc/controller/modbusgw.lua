--
-- Copyright (C) 2015 Bright Things UN Ltd. <lth@bright-things.com>
--

module("luci.controller.modbusgw", package.seeall)

function index() 

	entry({"admin", "bt"}, firstchild(), "Bright Things", 3-).dependent=false
	entry({"admin", "bt", "modbusgw"}, cbi("modbusgw/index"), "Modbus Gateway", 1)

end
