##############################################################
#
# CMAKE_TEST
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
#CMAKE_TEST_VERSION=244846f503a54dd70331349375ef4d03cb406bad
CMAKE_TEST_VERSION=1
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
#CMAKE_TEST_SITE = git@github.com:cu-ecen-5013/assignment-3-abbottwhitley.git
CMAKE_TEST_SITE = $(TOPDIR)/../../assignment-3-abbottwhitley/tmp/CMAKE_Tutorial
CMAKE_TEST_SITE_METHOD = local
#CMAKE_TEST_GIT_SUBMODULES = YES
CMAKE_TEST_INSTALL_STAGING = NO
CMAKE_TEST_INSTALL_TARGET = NO
#CMAKE_CONF_OPT = -DBUILD_DEMOS=ON
#CMAKE_DEPENDENCIES = libglib2 host-pkg-config

#define CMAKE_TEST_BUILD_CMDS
#	cmake $(@D)/tmp/CMAKE_Tutorial all
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/opencvcam all
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/opencv all
#endef


# TODO add your writer, finder and tester utilities/scripts to the installation steps below
#define CMAKE_TEST_INSTALL_TARGET_CMDS
#	$(INSTALL) -d 0755 $(D)/tmp/CMAKE_Tutorial $(TARGET_DIR)/usr/bin/CMAKE_Tutorial
#	$(INSTALL) -m 0755 $(D)/Tutorial $(TARGET_DIR)/usr/bin/CMAKE_Tutorial
#endef


$(eval $(cmake-package))
