--
-- Copyright 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

local ds = require "luci.dispatcher"

m = Map("users", translate("Modbus Gateway - Users"), 
	translate("The following is a list of users that can access the Modbus Gateway \
                   web interface."))

s = m:section(TypedSection, "user", translate("Users"))
s.template = "cbi/tblsection"
s.addremove = true
s.anonymous = true
s.sortable = true

path = s:option(Value, "path", translate("Path"))

username = s:option(Value, "username", translate("Username"))

password = s:option(Value, "password", translate("Password"))
password.password = true

return m

