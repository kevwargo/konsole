.PHONY: build

build:
	tar -caf konsole-src-worktree.tar.zst -C ../.. --exclude-vcs --exclude-vcs-ignores --exclude packaging .
	makepkg --force
