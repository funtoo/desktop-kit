# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt system integration plugin for Qt"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/lxqt-qtplugin/releases/download/1.0.0/lxqt-qtplugin-1.0.0.tar.xz -> lxqt-qtplugin-1.0.0.tar.xz"
KEYWORDS="*"

LICENSE="LGPL-2.1+"
SLOT="0"

BDEPEND="
	dev-qt/linguist-tools:5
	dev-util/lxqt-build-tools
"
DEPEND="
	dev-libs/libdbusmenu-qt:=[qt5(+)]
	dev-libs/libqtxdg
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5=
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	=x11-libs/libfm-qt-$(ver_cut 1-2)*
"
RDEPEND="${DEPEND}"