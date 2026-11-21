KONSOLE_VERSION := 26.08.3
SRC_TARBALL := konsole-$(KONSOLE_VERSION).tar.xz

.PHONY: build upstream-sync src-tarball

src-tarball:
	tar -caf $(SRC_TARBALL) -C ../.. \
		--exclude-vcs --exclude-vcs-ignores --exclude packaging \
		--transform="s|^\.|konsole-$(KONSOLE_VERSION)|" \
		.
	@sha256sum $(SRC_TARBALL)

build: src-tarball
	makepkg --force

upstream-sync:
	./upstream-sync.sh
