--
-- Copyright (C) 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

module("luci.controller.admin.batman-adv", package.seeall)

function index() 

	entry({"admin", "network", "batman-adv"}, cbi("admin_network/batman-adv"), translate("Batman Adv"), 60)

end
