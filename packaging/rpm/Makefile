ARCH := $(shell uname -m)
KONSOLE_VERSION := 26.08.0
KONSOLE_RELEASE := 1
RPM_DIST := $(shell rpm --eval '%{?dist}')
KONSOLE_RPM_VERSION_ORIG := $(KONSOLE_VERSION)-1$(RPM_DIST)
KONSOLE_RPM_VERSION_NEW := $(KONSOLE_VERSION)-$(KONSOLE_RELEASE)$(RPM_DIST)

RPM_DEFINES := --define "_topdir $(PWD)"
RPMBUILD_DEFINES := $(RPM_DEFINES) \
	--define "konsole_version $(KONSOLE_VERSION)" \
	--define "konsole_release $(KONSOLE_RELEASE)"

.PHONY: init build install install-deps

init:
	dnf download --source konsole
	rpm $(RPM_DEFINES) -ivh konsole-$(KONSOLE_RPM_VERSION_ORIG).src.rpm

build:
	tar -caf $(PWD)/SOURCES/konsole-$(KONSOLE_VERSION).tar.xz \
		-C ../.. --exclude-vcs --exclude-vcs-ignores --exclude packaging \
		--transform="s|^\.|konsole-$(KONSOLE_VERSION)|" .
	rpmbuild $(RPMBUILD_DEFINES) --noclean --nodebuginfo -bb SPECS/konsole.spec

install:
	rpm -Uvh --replacepkgs --oldpackage \
		RPMS/$(ARCH)/konsole-$(KONSOLE_RPM_VERSION_NEW).$(ARCH).rpm \
		RPMS/$(ARCH)/konsole-part-$(KONSOLE_RPM_VERSION_NEW).$(ARCH).rpm

install-deps:
	dnf install 'cmake(KF6Bookmarks)' \
		'cmake(KF6ConfigWidgets)' \
		'cmake(KF6CoreAddons)' \
		'cmake(KF6Crash)' \
		'cmake(KF6DBusAddons)' \
		'cmake(KF6DocTools)' \
		'cmake(KF6GlobalAccel)' \
		'cmake(KF6GuiAddons)' \
		'cmake(KF6I18n)' \
		'cmake(KF6IconThemes)' \
		'cmake(KF6KIO)' \
		'cmake(KF6NewStuff)' \
		'cmake(KF6Notifications)' \
		'cmake(KF6NotifyConfig)' \
		'cmake(KF6Parts)' \
		'cmake(KF6Pty)' \
		'cmake(KF6Service)' \
		'cmake(KF6TextWidgets)' \
		'cmake(KF6WidgetsAddons)' \
		'cmake(KF6WindowSystem)' \
		'cmake(KF6XmlGui)' \
		'cmake(Qt6Core5Compat)' \
		'cmake(Qt6Multimedia)' \
		'cmake(libssh)' \
		'dbus-x11' \
		'extra-cmake-modules' \
		'kf6-rpm-macros' \
		'libappstream-glib' \
		'libicu-devel' \
		'xorg-x11-server-Xvfb'
