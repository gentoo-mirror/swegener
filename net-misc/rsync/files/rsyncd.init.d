#!/sbin/runscript
# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

command="/usr/bin/rsync"
command_args="--daemon ${RSYNC_OPTS}"
pidfile="/var/run/${SVCNAME}.pid"

depend() {
	use net
}
