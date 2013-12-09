--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2008 Jo-Philipp Wich <xm@leipzig.freifunk.net>

Copyright 2013 Edwin Chen <edwin@dragino.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id: ap.lua 5948 2010-03-27 14:54:06Z jow $
]]--

m = Map("secn", translate("Small Enterprise-Campus Network"))
s = m:section(NamedSection, "accesspoint", "secn", translate("Access Point"))
s.addremove = false

local ad = s:option(Flag, "ap_disable", "Enable WiFi AP",
	"Enable WiFi AP")
ad.enabled  = "0"
ad.disabled = "1"
ad.default  = ad.disable
ad.rmempty  = false

local ssid = s:option(Value, "ssid", "<abbr title=\"SSID, Leave blank to use hostname as default setting\">Station ID</abbr>")
ssid.default= luci.sys.hostname()
ssid.placeholder = "Default:" .. luci.sys.hostname()

local encry = s:option(ListValue, "encryption", "Encryption")
encry:value("WPA1","WPA1")
encry:value("WPA2","WPA2")
encry:value("WEP","WEP")
encry:value("NONE","None")

local pwd = s:option(Value, "passphrase", "Passphrase")
pwd.default= "dragino-dragino"
pwd.placeholder = "AP Password"
pwd.password = true
pwd:depends("encryption","WPA1")
pwd:depends("encryption","WPA2")
pwd:depends("encryption","WEP")

local ur = s:option(Flag, "usreg_domain", "CAN/US Reg")
ur.rmempty  = false
ur.enabled  = "1"
ur.disabled = "0"

local channel = s:option(ListValue, "CHANNEL", "Channel")
channel.default = "6"
for i=1,11 do  
	channel:value(i,"Channel ".. i)
end
	channel:value("12","Channel 12")
	channel:value("13","Channel 13")

local ass = s:option(Value, "maxassoc", "AP Connections")
ass.default= "30"
ass.rmempty  = false
ass.datatype = "range(0,35)"
ass.placeholder = "a number from 0 to 35,0 means disable"

return m