# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit base linux-mod

DESCRIPTION="/dev/crypto kernel driver"
HOMEPAGE="http://cryptodev-linux.org/"
SRC_URI="http://download.gna.org/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

MODULE_NAMES="cryptodev()"
BUILD_TARGETS="build"
BUILD_PARAMS="KERNEL_DIR=\"\${KV_OUT_DIR}\""

src_install() {
	linux-mod_src_install

	insinto /usr/include/crypto
	doins crypto/cryptodev.h
}
