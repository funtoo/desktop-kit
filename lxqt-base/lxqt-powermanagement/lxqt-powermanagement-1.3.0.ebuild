# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt daemon for power management and auto-suspend"
HOMEPAGE="https://lxqt.github.io/"

LXQTPV="$(ver_cut 1-2)*"

SRC_URI="https://github.com/lxqt/lxqt-powermanagement/tarball/58fa0d11b7411f6667a1ad991ad2c08d5a5d2618 -> lxqt-powermanagement-1.3.0-58fa0d1.tar.gz"
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