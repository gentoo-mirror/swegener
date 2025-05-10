# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

EGIT_REPO_URI="https://github.com/wontfix-org/klemmbrett.git"

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{11..13} )

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

src_install() {
	distutils-r1_src_install

	insinto /etc
	doins conf/klemmbrett.conf
	insinto /etc/xdg/autostart
	doins conf/klemmbrett-autostart.desktop
	insinto /usr/share/klemmbrett
	doins data/*.svg
}
