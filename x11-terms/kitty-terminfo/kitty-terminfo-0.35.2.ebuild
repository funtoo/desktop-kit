# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Cross-platform, fast, feature-rich, GPU based terminal"
HOMEPAGE="https://github.com/kovidgoyal/kitty"
SRC_URI="https://github.com/kovidgoyal/kitty/releases/download/v0.35.2/kitty-0.35.2.tar.xz -> kitty-0.35.2.tar.xz"
S="${WORKDIR}/kitty-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="next"
IUSE=""

BDEPEND="sys-libs/ncurses"
RDEPEND="!<=x11-terms/kitty-0.25.0"

PATCHES=(
)

RESTRICT="test" # intended to be ran on the full kitty package

src_compile() { :; }

src_install() {
	dodir /usr/share/terminfo
	tic -xo "${ED}"/usr/share/terminfo terminfo/kitty.terminfo || die
}