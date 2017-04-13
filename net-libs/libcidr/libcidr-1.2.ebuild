# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit toolchain-funcs

DESCRIPTION="IP CIDR address manipulation"
HOMEPAGE="http://www.over-yonder.net/~fullermd/projects/libcidr/"
SRC_URI="http://www.over-yonder.net/~fullermd/projects/libcidr/${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	sed \
		-i \
		-e "s:%%DOCDIR%%:/usr/share/doc/${PF}:" \
		docs/libcidr.3 \
		|| die
}

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		C_FLAGS="${CFLAGS} -I${S}/include"
}

src_install() {
	emake \
		PREFIX="${D}/usr" \
		CIDR_MANDIR="${T}" \
		CIDR_DOCDIR="${T}" \
		CIDR_EXDIR="${T}" \
		install

	doman docs/libcidr.3
	dodoc README docs/reference/libcidr.txt
	dohtml docs/reference/{libcidr-big.html,codelibrary-html.css}
}
