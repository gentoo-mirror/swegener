# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{3,4}} )

EGIT_REPO_URI="git://github.com/saghul/pyuv.git"

inherit distutils-r1 git-r3

DESCRIPTION="Python interface for libuv"
HOMEPAGE="https://github.com/saghul/pyuv"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
