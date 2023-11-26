# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop multilib toolchain-funcs

DESCRIPTION="Small dynamic tiling window manager for X11"
HOMEPAGE="https://github.com/conformal/spectrwm"

SRC_URI="https://api.github.com/repos/conformal/spectrwm/tarball/SPECTRWM_3_5_1 -> spectrwm-3.5.1.tar.gz"
KEYWORDS="*"

LICENSE="ISC"
SLOT="0"
IUSE=""

DEPEND="
		elibc_musl? ( sys-libs/queue-standalone )
		x11-libs/libX11
		x11-libs/libXcursor
		x11-libs/libXrandr
		x11-libs/libXt
		x11-libs/xcb-util
"

RDEPEND="
		!x11-wm/scrotwm
		x11-misc/dmenu
		x11-terms/xterm
		x11-misc/xlockmore
"

PATCHES=(
	"${FILESDIR}"/${PN}-3.4.0-gentoo.patch
	"${FILESDIR}"/${PN}-3.4.1-musl.patch
)

src_unpack() {
        unpack "${A}"
        mv "${WORKDIR}/conformal-spectrwm"* "$S" || die
}

src_prepare() {
        sed -i -e '/LICENSE.md/d' linux/Makefile || die
        default
}

src_compile() {
        tc-export CC PKG_CONFIG
        emake -C linux PREFIX="${EROOT}/usr" LIBDIR="${EROOT}/usr/$(get_libdir)"
}

src_install() {
        emake -C linux PREFIX="${EROOT}/usr" LIBDIR="${EROOT}/usr/$(get_libdir)" \
                SYSCONFDIR="${EROOT}/etc" DOCDIR="${EROOT}/usr/share/doc/${P}" \
                DESTDIR="${D}" install

        dodoc README.md ${PN}_*.conf {initscreen,screenshot}.sh
}