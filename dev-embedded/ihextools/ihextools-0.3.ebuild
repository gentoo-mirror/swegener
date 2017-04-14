# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit toolchain-funcs

DESCRIPTION="Tools for Intel HEX"
HOMEPAGE="https://bitbucket.org/martin_scharrer/ihextools"
SRC_URI="https://bitbucket.org/martin_scharrer/ihextools/downloads/${PN}-v${PV}-src.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	dobin bin2ihex ihex2bin
}
