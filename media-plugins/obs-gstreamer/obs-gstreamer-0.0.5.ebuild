# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit meson multilib

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/fzwoch/obs-gstreamer.git"
	inherit git-r3
else
	SRC_URI="https://github.com/fzwoch/obs-gstreamer/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Feed GStreamer pipelines into OBS Studio"
HOMEPAGE="https://github.com/fzwoch/obs-gstreamer"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="media-video/obs-studio
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	sed -i -e "s:lib/obs-plugins:$(get_libdir)/obs-plugins:" meson.build || die
}
