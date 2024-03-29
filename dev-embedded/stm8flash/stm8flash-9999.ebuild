# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit toolchain-funcs

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/vdudouyt/stm8flash.git"
	inherit git-r3
else
	die "no releases yet"
fi

DESCRIPTION="Link programmer for STM8 devices"
HOMEPAGE="https://github.com/vdudouyt/stm8flash"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_compile(){
	local PKG_CONFIG="$(tc-getPKG_CONFIG)"
	local CFLAGS="${CFLAGS} --std=gnu99 $(${PKG_CONFIG} --cflags libusb-1.0)"
	local LIBS="${LDFLAGS} $(${PKG_CONFIG} --libs libusb-1.0)"

	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LIBS="${LIBS}"
}

src_install() {
	dobin stm8flash
	einstalldocs
}
