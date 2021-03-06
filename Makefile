include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TapToWakeCC
$(BUNDLE_NAME)_BUNDLE_EXTENSION = bundle
$(BUNDLE_NAME)_CFLAGS =  -fobjc-arc
$(BUNDLE_NAME)_PRIVATE_FRAMEWORKS = ControlCenterUIKit 
$(BUNDLE_NAME)_FILES = $(wildcard *.xm)
$(BUNDLE_NAME)_INSTALL_PATH = /Library/ControlCenter/Bundles/

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/bundle.mk
SUBPROJECTS += hooking
include $(THEOS_MAKE_PATH)/aggregate.mk

