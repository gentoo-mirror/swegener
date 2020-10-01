# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit toolchain-funcs

DESCRIPTION="displays the data bandwidth and total number of bytes passing through a pipe"
HOMEPAGE="https://zakalwe.fi/~shd/foss/pmr/"
SRC_URI="https://zakalwe.fi/~shd/foss/pmr/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=( AUTHORS ChangeLog doc/index.html )

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	dobin pmr
	doman doc/pmr.1
	einstalldocs
}
