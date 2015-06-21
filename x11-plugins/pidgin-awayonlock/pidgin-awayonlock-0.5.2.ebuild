# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="4"

inherit cmake-utils

MY_P="${P#pidgin-}"

DESCRIPTION="Change your Pidgin status when the screensaver gets activated"
HOMEPAGE="http://costela.net/projects/awayonlock/"
SRC_URI="http://costela.net/files/${MY_P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-im/pidgin"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	default
	sed -i \
		-e "/#define AWAYONLOCK_VERSION / s/\"[^\"]\\+\"/\"${PVR}\"/" \
		awayonlock.c
}
