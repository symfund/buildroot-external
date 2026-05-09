################################################################################
#
# airplay
#
# Integrated in Buildroot by Nuvoton 2023 twjiang@nuvoton.com
#
################################################################################

AIRPLAY_VERSION = 7fc5f4d9b969dbb703ca59eb47697ff51b8cb7a5
AIRPLAY_SITE = https://github.com/antimof/UxPlay.git
AIRPLAY_SITE_METHOD = git
AIRPLAY_LICENSE = GPL-3.0
AIRPLAY_LICENSE_FILES = LICENSE

AIRPLAY_DEPENDENCIES = host-cmake libplist libopenssl libcap avahi gstreamer1 gst1-plugins-base \
	gst1-plugins-good gst1-plugins-bad

AIRPLAY_CONF_OPTS = -DNO_X11_DEPS=ON

define AIRPLAY_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 0755 package/airplay/S70airplay \
                $(TARGET_DIR)/etc/init.d/S70airplay
endef

define AIRPLAY_REMOVE_UNEEDED_FILES
        $(RM) -r $(TARGET_DIR)/
endef

#AIRPLAY_TARGET_FINALIZE_HOOKS += AIRPLAY_REMOVE_UNEEDED_FILES

$(eval $(cmake-package))
