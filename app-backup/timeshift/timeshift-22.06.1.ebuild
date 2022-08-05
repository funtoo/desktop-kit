# Distributed under the terms of the GNU General Public License v2

EAPI=7
VALA_MIN_API_VERSION="0.44"
inherit vala xdg

DESCRIPTION="A system restore utility for Linux"
HOMEPAGE="https://github.com/teejee2008/timeshift"
SRC_URI="https://github.com/teejee2008/timeshift/tarball/9d614d5e2e20cb4486b4f4becf7f60c5cd0dea1a -> timeshift-22.06.1-9d614d5.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="
	dev-libs/json-glib
	dev-libs/libgee
	dev-util/desktop-file-utils
	net-libs/libsoup
	net-misc/rsync
	sys-process/cronie
	x11-libs/gtk+:3
	x11-libs/xapps
"
RDEPEND="${DEPEND}"
BDEPEND="
	$(vala_depend)
	net-misc/rsync
	sys-apps/diffutils
	sys-apps/coreutils
	sys-fs/btrfs-progs
	>=x11-libs/vte-0.60.3[vala]
"

post_src_unpack() {
	if [ ! -d "${S}" ] ; then
		mv "${WORKDIR}"/teejee2008-timeshift-* "${S}" || die
	fi
}

src_prepare() {
	sed -i -e "s:valac:valac-$(vala_best_api_version):" "src/makefile"
	vala_src_prepare
	default
}