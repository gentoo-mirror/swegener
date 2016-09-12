# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_P="${P/_alpha/-dev-r}"

DESCRIPTION="Template Data Interface (TDI)"
HOMEPAGE="http://opensource.perlig.de/tdi/"
SRC_URI="
	http://storage.perlig.de/tdi/${MY_P}.tar.bz2
	http://storage.perlig.de/tdi/dev/${MY_P}.tar.bz2
	http://storage.perlig.de/tdi/archive/${MY_P}.tar.bz2
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

DOCS=( README.rst )

src_install() {
	distutils-r1_src_install

	rm -rf "${D}"/usr/share/doc/tdi
	use doc && dohtml -r docs/{apidoc,userdoc}
}
