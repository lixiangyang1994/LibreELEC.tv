# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="wayland"
PKG_VERSION="1.19.0"
PKG_SHA256="baccd902300d354581cd5ad3cc49daa4921d55fb416a5883e218750fef166d15"
PKG_LICENSE="OSS"
PKG_SITE="https://wayland.freedesktop.org/"
PKG_URL="https://wayland.freedesktop.org/releases/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_HOST="libffi:host expat:host libxml2:host"
PKG_DEPENDS_TARGET="toolchain wayland:host libffi expat libxml2"
PKG_LONGDESC="a display server protocol"

PKG_MESON_OPTS_HOST="-Dlibraries=false \
                     -Dscanner=true \
                     -Ddocumentation=false \
                     -Ddtd_validation=false"

PKG_MESON_OPTS_TARGET="-Dlibraries=true \
                       -Dscanner=false \
                       -Ddocumentation=false \
                       -Ddtd_validation=false"

pre_configure_target() {
  # wayland does not build with NDEBUG (requires assert for tests)
  export TARGET_CFLAGS=$(echo ${TARGET_CFLAGS} | sed -e "s|-DNDEBUG||g")
}

post_makeinstall_host() {
  cp ${TOOLCHAIN}/lib/pkgconfig/wayland-scanner.pc ${SYSROOT_PREFIX}/usr/lib/pkgconfig/
}
