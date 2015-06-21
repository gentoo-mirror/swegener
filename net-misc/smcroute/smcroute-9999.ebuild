# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://github.com/troglobit/smcroute.git"

inherit git-2

DESCRIPTION="A static multicast route tool"
HOMEPAGE="http://troglobit.com/smcroute.html"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	default

	newinitd "${FILESDIR}"/smcroute.initd smcroute
}
