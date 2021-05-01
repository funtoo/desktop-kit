# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg-utils

DESCRIPTION="Qt Library for Building File Managers"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/libfm-qt/releases/download/0.17.1/libfm-qt-0.17.1.tar.xz -> libfm-qt-0.17.1.tar.xz"
KEYWORDS="*"

LICENSE="BSD GPL-2+ LGPL-2.1+"
SLOT="0"

BDEPEND="
	dev-qt/linguist-tools:5
	dev-util/lxqt-build-tools
	virtual/pkgconfig
"
DEPEND="
	dev-libs/glib:2
	dev-qt/qtcore:5
	dev-qt/qtgui:5=
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	lxde-base/menu-cache
	media-libs/libexif
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
}