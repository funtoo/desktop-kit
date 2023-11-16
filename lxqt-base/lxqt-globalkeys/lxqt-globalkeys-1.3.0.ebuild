# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Daemon and library for global keyboard shortcuts registration"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/lxqt-globalkeys/tarball/3681455389a36eb806c074a6db583e74ceda2f99 -> lxqt-globalkeys-1.3.0-3681455.tar.gz"
KEYWORDS="*"

LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"

BDEPEND="
	dev-qt/linguist-tools:5
	dev-util/lxqt-build-tools
"
DEPEND="
	dev-libs/libqtxdg
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	dev-qt/qtxml:5
	kde-frameworks/kwindowsystem:5
	=lxqt-base/liblxqt-$(ver_cut 1-2)*
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv "${WORKDIR}"/* "${S}" || die
	fi
}