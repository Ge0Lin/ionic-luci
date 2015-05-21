--
-- Copyright 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

local ds = require "luci.dispatcher"

m = Map("uhttpd", translate("Web Server - Server Process"), 
	translate("Edit the Web Server Process on this page."))

m.redirect = luci.dispatcher.build_url("admin/system/uhttpd")


server = m:section(NamedSection, arg[1], "uhttpd", translate("Process Settings"))

server_home = server:option(Value, "home", translate("Home"))

server_cert = server:option(Value, "cert", translate("Certificate"))
server_key = server:option(Value, "key", translate("Key"))
server_cgi_prefix = server:option(Value, "cgi_prefix", translate("CGI Prefix"))
server_lua_prefix = server:option(Value, "lua_prefix", translate("LUA Prefix"))
server_lua_handler = server:option(Value, "lua_handler", translate("LUA Handler"))
server_script_timeout = server:option(Value, "script_timeout", translate("Script Timeout"))
server_realm = server:option(Value, "realm", translate("Authentication Realm"))
server_config = server:option(Value, "config", translate("User Configuration"))
server_index_page = server:option(Value, "index_page", translate("Index File"))
server_error_page = server:option(Value, "error_page", translate("Error File"))
server_no_symlinks = server:option(Value, "no_symlinks", translate("No Symbolic Links"))
server_no_symlinks:value("0", "False")
server_no_symlinks:value("1", "True")
server_no_dirlists = server:option(Value, "no_dirlists", translate("No Directory Lists"))
server_no_dirlists:value("0", "False")
server_no_dirlists:value("1", "True")

http_port = server:option(DynamicList, "listen_http", translate("HTTP Listeners"))
http_port.optional = true
http_port.placeHolder = "80"

https_port = server:option(DynamicList, "listen_https", translate("HTTPS Listeners"))
https_port.optional = true
https_port.placeholder = "443"

return m

