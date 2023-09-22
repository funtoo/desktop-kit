# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xdg-utils qmake-utils

DESCRIPTION="A small, lightweight file manager for desktops based on pure Qt"
HOMEPAGE="https://qtfm.eu/"
SRC_URI="https://github.com/rodlie/qtfm/tarball/dd434acdac5c66a766768358c8e3d858fb917df1 -> qtfm-6.2.1-dd434ac.tar.gz"

S="${WORKDIR}/rodlie-qtfm-dd434ac"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="+dbus shared"

RDEPEND="
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	sys-apps/file
	dbus? ( dev-qt/qtdbus:5 )
"
DEPEND="
	${RDEPEND}
	app-arch/unzip
	dev-qt/linguist-tools:5
"

src_configure() {
	eqmake5 \
		$(usex dbus '' 'CONFIG+=no_dbus CONFIG+=no_tray') \
		$(usex shared 'CONFIG+=sharedlib' '') \
		$(usex shared 'CONFIG+=with_includes' '') \
		LIBDIR="/usr/$(get_libdir)" \
		PREFIX="/usr" \
		XDGDIR="/etc/xdg"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	einstalldocs
}