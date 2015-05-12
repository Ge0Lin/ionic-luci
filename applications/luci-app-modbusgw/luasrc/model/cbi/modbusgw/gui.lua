--
-- Copyright 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

local ds = require "luci.dispatcher"

m = Map("modbusgw", translate("Modbus Gateway - Web Interface"), 
	translate("Web Interface setting."))

contacts = m:section(TypedSection, "contact", translate("Contacts"))
contacts.anonymous = true
contacts.addremove = true

contact_type = contacts:option(Value, "type", translate("Type"))
contact_type:value("customer", translate("Customer"))
contact_type:value("installer", translate("Installer"))
contact_type:value("representative", translate("Representative"))
contact_name = contacts:option(Value, "name", translate("Name"))
contact_contact = contacts:option(Value, "contact", translate("Contact"))
contact_email = contacts:option(Value, "email", translate("Email"))
contact_phone = contacts:option(Value, "phone", translate("Phone"))
contact_address1 = contacts:option(Value, "address1", translate("Address 1"))
contact_address2 = contacts:option(Value, "address2", translate("Address 2"))
contact_zip = contacts:option(Value, "zip", translate("Zip"))
contact_city = contacts:option(Value, "city", translate("City"))
contact_country = contacts:option(Value, "country", translate("Country"))

users = m:section(TypedSection, "user", translate("Users"))
users.template = "cbi/tblsection"
users.addremove = true
users.anonymous = true
users.sortable = true

path = users:option(Value, "path", translate("Path"))

username = users:option(Value, "username", translate("Username"))

password = users:option(Value, "password", translate("Password"))
password.password = true

return m

