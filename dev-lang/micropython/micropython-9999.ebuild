# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DESCRIPTION="Micro Python"
HOMEPAGE="http://www.micropython.org/"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://github.com/micropython/micropython.git"
	inherit git-r3
else
	SRC_URI="https://github.com/micropython/micropython/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

QA_EXECSTACK="usr/bin/micropython"

src_compile() {
	emake -C unix deplibs CROSS_COMPILE=${CHOST}- CWARN="" COPT="${CFLAGS}" LDFLAGS="${LDFLAGS}"
	emake -C unix micropython CROSS_COMPILE=${CHOST}- CWARN="" COPT="${CFLAGS}" STRIP="true"
}

src_install() {
	dobin unix/micropython
}
