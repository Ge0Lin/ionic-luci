# Copyright (C) Thomas Wagner Thomas.Wagner@hs-rm.de
# This is free software, licensed under the GNU General Public License v2.

include $(TOPDIR)/rules.mk

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=wificonfig-mesh
PKG_RELEASE:=1
PKG_VERSION:=1.0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Intigrates 802.11s configuration in the uci system.
endef

define Build/Prepare
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/rc.d/
	$(INSTALL_BIN) S71wificonfig-enablemesh $(1)/etc/rc.d/S71wificonfig-enablemesh
	$(INSTALL_DIR) $(1)/root/
	$(INSTALL_BIN) mac80211_uci.lua $(1)/root/mac80211_uci.lua
	#$(CP) -r postinst $(1)/CONTROL
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
