--
-- Copyright 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

local ds = require "luci.dispatcher"

m = Map("uhttpd", translate("Web Server Configuration"), 
	translate("The following defines the configuration of \
                   uhttpd, the Ionic Web Server."))

servers = m:section(TypedSection, "uhttpd", translate("Servers"))
servers.template = "cbi/tblsection"
servers.addremove = true
servers.anonymous = false
servers.sortable = true
servers.extedit = ds.build_url("admin/system/uhttpd_servers", "%s")

serverhome = servers:option(Value, "home", translate("Home"))

cert = m:section(NamedSection, "px5g", "cert", translate("Certificate Generation"))
cert.addremove = false
cert.anonymous = false
cert.sortable = false

certdays = cert:option(Value, "days", translate("Days"))
certbits = cert:option(Value, "bits", translate("Bits"))
certbits:value("512", "512")
certbits:value("1024", "1024")
certbits:value("2048", "2048")
certcountry = cert:option(Value, "country", translate("Country"))
certstate = cert:option(Value, "state", translate("State"))
certlocation = cert:option(Value, "location", translate("Location"))
certcommonname = cert:option(Value, "commonname", translate("Common name"))

return m

