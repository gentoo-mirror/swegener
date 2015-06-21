# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"

inherit linux-info eutils

DESCRIPTION="A linux trace/probe tool"
HOMEPAGE="http://sourceware.org/systemtap/"
if [[ ${PV} = *_p* ]] # is this a snaphot?
then
	# see configure.ac to get the version of the snapshot
	SRC_URI="http://www.sourceware.org/${PN}/ftp/snapshots/${PN}-${PV/*_p/}.tar.bz2
		http://titan.stealer.net/~sven/distfiles/${PN}/${PN}-${PV/*_p/}.tar.bz2" # upstream only keeps four snapshot distfiles around
	S="${WORKDIR}"/src
else
	SRC_URI="http://www.sourceware.org/${PN}/ftp/releases/${P}.tar.gz"
	# use default S for releases
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sqlite"

DEPEND=">=dev-libs/elfutils-0.142
	sys-libs/libcap
	sqlite? ( =dev-db/sqlite-3* )"
RDEPEND="${DEPEND}
	virtual/linux-sources"

CONFIG_CHECK="~KPROBES ~RELAY ~DEBUG_FS"
ERROR_KPROBES="${PN} requires support for KProbes Instrumentation (KPROBES) - this can be enabled in 'Instrumentation Support -> Kprobes'."
ERROR_RELAY="${PN} works with support for user space relay support (RELAY) - this can be enabled in 'General setup -> Kernel->user space relay support (formerly relayfs)'."
ERROR_DEBUG_FS="${PN} works best with support for Debug Filesystem (DEBUG_FS) - this can be enabled in 'Kernel hacking -> Debug Filesystem'."

src_prepare() {
	epatch "${FILESDIR}"/${P}-unused-parameters.patch
}

src_configure() {
	econf \
		--docdir=/usr/share/doc/${PF} \
		--without-rpm \
		--disable-server \
		--disable-docs \
		--disable-refdocs \
		--disable-grapher \
		$(use_enable sqlite) \
		|| die "econf failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "make install failed"
	dodoc AUTHORS HACKING NEWS README
}
