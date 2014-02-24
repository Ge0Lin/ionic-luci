include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=luci-mesh-authsae
PKG_RELEASE:=1
PKG_VERSION:=1.0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=Crypted 11s config for luci
  DEPENDS=+iw +luci +luci-mesh
endef

define Build/Prepare
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/rc.d/
	$(INSTALL_BIN) S73wificonfig-lucimeshauthsae $(1)/etc/rc.d/S73wificonfig-lucimeshauthsae
	$(INSTALL_DIR) $(1)/root/
	$(INSTALL_BIN) luci_mesh_authsae.lua $(1)/root/luci_mesh_authsae.lua
	#$(CP) -r postinst $(1)/CONTROL
endef

$(eval $(call BuildPackage,$(PKG_NAME))) 
