--
-- Copyright 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

local ds = require "luci.dispatcher"

m = Map("modbusgw", translate("Modbus Gateway - Address"), 
	translate("Edit the address on this page."))

contact = m:section(NamedSection, arg[1], "contact", translate("Contact"))
contact.anonymous = true
contact.addremove = false

type = contact:option(Value, "type", translate("Type"))
type:value("location", "Location")
type:value("installer", "Installer")
type:value("vendor", "Vendor")
type:value("representative", "Representative")
name = contact:option(Value, "name", translate("Name"))
description = contact:option(Value, "description", translate("Description"))
street1 = contact:option(Value, "street1", translate("Address"))
street2 = contact:option(Value, "street2", translate("-"))
zip = contact:option(Value, "zip", translate("Zip"))
city = contact:option(Value, "city", translate("City"))
state = contact:option(Value, "state", translate("State"))
country = contact:option(Value, "country", translate("Country"))

latitude = contact:option(Value, "latitude", translate("Latitude"))
longitude = contact:option(Value, "longitude", translate("Longitude"))

return m

