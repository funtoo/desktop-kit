# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt about dialog"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/lxqt-about/releases/download/0.17.0/lxqt-about-0.17.0.tar.xz -> lxqt-about-0.17.0.tar.xz"
KEYWORDS="*"

LICENSE="LGPL-2.1+"
SLOT="0"

BDEPEND="dev-util/lxqt-build-tools"
DEPEND="
	dev-libs/libqtxdg
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	=lxqt-base/liblxqt-$(ver_cut 1-2)*
"
RDEPEND="${DEPEND}"