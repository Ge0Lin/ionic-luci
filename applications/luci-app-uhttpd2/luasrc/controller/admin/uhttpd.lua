--
-- Copyright (C) 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

module("luci.controller.admin.uhttpd", package.seeall)

function index() 

	entry({"admin", "system", "uhttpd"}, cbi("admin_system/uhttpd"), translate("Web Server"), 65)
	entry({"admin", "system", "uhttpd_servers"}, cbi("admin_system/uhttpd_servers"), nil, 0).leaf = true

end
