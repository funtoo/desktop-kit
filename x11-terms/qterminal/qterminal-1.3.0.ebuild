# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg-utils

DESCRIPTION="Qt-based multitab terminal emulator"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/qterminal/tarball/a2380fd5e92c461ec283c94c1699fbaf5de103bc -> qterminal-1.3.0-a2380fd.tar.gz"
KEYWORDS="*"

LICENSE="GPL-2 GPL-2+"
SLOT="0"

BDEPEND="dev-util/lxqt-build-tools
	dev-qt/qttest"
DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	x11-libs/libX11
	~x11-libs/qtermwidget-${PV}
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}