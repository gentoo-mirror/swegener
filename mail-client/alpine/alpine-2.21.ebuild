# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit flag-o-matic

MY_P="${P%_p*}"

DESCRIPTION="The continuation of the Alpine email client"
HOMEPAGE="http://patches.freeiz.com/alpine/"
SRC_URI="http://patches.freeiz.com/alpine/release/src/${MY_P}.tar.xz"
[[ ${P} == *_p* ]] && SRC_URI+=" http://patches.freeiz.com/alpine/patches/${MY_P}/all.patch.gz -> ${P}.patch.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc ipv6 kerberos ldap nls onlyalpine passfile smime spell ssl threads"

DEPEND="virtual/pam
	>=sys-libs/ncurses-5.1:0
	ssl? ( dev-libs/openssl:0= )
	ldap? ( net-nds/openldap )
	kerberos? ( app-crypt/mit-krb5 )
	spell? ( app-text/aspell )"
RDEPEND="${DEPEND}
	app-misc/mime-types
	!mail-client/re-alpine
	!onlyalpine? ( !app-editors/pico )
	!onlyalpine? ( !mail-client/pine )
	!<=net-mail/uw-imap-2004g"

S="${WORKDIR}"/${MY_P}

if [[ ${P} == *_p* ]]; then
	PATCHES=(
		"${WORKDIR}"/${P}.patch
	)
fi

src_configure() {
	econf \
		--without-tcl \
		--with-system-pinerc=/etc/pine.conf \
		--with-system-fixed-pinerc=/etc/pine.conf.fixed \
		--with-ssl-certs-dir=/etc/ssl/certs \
		--enable-quotas \
		$(use_with ssl) \
		$(use_with ldap) \
		$(use_with passfile passfile .pinepwd) \
		$(use_with kerberos krb5) \
		$(use_with threads pthread) \
		$(use_with spell interactive-spellcheck /usr/bin/aspell) \
		$(use_enable nls) \
		$(use_with ipv6) \
		$(use_with smime) \
		$(use_enable debug)
}

src_install() {
	if use onlyalpine
	then
		dobin alpine/alpine
		doman doc/man1/alpine.1
	else
		emake DESTDIR="${D}" install
		doman doc/man1/rpdump.1 doc/man1/rpload.1
	fi

	dodoc NOTICE README

	if use doc
	then
		dodoc doc/brochure.txt doc/tech-notes.txt
		docinto imap
		dodoc imap/docs/*.txt imap/docs/CONFIG imap/docs/RELNOTES

		docinto imap/rfc
		dodoc imap/docs/rfc/*.txt

		docinto html/tech-notes
		dohtml -r doc/tech-notes/
	fi
}

pkg_postinst() {
	if use spell
	then
		elog
		elog "In order to use spell checking"
		elog "  emerge app-dicts/aspell-\<your_langs\>"
		elog "and setup alpine with:"
		elog "  Speller = /usr/bin/aspell -c"
		elog
	fi

	if use passfile
	then
		elog
		elog "${PN} will cache passwords between connections."
		elog "File ~/.pinepwd will be used for this."
		elog
	fi
}
