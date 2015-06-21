# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"

inherit unpacker

MY_P="${PN}_${PV}-0"

QA_PRESTRIPPED="/usr/bin/moltosenso_network_manager_iron"

DESCRIPTION="moltosensor Network Manager"
HOMEPAGE="http://www.moltosenso.com/"
SRC_URI="
	amd64? ( http://dl.dropbox.com/u/67378917/${MY_P}_amd64.deb )
	x86? ( http://dl.dropbox.com/u/67378917/${MY_P}_i386.deb )
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	true
}

src_install() {
	cd "${D}"
	unpacker
	rm -f control.tar.gz data.tar.gz debian-binary ${A}
}
