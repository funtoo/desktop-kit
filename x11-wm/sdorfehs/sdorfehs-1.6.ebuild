# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A tiling window manager"
HOMEPAGE="https://github.com/jcs/sdorfehs"
SRC_URI="https://github.com/jcs/sdorfehs/tarball/cf6164dff7622a0bea23c6dc398f3fa716e6f13c -> sdorfehs-1.6-cf6164d.tar.gz"

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