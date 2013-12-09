--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2008 Jo-Philipp Wich <xm@leipzig.freifunk.net>

Copyright 2013 Edwin Chen <edwin@dragino.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0 

$Id: network.lua 5948 2010-03-27 14:54:06Z jow $
]]--


local wa  = require "luci.tools.webadmin"
local sys = require "luci.sys"
local fs  = require "nixio.fs"

local has_pptp  = fs.access("/usr/sbin/pptp")
local has_pppoe = fs.glob("/usr/lib/pppd/*/rp-pppoe.so")()


m = Map("secn", translate("Small Enterprise-Campus Network"))
s = m:section(NamedSection, "wan", "secn", translate("Internet Access"))
s.addremove = false

local w = s:option(ListValue, "wanport", translate("Access Internet Via"))
--w.override_values = true 
w:value("Disable","Disable")
w:value("Ethernet","WAN Port")
w:value("WiFi","Wifi Client")
w:value("USB-Modem","USB Modem")

local wssid = s:option(Value, "wanssid", "SSID")
wssid:depends("wanport","WiFi")

local wpwd = s:option(Value, "wanpass", "Password")
wpwd:depends("wanport","WiFi")
wpwd.password = true

local wencr = s:option(ListValue,"wanencr","Encryption")
wencr:depends("wanport","WiFi")
wencr:value("none", "No Encryption")
wencr:value("wep", "WEP")
wencr:value("psk", "WPA-PSK")
wencr:value("psk2", "WPA2-PSK")
--#####################wencr:value("psk-mixed", "WPA-PSK/WPA2-PSK Mixed Mode")

local p = s:option(ListValue, "ethwanmode", "Way to Get IP")
--p.override_values = true
p:value("Static", "Static IP")
p:value("DHCP", "DHCP")
if has_pppoe then p:value("pppoe", "PPPoE") end
if has_pptp  then p:value("pptp",  "PPTP")  end
p:depends("wanport","Ethernet")
p:depends("wanport","WiFi")

--#########################need to rewite code to support pppoe or add in SECN-Config

local ip = s:option(Value, "wanip", "IP Address")
ip:depends("ethwanmode", "Static")
ip.datatype = "ipaddr"

local nm = s:option(Value, "wanmask", "Netmask")
nm.default = "255.255.255.0"
nm:depends("ethwanmode", "Static")
nm:value("255.255.255.0")
nm:value("255.255.0.0")
nm:value("255.0.0.0")
nm.datatype = "ipaddr"

local gw = s:option(Value, "wangateway", "Gateway")
gw:depends("ethwanmode", "Static")
gw.rmempty = true
gw.datatype = "ipaddr"

local dns = s:option(Value, "wandns", "DNS Server")
dns:depends("ethwanmode", "Static")
dns.rmempty = true
dns.datatype = "host"
dns.placeholder = "DNS server domain or IP"

local pusr = s:option(Value, "username", translate("User Name"))
pusr:depends("ethwanmode", "pppoe")
pusr:depends("ethwanmode", "pptp")

local ppwd = s:option(Value, "password", translate("Password"))
ppwd.password = true
ppwd:depends("ethwanmode", "pppoe")
ppwd:depends("ethwanmode", "pptp")

s = m:section(NamedSection, "modem", "secn", "USB Modem Setting")
local ms = s:option(ListValue, "service", "USB Modem Service")
--ms.default = "utms"
ms:value("umts", "UMTS")
ms:value("gprs", "GPRS")
ms:value("cdma", "CDMA")
ms:value("evdo", "EV-DO")

local uvid = s:option(Value, "vendor", "VID")
uvid.placeholder = "USB Vendor ID"

local upid = s:option(Value, "product", "PID")
upid.placeholder = "USB Product ID"

s:option(Value, "apn", "Service APN")
s:option(Value, "dialstr", "Dial String")
s:option(Value, "username", "Username")
local upwd = s:option(Value, "password", "Password")
upwd.password = true

s:option(Value, "pin", "PIN")
s:option(Value, "modemport", "USB Serial Port")

return m
