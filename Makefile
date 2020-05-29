include $(THEOS)/makefiles/common.mk

ARCHS = arm64

APPLICATION_NAME = testchatspeaker
testchatspeaker_FILES = main.m XXAppDelegate.m XXRootViewController.m
testchatspeaker_FRAMEWORKS = UIKit CoreGraphics Foundation

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"testchatspeaker\"" || true
