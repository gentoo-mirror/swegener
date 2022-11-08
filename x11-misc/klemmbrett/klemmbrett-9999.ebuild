# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

EGIT_REPO_URI="https://github.com/wontfix-org/klemmbrett.git"

PYTHON_COMPAT=( python3_{6..10} )

inherit git-r3 distutils-r1

DESCRIPTION="Easy clipboard management"
HOMEPAGE="https://github.com/wontfix-org/klemmbrett/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="x11-libs/gtk+:3[introspection,X]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-python/notify2
	dev-libs/keybinder:3"
