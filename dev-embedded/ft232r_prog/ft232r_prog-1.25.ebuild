# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit toolchain-funcs

DESCRIPTION="Tool for reconfiguring FTDI FT232R chips"
HOMEPAGE="https://rtr.ca/ft232r/"
SRC_URI="https://rtr.ca/ft232r/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-embedded/libftdi:0="
RDEPEND="${DEPEND}"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS} -lftdi"
}

src_install() {
	dobin ft232r_prog
}
