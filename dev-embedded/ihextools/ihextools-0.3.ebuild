# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit toolchain-funcs

COMMIT="17c1d1c9d338dfd197042ed315897c479bf70662"

DESCRIPTION="Tools for Intel HEX"
HOMEPAGE="https://ihextools.sourceforge.io/"
SRC_URI="https://sourceforge.net/code-snapshots/hg/${PN:0:1}/${PN:0:2}/${PN}/code/${PN}-code-${COMMIT}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${PN}-code-${COMMIT}"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	dobin bin2ihex ihex2bin
}
