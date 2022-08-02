# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake

MY_P="${P#pidgin-}"

DESCRIPTION="Change your Pidgin status when the screensaver gets activated"
HOMEPAGE="http://costela.net/projects/awayonlock/"
SRC_URI="http://costela.net/files/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-im/pidgin"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	default
	cmake_src_prepare
	sed -i \
		-e "/#define AWAYONLOCK_VERSION / s/\"[^\"]\\+\"/\"${PVR}\"/" \
		awayonlock.c
}
