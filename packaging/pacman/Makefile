KONSOLE_VERSION := 26.08.0

.PHONY: build

build:
	tar -caf konsole-$(KONSOLE_VERSION).tar.xz -C ../.. \
		--exclude-vcs --exclude-vcs-ignores --exclude packaging \
		--transform="s|^\.|konsole-$(KONSOLE_VERSION)|" \
		.
	makepkg --force
