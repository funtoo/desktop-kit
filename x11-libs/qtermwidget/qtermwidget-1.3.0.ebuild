# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Qt terminal emulator widget"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/qtermwidget/tarball/75a682f846b8668af1036315edfd5e9596f308d1 -> qtermwidget-1.3.0-75a682f.tar.gz"
KEYWORDS="*"

LICENSE="BSD GPL-2 LGPL-2+"
SLOT="0/${PV}"

BDEPEND="
	dev-qt/linguist-tools:5
	>=dev-util/lxqt-build-tools-0.12.0
"
DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
RDEPEND="${DEPEND}"