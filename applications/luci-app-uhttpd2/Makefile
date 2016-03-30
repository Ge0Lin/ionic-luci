#
# Copyright (C) 2015 Bright Things UN Ltd. - http://bright-things.com
#

include $(TOPDIR)/rules.mk

# LuCI specific settings
LUCI_TITLE:=LuCI uhttpd config
LUCI_DEPENDS:=+luci-mod-admin-full
LUCI_PKGARCH:=all

PKG_NAME:=luci-app-uhttpd2

# Version == major.minor.patch
# increase on new functionality (minor) or patches (patch)
PKG_VERSION:=0.0.1

# Release == build
# increase on changes of translation files
PKG_RELEASE:=1

PKG_LICENSE:=Proprietary
PKG_MAINTAINER:=Lars Boegild Thomsen <lth@bright-things.com>

define Package/$(PKG_NAME)/config
# shown in make menuconfig <Help>
help
	$(LUCI_TITLE)

	Version   : $(PKG_VERSION)-$(PKG_RELEASE)
	Maintainer: $(PKG_MAINTAINER)
endef

include ../../luci.mk

# call BuildPackage - OpenWrt buildroot signature
