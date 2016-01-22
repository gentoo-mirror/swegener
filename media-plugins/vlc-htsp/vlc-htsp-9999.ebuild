# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

EGIT_REPO_URI="git://github.com/BtbN/vlc-htsp-plugin.git"

inherit git-r3 toolchain-funcs

DESCRIPTION="Plugin for VLC to access TVHeadend via HTSP"
HOMEPAGE="https://github.com/BtbN/vlc-htsp-plugin"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=media-video/vlc-2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="README"

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		CXX="$(tc-getCXX)" \
		CFLAGS="${CFLAGS} -std=gnu99 -I." \
		CXXFLAGS="${CXXFLAGS} -std=gnu++0x -I." \
		LDFLAGS="${LDFLAGS} -Wl,-no-undefined,-z,defs"
}
