# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt daemon for power management and auto-suspend"
HOMEPAGE="https://lxqt.github.io/"

LXQTPV="$(ver_cut 1-2)*"

SRC_URI="https://github.com/lxqt/lxqt-powermanagement/releases/download/1.2.0/lxqt-powermanagement-1.2.0.tar.xz -> lxqt-powermanagement-1.2.0.tar.xz"
KEYWORDS="*"

LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"

BDEPEND="
	dev-qt/linguist-tools:5
	dev-util/lxqt-build-tools
	virtual/pkgconfig
"
DEPEND="
	dev-libs/libqtxdg
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	kde-frameworks/kidletime:5
	kde-frameworks/solid:5
	=lxqt-base/liblxqt-${LXQTPV}
	=lxqt-base/lxqt-globalkeys-${LXQTPV}
	sys-power/upower
"
RDEPEND="${DEPEND}"