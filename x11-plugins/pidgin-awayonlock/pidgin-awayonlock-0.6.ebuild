# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit cmake

MY_P="${P#pidgin-}"

DESCRIPTION="Change your Pidgin status when the screensaver gets activated"
HOMEPAGE="https://github.com/costela/awayonlock"
SRC_URI="https://github.com/costela/awayonlock/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-im/pidgin-2.4.0
	dev-libs/glib:2
	dev-libs/dbus-glib"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	default
	cmake_src_prepare
	sed -i \
		-e "/#define AWAYONLOCK_VERSION / s/\"[^\"]\\+\"/\"${PVR}\"/" \
		awayonlock.c
}
