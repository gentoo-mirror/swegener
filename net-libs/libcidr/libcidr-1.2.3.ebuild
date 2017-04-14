# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit toolchain-funcs

DESCRIPTION="IP CIDR address manipulation"
HOMEPAGE="http://www.over-yonder.net/~fullermd/projects/libcidr/"
SRC_URI="http://www.over-yonder.net/~fullermd/projects/libcidr/${P}.tar.xz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

emake_with_options() {
	emake \
		CC="$(tc-getCC)" \
		C_FLAGS="${CFLAGS}" \
		PREFIX="${EPREFIX}/usr" \
		CIDR_LIBDIR="${EPREFIX}/usr/$(get_libdir)" \
		CIDR_DOCDIR="${EPREFIX}/usr/share/doc/${PF}" \
		CIDR_EXDIR="${EPREFIX}/usr/share/doc/${PF}/examples" \
		CIDR_MANDIR="${EPREFIX}/usr/share/man" \
		"${@}"
}

src_compile() {
	emake_with_options
}

src_install() {
	emake_with_options install DESTDIR="${D}"
}
