# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_P="wtf-server-${PV/_alpha/-dev-r}"

DESCRIPTION="WSGI Tackling Framework (WTF)"
HOMEPAGE="http://opensource.perlig.de/wtf/"
SRC_URI="
	http://storage.perlig.de/wtf/${MY_P}.tar.bz2
	http://storage.perlig.de/wtf/dev/${MY_P}.tar.bz2
	http://storage.perlig.de/wtf/archive/${MY_P}.tar.bz2
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

DOCS=( README.rst docs/wtf.conf.sample )

src_install() {
	distutils-r1_src_install

	rm -rf "${D}"/usr/share/doc/wtf
	use doc && dohtml -r docs/{apidoc,userdoc}
}
