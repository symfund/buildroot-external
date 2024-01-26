################################################################################
#
# airplay
#
################################################################################

AIRPLAY_VERSION = 9c44d2ed471664298d2d6cb8fe0504f03eb41272
AIRPLAY_SITE = https://github.com/FDH2/UxPlay.git
AIRPLAY_SITE_METHOD = git
AIRPLAY_LICENSE = GPL-3.0
AIRPLAY_LICENSE_FILES = LICENSE

AIRPLAY_DEPENDENCIES = host-cmake libplist libopenssl libcap avahi gstreamer1 gst1-plugins-base \
	gst1-plugins-good gst1-plugins-bad

AIRPLAY_CONF_OPTS = -DNO_X11_DEPS=ON

BR_NO_CHECK_HASH_FOR += $(AIRPLAY_SOURCE)

define AIRPLAY_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 0755 $(AIRPLAY_PKGDIR)S99airplay \
                $(TARGET_DIR)/etc/init.d/S99airplay
endef

$(eval $(cmake-package))
