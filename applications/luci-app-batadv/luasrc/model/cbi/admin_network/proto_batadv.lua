-- Copyright 2015 Bright Things UN Ltd. <lth@bright-things.com>

local map, section, net = ...

local o = section:taboption("general", Value, "mtu",
	translate("MTU"))
o.default = "1560"

o = section:taboption("general", Value, "mesh", 
        translate("Mesh"))
o.default = "bat0"

