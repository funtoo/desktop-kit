# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="VNC server for real X displays"
HOMEPAGE="https://libvnc.github.io/"
SRC_URI="https://github.com/LibVNC/x11vnc/tarball/4ca006fed80410bd9b061a1519bd5d9366bb0bc8 -> x11vnc-0.9.16-4ca006f.tar.gz"

LICENSE="GPL-2+-with-openssl-exception"
SLOT="0"
KEYWORDS="*"
IUSE="crypt fbcon ssl +xcomposite +xdamage +xfixes xinerama +xrandr zeroconf"

COMMON_DEPEND="
	>=net-libs/libvncserver-0.9.8[ssl=]
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXext
	>=x11-libs/libXtst-1.1.0
	sys-libs/libxcrypt:=
	ssl? ( dev-libs/openssl:0= )
	xcomposite? ( x11-libs/libXcomposite )
	xdamage? ( x11-libs/libXdamage )
	xfixes? ( x11-libs/libXfixes )
	xinerama? ( x11-libs/libXinerama )
	xrandr? ( x11-libs/libXrandr )
	zeroconf? ( >=net-dns/avahi-0.6.4 )
"
DEPEND="${COMMON_DEPEND}
	x11-base/xorg-proto
	x11-libs/libXt
"
# https://bugzilla.redhat.com/show_bug.cgi?id=920554
RDEPEND="${COMMON_DEPEND}
	dev-lang/tk:0
"
PATCHES=(
	"${FILESDIR}"/"${P}"-crypto.patch
	"${FILESDIR}"/"${P}"-anonymous-ssl.patch
	"${FILESDIR}"/"${P}"-fno-common.patch
	"${FILESDIR}"/"${P}"-CVE-2020-29074.patch
)

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv LibVNC-x11vnc* "${S}" || die
	fi
}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# --without-v4l because of missing video4linux 2.x support wrt #389079
	local myconf=(
		--without-v4l
		--without-xkeyboard
		--without-fbpm
		--without-dpms
		$(use_with crypt)
		$(use_with fbcon fbdev)
		$(use_with ssl)
		$(use_with ssl crypto)
		$(use_with xcomposite)
		$(use_with xdamage)
		$(use_with xfixes)
		$(use_with xinerama)
		$(use_with xrandr)
		$(use_with zeroconf avahi)
	)
	econf "${myconf[@]}"
}

src_install() {
	default
	newinitd "${FILESDIR}/x11vnc.init.d-r1" x11vnc
	newconfd "${FILESDIR}/x11vnc.conf.d" x11vnc
}