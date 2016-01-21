# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit autotools

DESCRIPTION="stm32 discovery line linux programmer"
HOMEPAGE="https://github.com/texane/stlink"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://github.com/texane/stlink.git"
	inherit git-r3
else
	SRC_URI="https://github.com/texane/stlink/archive/${PV}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="as-is"
SLOT="0"
IUSE="gtk"

RDEPEND="virtual/libusb:1
	>=dev-libs/glib-2.32.0:2
	gtk? ( x11-libs/gtk+:3 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	eautoreconf || die
}

src_configure() {
	econf $(use_with gtk)
}
