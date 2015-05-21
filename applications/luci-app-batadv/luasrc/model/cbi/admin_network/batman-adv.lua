--
-- Copyright 2015 Bright Things UN Ltd.
--
-- Maintainer: Lars Boegild Thomsen <lth@bright-things.com>
--

local ds = require "luci.dispatcher"

m = Map("batman-adv", translate("Batman Adv Configuration"), 
	translate("The following defines the configuration of \
                   batman-adv mesh networking"))

interfaces = m:section(TypedSection, "mesh", translate("Mesh Interfaces"))
interfaces.addremove = true
interfaces.anonymous = false
interfaces.sortable = true

ap_isolation = interfaces:option(Value, "ap_isolation", translate("AP Isolation"))
ap_isolation:value("0", translate("No"))
ap_isolation:value("1", translate("Yes"))

aggregated_ogms = interfaces:option(Value, "aggregated_ogms", translate("Aggregated Originator Messages"))
aggregated_ogms:value("0", translate("No"))
aggregated_ogms:value("1", translate("Yes"))

bonding = interfaces:option(Value, "bonding", translate("Bonding Mode"))
bonding:value("0", translate("No"))
bonding:value("1", translate("Yes"))

bridge_loop_avoidance = interfaces:option(Value, "bridge_loop_avoidance", translate("Bridge Loop Avoidance"))
bridge_loop_avoidance:value("0", translate("No"))
bridge_loop_avoidance:value("1", translate("Yes"))

distributed_arp_table = interfaces:option(Value, "distributed_arp_table", translate("Distributed ARP Table"))
distributed_arp_table:value("0", translate("No"))
distributed_arp_table:value("1", translate("Yes"))

fragmentation = interfaces:option(Value, "fragmentation", translate("Fragmentation"))
fragmentation:value("0", translate("No"))
fragmentation:value("1", translate("Yes"))

gw_bandwidth = interfaces:option(Value, "gw_bandwidth", translate("Gateway Bandwidth"))

gw_mode = interfaces:option(Value, "gw_mode", translate("Gateway Mode"))
gw_mode:value("0", translate("No"))
gw_mode:value("1", translate("Yes"))

gw_sel_class = interfaces:option(Value, "gw_sel_class", translate("Gateway Selection Class"))

hop_penalty = interfaces:option(Value, "hop_penalty", translate("Hop Penalty"))

isolation_mark = interfaces:option(Value, "isolation_mark", translate("Isolation Mark"))

multicast_mode = interfaces:option(Value, "multicast_mode", translate("Multicast Mode"))
multicast_mode:value("0", translate("No"))
multicast_mode:value("1", translate("Yes"))

return m

