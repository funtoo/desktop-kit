# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs autotools

DESCRIPTION="Simple screen locker"
HOMEPAGE="https://i3wm.org/i3lock/"
SRC_URI="https://api.github.com/repos/i3/i3lock/tarball/refs/tags/2.13 -> i3lock-2.13-4f76d51a3f79082e01b319e9031aad868d89449d.tar.gz"
KEYWORDS="*"

LICENSE="BSD"
SLOT="0"

RDEPEND="
	dev-libs/libev
	sys-libs/pam
	x11-libs/cairo[X,xcb(+)]
	x11-libs/libxcb[xkb]
	x11-libs/libxkbcommon[X]
	x11-libs/xcb-util
	x11-libs/xcb-util-xrm"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

post_src_unpack() {
	mv "${WORKDIR}/"i3-i3lock* "${S}" || die
}

src_prepare() {
    default

	sed -i -e 's:login:system-auth:g' pam/${PN} || die
    eautoreconf
}

src_configure() {
    default
	tc-export CC
    econf
}

src_install() {
	default
	doman ${PN}.1
}