#
# Copyright (c) 2014 Lars Boegild Thomsen <lth@cow.dk>
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

RT8188EU_VERSION=20140404
RT8188EU_RELEASE=1

PKG_NAME:=rt8188eu
PKG_VERSION:=$(RT8188EU_VERSION)
PKG_RELEASE:=1
PKG_REV:=fcc9034b0d2170b4942133a43a9521aab2e0beac

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/lwfinger/rtl8188eu.git
PKG_SOURCE_SUBDIR:=rt8188eu-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=git

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

ifeq ($(ARCH),mips)
  HAL_TARGET:=mips-be-elf
endif
ifeq ($(ARCH),mipsel)
  HAL_TARGET:=mips-le-elf
endif
ifeq ($(ARCH),i386)
  HAL_TARGET:=i386-elf
endif
ifeq ($(ARCH),armeb)
  HAL_TARGET:=xscale-be-elf
endif
ifeq ($(ARCH),powerpc)
  HAL_TARGET:=powerpc-be-elf
endif

RT8188EU_AUTOLOAD:= \
	wlan

define KernelPackage/rt8188eu
  SUBMENU:=Wireless Drivers
  DEFAULT:=y if LINUX_2_6_BRCM |  LINUX_2_6_ARUBA |  LINUX_2_4_AR531X |  LINUX_2_6_XSCALE, m if ALL
  TITLE:=Driver for RT8188EU
  DESCRIPTION:=\
	This package contains a driver for the RT8188EU
  VERSION:=$(LINUX_VERSION)+$(PKG_VERSION)-$(BOARD)-$(PKG_RELEASE)
  FILES:= \
		$(PKG_BUILD_DIR)/ath/ath_hal.$(LINUX_KMOD_SUFFIX) \
		$(BUS_MODULES) \
		$(PKG_BUILD_DIR)/net80211/wlan*.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,50,$(RT8188EU_AUTOLOAD))
endef

define Build/Compile

endef

define Build/InstallDev

endef

define KernelPackage/rt8188eu/install

endef

