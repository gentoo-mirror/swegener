# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit distutils-r1

DESCRIPTION="Python interface for libuv"
HOMEPAGE="https://github.com/saghul/pyuv"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/saghul/pyuv.git"
	inherit git-r3
else
	SRC_URI="https://github.com/saghul/${PN}/archive/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}"/${PN}-${P}
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-libs/libuv"
RDEPEND="${DEPEND}"

src_configure() {
	cat >>setup.cfg <<-EOF

		[build_ext]
		use-system-libuv=1
	EOF
}
