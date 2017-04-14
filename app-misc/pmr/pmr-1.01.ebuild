# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit toolchain-funcs

DESCRIPTION="displays the data bandwidth and total number of bytes passing through a pipe"
HOMEPAGE="http://zakalwe.fi/~shd/foss/pmr/"
SRC_URI="http://zakalwe.fi/~shd/foss/pmr/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	dobin pmr
	doman doc/pmr.1
	dodoc ChangeLog doc/index.html
}
