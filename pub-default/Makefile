#
# Copyright (c) 2014 Bright Things Ltd. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pub-default
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/pub-default
  SECTION:=utils
  CATEGORY:=Ionic
  TITLE:=Default Cloak Configuration
  DEPENDS:=+base-files +ionic-default
endef

define Package/pub-default/conffiles
/etc/uci-defaults/80-hostname
endef

define Build/Compile
	# NOOP
endef

define Package/pub-default/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_CONF) ./files/etc/uci-defaults/80-hostname $(1)/etc/uci-defaults
endef

$(eval $(call BuildPackage,pub-default))
