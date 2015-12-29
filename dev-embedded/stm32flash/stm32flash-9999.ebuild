# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit toolchain-funcs

DESCRIPTION="Open source flash program for STM32 using the ST serial bootloader"
HOMEPAGE="http://sourceforge.net/projects/stm32flash/"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://git.code.sf.net/p/stm32flash/code"
	inherit git-r3
else
	SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}"/${PN}
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" AR="$(tc-getAR)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
