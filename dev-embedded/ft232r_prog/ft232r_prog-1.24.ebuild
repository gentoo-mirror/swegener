# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

DESCRIPTION="Tool for reconfiguring FTDI FT232R chips"
HOMEPAGE="http://rtr.ca/ft232r/"
SRC_URI="http://rtr.ca/ft232r/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-embedded/libftdi"
RDEPEND="${DEPEND}"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS} -lftdi"
}

src_install() {
	dobin ft232r_prog
	dodoc Changelog
}
