include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = sspd

sspd_FILES = SSPD.m
sspd_INSTALL_PATH = /Library/PreferenceBundles
sspd_FRAMEWORKS = UIKit
sspd_PRIVATE_FRAMEWORKS = Preferences
sspd_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/sspd.plist$(ECHO_END)
