# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

EGIT_REPO_URI="https://github.com/wontfix-org/klemmbrett.git"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit git-r3 distutils-r1

DESCRIPTION="Easy clipboard management"
HOMEPAGE="https://github.com/wontfix-org/klemmbrett/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="dev-python/pygtk:2
	dev-python/pygobject:2
	dev-python/notify2
	dev-libs/keybinder:3"
