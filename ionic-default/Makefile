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
  CATEGORY:=Base system
  TITLE:=Default Ionic Configurations
  DEPENDS:=+base-files
endef

define Package/ionic-default/conffiles
/etc/IONIC_VERSION
endef

define Build/Compile
	# NOOP
endef

define Package/ionic-default/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/etc/IONIC-VERSION $(1)/etc/
endef

$(eval $(call BuildPackage,ionic-default))
