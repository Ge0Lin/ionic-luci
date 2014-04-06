#
# Copyright (c) 2014 Lars Boegild Thomsen <lth@cow.dk>
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

RTL8188EU_VERSION=20140404
RTL8188EU_RELEASE=1

PKG_NAME:=rtl8188eu
PKG_VERSION:=$(RTL8188EU_VERSION)
PKG_RELEASE:=1
PKG_REV:=fcc9034b0d2170b4942133a43a9521aab2e0beac

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/lwfinger/rtl8188eu.git
PKG_SOURCE_SUBDIR:=rtl8188eu-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=git

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

RTL8188EU_AUTOLOAD:=wlan

define KernelPackage/rtl8188eu
  SUBMENU:=Wireless Drivers
  TITLE:=Realtek RTL8188EU
  URL:=http://github.com/lwfinger/rtl8188eu.git
  AUTOLOAD:=$(call AutoLoad,50,$(RTL8188EU_AUTOLOAD))
endef

define KernelPackage/rtl8188eu/description
  Kernel module for the RTL8188EU chipset
endef

MAKE_OPTS:= \
    ARCH="$(LINUX_KARCH)" \
    CROSS_COMPILE="$(TARGET_CROSS)" \
    SUBDIRS="$(PKG_BUILD_DIR)" \
    EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
    LINUXINCLUDE="-I$(LINUX_DIR)/include -include linux/autoconf.h" \
    $(EXTRA_KCONFIG)

define Build/Compile
  $(MAKE) -C "$(LINUX_DIR) $(MAKE_OPTS) modules
endef

$(eval $(call KernelPackage,rtl8188eu))

