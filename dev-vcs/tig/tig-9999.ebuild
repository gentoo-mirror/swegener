# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="5"

EGIT_REPO_URI="git://github.com/jonas/tig.git"

inherit bash-completion-r1 git-r3 autotools

DESCRIPTION="Tig: text mode interface for git"
HOMEPAGE="http://jonas.nitro.dk/tig/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}
	dev-vcs/git"
DEPEND="${DEPEND}
	app-text/xmlto
	app-text/asciidoc"

src_prepare() {
	eautoreconf
}

src_compile() {
	default

	emake doc-man doc-html
}

src_install() {
	emake install install-doc-man DESTDIR="${D}"

	dodoc NEWS.adoc README.adoc
	dohtml doc/manual.html
	dobashcomp contrib/tig-completion.bash
}
