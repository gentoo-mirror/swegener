# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Lightweight cooperative microthreads for Python"
HOMEPAGE="https://github.com/saghul/python-fibers"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/saghul/python-fibers.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}"/python-${PN}-${P}
	inherit git-r3
else
	SRC_URI="https://github.com/saghul/python-fibers/archive/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/python-${PN}-${P}
