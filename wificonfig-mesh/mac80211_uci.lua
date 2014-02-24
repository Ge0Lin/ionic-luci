#!/usr/bin/lua 

sf=string.format
local lines = 0
local txpowerset = false
local s1 =[[handle_mesh_param() {
	iw dev "$ifname" set mesh_param "$1"
}

authsae_prepare() {
	echo 'authsae:
{
 sae:
  {
    /*SAE*/
  };
 meshd:
  {
    /*MESHD*/
  };
};' > "$1"

	A_PROC_NO=$(ps |grep meshd-nl80211|grep "\-i $ifname -c" |sed 's/^ *//g'|cut -d ' ' -f 1)
	[ "$A_PROC_NO" ] &&  kill "$A_PROC_NO"
}

authsae_start(){
	meshd-nl80211 -B -i "$ifname" -c "$1"
	rm -f "$1".tmp
	# rm -f "$1"
}

authsae_set(){
	cp "$1" "$1".tmp;cat "$1".tmp | sed "s/\/\*$2\*\//$3 = $4;\n    \/\*$2\*\//g" > "$1"
}
]]

local s2 = '				iw phy "$phy" interface add "$ifname" type mp'

local s3 = [[			mesh)
				config_get mesh_id "$vif" mesh_id
				config_get encryption "$vif" encryption
				[ "$encryption" == "authsae" ] && {
					CFG_FILE="/tmp/authsae.$ifname.cfg"
					local key
					config_get key "$vif" key ""
					local grp 
					config_get grp "$vif" authsae_group "[19, 26, 21, 25, 20]"
					local blist
					config_get blist "$vif" authsae_blacklist "5"
					local thresh
					config_get thresh "$vif" authsae_thresh "5"
					local lifetime
					config_get lifetime "$vif" authsae_lifetime "3600"
					local mcast
					config_get mcast "$vif" authsae_mcastrate "1"
					local hwmode
					config_get hwmode "$device" hwmode
					BAND="11g"
					[ "$hwmode" == "11a" -o "$hwmode" == "11b" ] && BAND="$hwmode"
					local htmode
					config_get htmode "$device" htmode

					authsae_prepare "$CFG_FILE";
					authsae_set "$CFG_FILE" "SAE" "password" "\"$key\""
					authsae_set "$CFG_FILE" "SAE" "group" "$grp"
					authsae_set "$CFG_FILE" "SAE" "blacklist" "$blist"
					authsae_set "$CFG_FILE" "SAE" "thresh" "$thresh"
					authsae_set "$CFG_FILE" "SAE" "lifetime" "$lifetime"
					authsae_set "$CFG_FILE" "MESHD" "meshid" "\"$mesh_id\""
					authsae_set "$CFG_FILE" "MESHD" "interface" "\"$ifname\""
					authsae_set "$CFG_FILE" "MESHD" "passive" "0"
					authsae_set "$CFG_FILE" "MESHD" "mediaopt" "1"
					authsae_set "$CFG_FILE" "MESHD" "band" "\"$BAND\""
					authsae_set "$CFG_FILE" "MESHD" "channel" "$channel"
					[ "$htmode" == "HT40+" -o "$htmode" == "HT40-" -o "$htmode" == "HT20" ] && 
						authsae_set "$CFG_FILE" "MESHD" "htmode" "\"$htmode\""          ||
						authsae_set "$CFG_FILE" "MESHD" "htmode" "\"none\""
					authsae_set "$CFG_FILE" "MESHD" "mcast-rate" "$mcast"

					authsae_start "$CFG_FILE"
				}
				[ "$encryption" == "authsae" ] || iw dev "$ifname" mesh join "$mesh_id"
				config_list_foreach "$vif" mesh_param handle_mesh_param
				# Workarround to make setup gate/root announcement
				# eaiser to handel for luci. This will override settings mad by mesh_param list
				local mesh_root
				local mesh_gate
				config_get mesh_root "$vif" mesh_root
				config_get mesh_gate "$vif" mesh_gate
				[ "$mesh_root" == "0" -o  "$mesh_root" == "1" ]&& iw dev "$ifname" set mesh_param mesh_hwmp_rootmode=$mesh_root
				[ "$mesh_gate" == "0" -o  "$mesh_gate" == "1" ]&& iw dev "$ifname" set mesh_param mesh_gate_announcements=$mesh_gate
			;;]]

for line in io.lines("/tmp/mac80211.sh") do
	if (string.match(line,"enable_mac80211%(%)%s+%{") ~= nil) then
		print(s1)
	end
	if(string.match(line, "iw%s+phy.*interface%s+add.*type%s+mp%s+mesh_id.*")) then
		line = s2
	end
	if(string.match(line, "^%s+txpower%s*=.*vif_txpower.*")) then
		txpowerset = true
	end
	if(txpowerset and string.match(line, "^%s+adhoc%)%s*$")) then
		print(s3)
	end
	
	if (string.match(line,"config_get%s+mesh_id") == nil) then
		print(line)
	end
end
