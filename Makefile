include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PackageCount
PackageCount_FILES = Tweak.xm PackageHandler.m

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
