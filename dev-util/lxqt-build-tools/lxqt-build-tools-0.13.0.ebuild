# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt Build Tools"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/lxqt-build-tools/releases/download/0.13.0/lxqt-build-tools-0.13.0.tar.xz -> lxqt-build-tools-0.13.0.tar.xz"
KEYWORDS="*"

LICENSE="BSD"
SLOT="0"

DEPEND="
	>=dev-libs/glib-2.50.0
	dev-qt/qtcore:5
"
RDEPEND="${DEPEND}"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv "${WORKDIR}"/* "${S}" || die
	fi
}