include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=luci-mesh
PKG_RELEASE:=1
PKG_VERSION:=1.0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=11s config for luci
  DEPENDS=+iw +luci
endef

define Build/Prepare
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/rc.d/
	$(INSTALL_BIN) S72wificonfig-lucimesh $(1)/etc/rc.d/S72wificonfig-lucimesh
	$(INSTALL_DIR) $(1)/root/
	$(INSTALL_BIN) luci_mesh.lua $(1)/root/luci_mesh.lua
	#$(CP) -r postinst $(1)/CONTROL
endef

$(eval $(call BuildPackage,$(PKG_NAME))) 
