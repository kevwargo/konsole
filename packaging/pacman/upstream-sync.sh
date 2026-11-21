#!/bin/bash

if [ -d upstream ]; then
    git -C upstream pull
else
    git clone https://gitlab.archlinux.org/archlinux/packaging/packages/konsole upstream
fi

cp -fv upstream/PKGBUILD .
