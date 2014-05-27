#
# Copyright (c) 2014 Bright Things Ltd. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ionic-default
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/ionic-default
  SECTION:=utils
  CATEGORY:=Ionic
  TITLE:=Default Ionic Configurations
  DEPENDS:=+base-files
endef

define Package/ionic-default/conffiles
/etc/shadow
/etc/uci-defaults/70-firewall
/etc/uci-defaults/70-hostname
/etc/uci-defaults/70-uhttpd
endef

define Build/Compile
	# NOOP
endef

define Package/ionic-default/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_CONF) ./files/etc/shadow $(1)/etc
	$(INSTALL_CONF) ./files/etc/banner $(1)/etc
	$(INSTALL_CONF) ./files/etc/modprobe.d/iface/99-ddnsupdate $(1)/etc/modprobe.d/iface
	$(INSTALL_CONF) ./files/etc/uci-defaults/70-firewall $(1)/etc/uci-defaults
	$(INSTALL_CONF) ./files/etc/uci-defaults/70-hostname $(1)/etc/uci-defaults
	$(INSTALL_CONF) ./files/etc/uci-defaults/70-uhttpd $(1)/etc/uci-defaults
endef
	$(INSTALL_BIN) ./files/usr/bin/ddnsup $(1)/usr/bin

$(eval $(call BuildPackage,ionic-default))
