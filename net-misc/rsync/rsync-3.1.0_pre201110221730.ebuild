# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils flag-o-matic

MY_PRE="${PV#*_pre}"
MY_P="${PN}-HEAD-${MY_PRE:0:8}-${MY_PRE:8:12}GMT"

DESCRIPTION="File transfer program to keep remote files into sync"
HOMEPAGE="http://rsync.samba.org/"
SRC_URI="http://rsync.samba.org/ftp/rsync/nightly/${MY_P}.tar.gz
	http://titan.stealer.net/~sven/distfiles/rsync/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="acl iconv ipv6 static xattr"

DEPEND=">=dev-libs/popt-1.5
	acl? ( virtual/acl )
	xattr? ( kernel_linux? ( sys-apps/attr ) )
	iconv? ( virtual/libiconv )"

S=${WORKDIR}/${MY_P}

src_compile() {
	use static && append-ldflags -static
	econf \
		--without-included-popt \
		$(use_enable acl acl-support) \
		$(use_enable xattr xattr-support) \
		$(use_enable ipv6) \
		$(use_enable iconv) \
		--with-rsyncd-conf=/etc/rsyncd.conf \
		|| die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	newconfd "${FILESDIR}"/rsyncd.conf.d rsyncd
	newinitd "${FILESDIR}"/rsyncd.init.d rsyncd || die
	dodoc NEWS OLDNEWS README TODO tech_report.tex
	insinto /etc
	doins "${FILESDIR}"/rsyncd.conf || die

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/rsyncd.logrotate rsyncd

	insinto /etc/xinetd.d
	newins "${FILESDIR}"/rsyncd.xinetd rsyncd

	# Install the useful contrib scripts
	cd "${S}"/support
	exeinto /usr/share/rsync/
	doexe atomic-rsync cvs2includes deny-rsync file-attr-restore files-to-excludes git-set-file-times logfilter lsh mnt-excl munge-symlinks rrsync rsyncstats
}

pkg_postinst() {
	if egrep -qis '^[[:space:]]use chroot[[:space:]]*=[[:space:]]*(no|0|false)' \
		"${ROOT}"/etc/rsyncd.conf "${ROOT}"/etc/rsync/rsyncd.conf ; then
		ewarn "You have disabled chroot support in your rsyncd.conf.  This"
		ewarn "is a security risk which you should fix.  Please check your"
		ewarn "/etc/rsyncd.conf file and fix the setting 'use chroot'."
	fi
}
