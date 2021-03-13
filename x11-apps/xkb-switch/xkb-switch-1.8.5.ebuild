# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Switch your X keyboard layouts from the command line"
HOMEPAGE="https://github.com/grwlf/xkb-switch"
SRC_URI="https://github.com/grwlf/xkb-switch/archive/1.8.5.tar.gz -> xkb-switch-1.8.5.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="x11-libs/libxkbfile"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	sed -i -e "s/DESTINATION lib/DESTINATION $(get_libdir)/" CMakeLists.txt
	cmake_src_prepare
}