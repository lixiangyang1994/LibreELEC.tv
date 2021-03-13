# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="ti-firmware"
PKG_VERSION="5d28a783ae8bfa7ccd9362601db57e193c7bc9c0"
PKG_SHA256="0ba4f0afcffb6903a5e22664853b4fa03b7efa73aa587fa10c10515ec8f07190"
PKG_LICENSE="TI"
PKG_SITE="https://github.com/LibreELEC/ti-firmware"
PKG_URL="https://github.com/LibreELEC/ti-firmware/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Texas Instruments firmware used with iMX6 devices in LibreELEC"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_firmware_dir)
    cp -R ${PKG_BUILD}/ti-connectivity ${INSTALL}/$(get_full_firmware_dir)
}
