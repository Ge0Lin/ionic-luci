#
# Copyright (c) 2014 Bright Things Ltd. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rio700-default
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/rio700-default
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Default Rio 700 Configuration
  DEPENDS:=+base-files
endef

define Package/rio700-default/conffiles
/etc/RIO700-VERSION
endef

define Build/Compile
	# NOOP
endef

define Package/rio700-default/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/etc/RIO700-VERSION $(1)/etc/
endef

$(eval $(call BuildPackage,rio700-default))
