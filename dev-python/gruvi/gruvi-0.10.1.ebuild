# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{3,4}} )

inherit distutils-r1

DESCRIPTION="Synchronous evented IO"
HOMEPAGE="https://github.com/geertj/gruvi"
SRC_URI="https://github.com/geertj/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/cffi-0.8
	>=dev-python/fibers-0.4
	dev-python/pyuv"
RDEPEND="${DEPEND}"
