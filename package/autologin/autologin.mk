AUTOLOGIN_VERSION = 0.1
AUTOLOGIN_SOURCE =
AUTOLOGIN_SITE =
AUTOLOGIN_LICENSE = BSD-3-Clause
AUTOLOGIN_FILES = COPYING

define AUTOLOGIN_INSTALL_TARGET_CMDS

	@echo "=====> autologin without typing a user name or password <====="

	@if grep -Eq "^BR2_PACKAGE_AUTOLOGIN_WITHOUT_PASSWORD=y$\" ${BR2_CONFIG}; then \
		sed -i 's|^.*respawn:/sbin/getty.*|console::respawn:-/bin/sh|' ${TARGET_DIR}/etc/inittab; \
	else \
		cp -f $(TOPDIR)/package/busybox/inittab ${TARGET_DIR}/etc/inittab; \
	fi

endef

$(eval $(generic-package))

