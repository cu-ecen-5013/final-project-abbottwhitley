##############################################################
#
# AESD-FINAL
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
#AESD_FINAL_VERSION=317c618b23147c89c94106ee0bb3fa8830ffc27d
AESD_FINAL_VERSION=1

#AESD_FINAL_SITE = git@github.com:cu-ecen-5013/opencv-monitoring-system.git
#AESD_FINAL_SITE_METHOD = git
#AESD_FINAL_GIT_SUBMODULES = YES

AESD_FINAL_SITE = $(TOPDIR)/../../opencv-monitoring-system
AESD_FINAL_SITE_METHOD = local

define AESD_FINAL_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/opencv all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/camera_app/cpp all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/controller_app/cpp all
endef


# TODO add your writer, finder and tester utilities/scripts to the installation steps below
define AESD_FINAL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(TOPDIR)/../base_external/rootfs_overlay/network/interfaces ${TARGET_DIR}/etc/network
	$(INSTALL) -m 0755 package/busybox/S10mdev ${TARGET_DIR}/etc/init.d/S10mdev
	$(INSTALL) -m 0755 package/busybox/mdev.conf ${TARGET_DIR}/etc/mdev.conf
	# Face detection
	$(INSTALL) -d 0755 $(@D)/opencv $(TARGET_DIR)/usr/bin/opencv
	$(INSTALL) -d 0755 $(@D)/opencv/xml $(TARGET_DIR)/usr/bin/opencv/xml
	$(INSTALL) -m 0755 $(@D)/opencv/xml/* $(TARGET_DIR)/usr/bin/opencv/xml
	$(INSTALL) -m 0755 $(@D)/opencv/facedetect $(TARGET_DIR)/usr/bin/opencv
	# ~~~ Camera Applications ~~~
	# Video Streaming Server (Python / HTML)
	$(INSTALL) -d 0755 $(@D)/camera_app/python/ $(TARGET_DIR)/usr/bin/opencv/camera_app/python
        $(INSTALL) -d 0755 $(@D)/camera_app/python/templates $(TARGET_DIR)/usr/bin/opencv/camera_app/python/templates
        $(INSTALL) -m 0755 $(@D)/camera_app/python/main.py $(TARGET_DIR)/usr/bin/opencv/camera_app/python
        $(INSTALL) -m 0755 $(@D)/camera_app/python/camera.py $(TARGET_DIR)/usr/bin/opencv/camera_app/python
        $(INSTALL) -m 0755 $(@D)/camera_app/python/templates/index.html $(TARGET_DIR)/usr/bin/opencv/camera_app/python/templates
	# Video Streaming Server (C++)
	$(INSTALL) -d 0755 $(@D)/camera_app/cpp/ $(TARGET_DIR)/usr/bin/opencv/camera_app/cpp
	$(INSTALL) -m 0755 $(@D)/camera_app/cpp/server $(TARGET_DIR)/usr/bin/opencv/camera_app/cpp

	# ~~~ Controller Applications ~~~
        # Video Streaming Server (Python / HTML)
        $(INSTALL) -d 0755 $(@D)/controller_app/python/ $(TARGET_DIR)/usr/bin/opencv/controller_app/python
        $(INSTALL) -d 0755 $(@D)/controller_app/python/templates $(TARGET_DIR)/usr/bin/opencv/controller_app/python/templates
        $(INSTALL) -m 0755 $(@D)/controller_app/python/main.py $(TARGET_DIR)/usr/bin/opencv/controller_app/python
        $(INSTALL) -m 0755 $(@D)/controller_app/python/camera.py $(TARGET_DIR)/usr/bin/opencv/controller_app/python
        $(INSTALL) -m 0755 $(@D)/controller_app/python/templates/index.html $(TARGET_DIR)/usr/bin/opencv/controller_app/python/templates
	# Video Streaming Client (C++)
	$(INSTALL) -d 0755 $(@D)/controller_app/cpp/ $(TARGET_DIR)/usr/bin/opencv/controller_app/cpp
	$(INSTALL) -m 0755 $(@D)/controller_app/cpp/client $(TARGET_DIR)/usr/bin/opencv/controller_app/cpp

endef

$(eval $(generic-package))
