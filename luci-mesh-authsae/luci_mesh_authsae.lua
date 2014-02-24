#!/usr/bin/lua 

sf=string.format
local lines = 0
local txpowerset = false
local s1 = '		encr:value("authsae", "Auth SAE", {mode="mesh"})'
local s4 = 'wpakey:depends("encryption", "authsae")'

for line in io.lines("/tmp/wifi.lua.meshaddauthsae") do
	print(line)
	
	if (string.match(line,'wpakey.*taboption.*encryption.*Value.*wpa_key.*translate.*Key.*') ~= nil) then
		print(s4)
	end
	if (string.match(line,'%s*if%s+hostapd%s+and%s+supplicant%s+then') ~= nil) then
		print(s1)
	end
	if (string.match(line,'%s*elseif%s+hostapd%s+and%s+not%s+supplicant%s+then') ~= nil) then
		print(s1)
	end
	if (string.match(line,'%s*elseif%s+not%s+hostapd%s+and%s+supplicant%s+then') ~= nil) then
		print(s1)
	end
end
