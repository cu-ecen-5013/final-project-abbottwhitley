##############################################################
#
# AESD-FINAL
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_FINAL_VERSION=244846f503a54dd70331349375ef4d03cb406bad
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_FINAL_SITE = git@github.com:cu-ecen-5013/assignment-3-abbottwhitley.git
AESD_FINAL_SITE_METHOD = git
AESD_FINAL_GIT_SUBMODULES = YES

#PKG_CONFIG_PATH=$(TOPDIR)/output/build/opencv3-3.4.13/buildroot-build/unix-install/
#LD_LIBRARY_PATH=$(TOPDIR)/output/build/opencv3-3.4.13/buildroot-build/lib

define AESD_FINAL_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/opencvcam all
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/opencv all
endef


# TODO add your writer, finder and tester utilities/scripts to the installation steps below
define AESD_FINAL_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/usr/bin/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/usr/bin/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/tester.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesdsocket $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -m 0755 $(TOPDIR)/../base_external/rootfs_overlay/network/interfaces ${TARGET_DIR}/etc/network
	$(INSTALL) -m 0755 package/busybox/S10mdev ${TARGET_DIR}/etc/init.d/S10mdev
	$(INSTALL) -m 0755 package/busybox/mdev.conf ${TARGET_DIR}/etc/mdev.conf
        $(INSTALL) -m 0755 $(@D)/opencvcam/capture $(TARGET_DIR)/usr/bin/
#	$(INSTALL) -m 0755 $(@D)/opencv/facedetect $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
