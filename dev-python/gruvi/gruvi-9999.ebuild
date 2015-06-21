# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{3,4}} )

EGIT_REPO_URI="git://github.com/geertj/gruvi.git"

inherit distutils-r1 git-r3

DESCRIPTION="Synchronous evented IO"
HOMEPAGE="https://github.com/geertj/gruvi"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-python/cffi-0.8
	>=dev-python/fibers-0.4
	>=dev-python/pyuv-1.1.0"
RDEPEND="${DEPEND}"
