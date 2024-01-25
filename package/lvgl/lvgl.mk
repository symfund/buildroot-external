################################################################################
#
# lvgl
#
################################################################################

LVGL_VERSION = adf2c4490e17a1b9ec1902cc412a24b3b8235c8e
LVGL_SITE = https://github.com/lvgl/lv_port_linux_frame_buffer.git
LVGL_SITE_METHOD = git
LVGL_GIT_SUBMODULES = YES
LVGL_INSTALL_STAGING = YES
LVGL_LICENSE = MIT
LVGL_LICENSE_FILES = LICENSE

LVGL_DEPENDENCIES = host-cmake wayland wayland-protocols

#LVGL_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF

define LVGL_GENERATE_WAYLAND_PROTOCOLS_CLIENT_FILES
	mkdir -p $(@D)/lv_drivers/wayland/protocols && \
	\
	$(HOST_DIR)/bin/wayland-scanner private-code \
	$(STAGING_DIR)/usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml \
	$(@D)/lv_drivers/wayland/protocols/xdg-shell-protocol.c && \
	\
	$(HOST_DIR)/bin/wayland-scanner client-header \
	$(STAGING_DIR)/usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml \
	$(@D)/lv_drivers/wayland/protocols/xdg-shell-client-protocol.h
endef
LVGL_PRE_CONFIGURE_HOOKS += LVGL_GENERATE_WAYLAND_PROTOCOLS_CLIENT_FILES

define LVGL_REMOVE_HEADER_FILES
        rm -Rf $(TARGET_DIR)/usr/include/lvgl
endef
LVGL_POST_INSTALL_TARGET_HOOKS += LVGL_REMOVE_HEADER_FILES

$(eval $(cmake-package))
