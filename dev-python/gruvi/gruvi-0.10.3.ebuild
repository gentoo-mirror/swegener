# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Synchronous evented IO"
HOMEPAGE="https://github.com/geertj/gruvi"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/geertj/gruvi.git"
	inherit git-r3
else
	SRC_URI="https://github.com/geertj/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=">=dev-python/cffi-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/fibers-0.4[${PYTHON_USEDEP}]
	>=dev-python/pyuv-1.1.0[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
