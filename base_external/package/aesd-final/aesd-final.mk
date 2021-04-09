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

AESD_FINAL_SITE = $(TOPDIR)/../../FINAL/opencv-monitoring-system
AESD_FINAL_SITE_METHOD = local

define AESD_FINAL_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/opencvcam all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/opencv all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/opencv_stream/server all
endef


# TODO add your writer, finder and tester utilities/scripts to the installation steps below
define AESD_FINAL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(TOPDIR)/../base_external/rootfs_overlay/network/interfaces ${TARGET_DIR}/etc/network
	$(INSTALL) -m 0755 package/busybox/S10mdev ${TARGET_DIR}/etc/init.d/S10mdev
	$(INSTALL) -m 0755 package/busybox/mdev.conf ${TARGET_DIR}/etc/mdev.conf
	$(INSTALL) -d 0755 $(@D)/opencv $(TARGET_DIR)/usr/bin/opencv
	$(INSTALL) -d 0755 $(@D)/opencv/xml $(TARGET_DIR)/usr/bin/opencv/xml
        $(INSTALL) -m 0755 $(@D)/opencvcam/capture $(TARGET_DIR)/usr/bin/opencv
	$(INSTALL) -m 0755 $(@D)/opencv/xml/* $(TARGET_DIR)/usr/bin/opencv/xml
	$(INSTALL) -m 0755 $(@D)/opencv/facedetect $(TARGET_DIR)/usr/bin/opencv
	$(INSTALL) -m 0755 $(@D)/opencv_stream/server/server $(TARGET_DIR)/usr/bin/opencv
endef

$(eval $(generic-package))
