# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.4"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils eutils

DESCRIPTION="Log analysis tool for systems administrators"
HOMEPAGE="http://crunchtools.com/software/petit/"
SRC_URI="http://crunchtools.com/wp-content/files/${PN}/${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}/src

src_prepare() {
	ln -s ../build/distutils/setup.py setup.py
	epatch "${FILESDIR}"/${P}-setup.patch
}
