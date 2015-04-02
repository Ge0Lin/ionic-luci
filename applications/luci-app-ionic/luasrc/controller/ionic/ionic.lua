-- Copyright 2015 Bright Things UN Ltd. <lth@bright-things.com>

module("luci.controller.ionic.ionic", package.seeall)

function index()
	local uci = require "luci.model.uci".cursor()
	local page

	-- Frontend
	page          = node()
	page.lock     = true
	page.target   = alias("ionic")
	page.subindex = true
	page.index    = false

	page          = node("ionic")
	page.title    = _("Ionic")
	page.target   = alias("ionic", "index")
	page.order    = 5
	page.setuser  = "nobody"
	page.setgroup = "nogroup"
	page.i18n     = "freifunk"
	page.index    = true

	page          = node("ionic", "index")
	page.target   = template("ionic/index")
	page.title    = _("Overview")
	page.order    = 10
	page.indexignore = true
end


