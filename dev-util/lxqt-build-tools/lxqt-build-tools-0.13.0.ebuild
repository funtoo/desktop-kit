# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt Build Tools"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/lxqt-build-tools/tarball/71b0652046d5731e5af9b38de6262f396c03ec56 -> lxqt-build-tools-0.13.0-71b0652.tar.gz"
KEYWORDS="*"

LICENSE="BSD"
SLOT="0"

DEPEND="
	>=dev-libs/glib-2.50.0
	dev-qt/qtcore:5
"
RDEPEND="${DEPEND}"