# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Terminfo for kitty, an OpenGL-based terminal emulator"
HOMEPAGE="https://github.com/kovidgoyal/kitty"
SRC_URI="https://github.com/kovidgoyal/kitty/archive/6bfb6da0ad0c552c34457aafe85b0f0b61200ba2.tar.gz"
S="${WORKDIR}/kitty-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

BDEPEND="sys-libs/ncurses"

PATCHES=(
)

RESTRICT="test" # intended to be ran on the full kitty package

src_unpack() {
	unpack ${A}
	rm -rf ${S}
	mv ${WORKDIR}/kitty-* ${S} || die
}

src_compile() { :; }

src_install() {
	dodir /usr/share/terminfo
	tic -xo "${ED}"/usr/share/terminfo terminfo/kitty.terminfo || die
}