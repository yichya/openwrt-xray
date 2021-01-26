#!/bin/sh
version=$1
sha=$(curl "https://codeload.github.com/XTLS/xray-core/tar.gz/v{$version}" | sha256sum - | awk '{print $1'})
sed "s/^PKG_VERSION.*/PKG_VERSION:=${version}/g" Makefile > Makefile1
sed "s/^PKG_HASH.*/PKG_HASH:=${sha}/g" Makefile1 > Makefile2
rm Makefile1 Makefile
mv Makefile2 Makefile
