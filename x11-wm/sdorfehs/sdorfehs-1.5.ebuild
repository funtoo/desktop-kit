# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A tiling window manager"
HOMEPAGE="https://github.com/jcs/sdorfehs"
SRC_URI="https://github.com/jcs/sdorfehs/tarball/8a50f09638020f84b7e6af816a27fb7184c68c87 -> sdorfehs-1.5-8a50f09.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="*"

IUSE="debug emacs +history sloppy +xft +xrandr"

RDEPEND="
	history? ( sys-libs/readline:= )
	xft? ( x11-libs/libXft )
	xrandr? ( x11-libs/libXrandr )
	x11-libs/libX11
	x11-libs/libXtst
	x11-libs/libXres
"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto
"
BDEPEND="virtual/pkgconfig"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv jcs-sdorfehs* "${S}"
	fi
}