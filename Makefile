INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_DEVICE_IP=192.168.1.15
THEOS_DEVICE_PORT=22

include ~/theos/makefiles/common.mk

TWEAK_NAME = SSPD

SSPD_FILES = Tweak.x
SSPD_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += sspd
include $(THEOS_MAKE_PATH)/aggregate.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/DEBIAN$(ECHO_END)
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/Application\ Support/SamsungPowerDown$(ECHO_END)
	$(ECHO_NOTHING)cp ./images/* $(THEOS_STAGING_DIR)/Library/Application\ Support/SamsungPowerDown/$(ECHO_END)
