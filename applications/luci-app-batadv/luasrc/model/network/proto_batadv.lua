--
-- Copyright 2015 Bright Things UN Ltd <lth@bright-things.com>
--

local proto = luci.model.network:register_protocol("batadv")

function proto.get_i18n(self)
	return luci.i18n.translate("Batman Adv")
end

function proto.is_installed(self)
	return nixio.fs.access("/usr/sbin/batctl")
end
