# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="User Tools from libqtxdg"
HOMEPAGE="https://lxqt-project.org/"

SRC_URI="https://github.com/lxqt/qtxdg-tools/tarball/7d3c69c664fbdc1ca63cb48b4199fdfa88ce8c81 -> qtxdg-tools-3.11.0-7d3c69c.tar.gz"
KEYWORDS="*"

LICENSE="LGPL-2.1"
SLOT="0"

BDEPEND="dev-util/lxqt-build-tools"
RDEPEND="
	dev-libs/libqtxdg
	dev-qt/qtcore:5
"
DEPEND="${RDEPEND}"