ARCH := $(shell uname -m)
KONSOLE_VERSION := 26.04.3
KONSOLE_RELEASE := 2
RPM_DIST := $(shell rpm --eval '%{?dist}')
KONSOLE_RPM_VERSION_ORIG := $(KONSOLE_VERSION)-1$(RPM_DIST)
KONSOLE_RPM_VERSION_NEW := $(KONSOLE_VERSION)-$(KONSOLE_RELEASE)$(RPM_DIST)

RPM_DEFINES := --define "_topdir $(PWD)"
RPMBUILD_DEFINES := $(RPM_DEFINES) --define "konsole_version $(KONSOLE_VERSION)" --define "konsole_release $(KONSOLE_RELEASE)"

.PHONY: init build install

init:
	dnf download --source konsole
	rpm $(RPM_DEFINES) -ivh konsole-$(KONSOLE_RPM_VERSION_ORIG).src.rpm

build:
	tar -caf $(PWD)/SOURCES/konsole-$(KONSOLE_VERSION).tar.xz \
		-C ../.. --exclude-vcs --exclude-vcs-ignores --exclude packaging \
		--transform="s|^\.|konsole-$(KONSOLE_VERSION)|" .
	rpmbuild $(RPMBUILD_DEFINES) --noclean --nodebuginfo -bb SPECS/konsole.spec

install:
	dnf install --allow-downgrade \
		RPMS/$(ARCH)/konsole-$(KONSOLE_RPM_VERSION_NEW).$(ARCH).rpm \
		RPMS/$(ARCH)/konsole-part-$(KONSOLE_RPM_VERSION_NEW).$(ARCH).rpm
