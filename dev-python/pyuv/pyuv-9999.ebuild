# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=( python3_{8..11} )

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

PATCHES=(
	"${FILESDIR}"/pyuv-utf8.patch
	"${FILESDIR}"/pyuv-python-3.10.patch
)

src_configure() {
	cat >>setup.cfg <<-EOF

		[build_ext]
		use_system_libuv=1
	EOF
}
