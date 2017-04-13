# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit cmake-utils

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
IUSE=""

RDEPEND="virtual/libusb:1
	>=dev-libs/glib-2.32.0:2
	x11-libs/gtk+:3"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		-DSTLINK_UDEV_RULES_DIR="/lib/udev/rules.d"
	)

	cmake-utils_src_configure
}
