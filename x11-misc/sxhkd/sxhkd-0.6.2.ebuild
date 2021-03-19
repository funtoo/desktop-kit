# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs 

DESCRIPTION="Simple X hotkey daemon"
HOMEPAGE="https://github.com/baskerville/sxhkd/"
SRC_URI="https://api.github.com/repos/baskerville/sxhkd/tarball/refs/tags/0.6.2 -> sxhkd-0.6.2.tgz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="*"

RDEPEND="x11-libs/libxcb
	x11-libs/xcb-util-keysyms"
DEPEND="${RDEPEND}
	x11-libs/xcb-util"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}/baskerville-sxhkd"* "$S" || die
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr DOCPREFIX="/usr/share/doc/${PF}" install
}