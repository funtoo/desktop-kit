# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake


DESCRIPTION="Library for creating vnc servers"
HOMEPAGE="https://libvnc.github.io/"
SRC_URI="https://github.com/LibVNC/libvncserver/tarball/10e9eb75f73e973725dc75c373de5d89807af028 -> libvncserver-0.9.14-10e9eb7.tar.gz"

# common/d3des.*: https://github.com/LibVNC/libvncserver/issues/88
LICENSE="GPL-2 GPL-2+ LGPL-2.1+ BSD MIT"
# no sub slot wanted (yet), see #578958
SLOT="0"
KEYWORDS="*"
IUSE="+24bpp +filetransfer gcrypt gnutls ipv6 +jpeg lzo +png sasl ssl systemd +threads +zlib"
# https://bugs.gentoo.org/690202
# https://bugs.gentoo.org/435326
# https://bugs.gentoo.org/550916
REQUIRED_USE="
	filetransfer? ( threads )
	jpeg? ( zlib )
	png? ( zlib )
	ssl? ( !gnutls? ( threads ) )
"

DEPEND="
	gcrypt? ( >=dev-libs/libgcrypt-1.5.3:0= )
	ssl? (
		!gnutls? (
			>=dev-libs/openssl-1.0.2:0=
		)
		gnutls? ( >=net-libs/gnutls-2.12.23-r6:0= )
	)
	jpeg? ( >=virtual/jpeg-0-r2:0 )
	lzo? ( dev-libs/lzo )
	png? ( >=media-libs/libpng-1.6.10:0= )
	sasl? ( dev-libs/cyrus-sasl )
	systemd? ( sys-apps/systemd:= )
	zlib? ( >=sys-libs/zlib-1.2.8-r1:0= )
"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS ChangeLog NEWS.md README.md TODO.md )

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv LibVNC-libvncserver* "${S}" || die
	fi
}
PATCHES=(
	"${FILESDIR}"/"${P}"-test-fix-includetest.patch
	"${FILESDIR}"/"${P}"-test-fix-tjunittest.patch
)



src_configure() {
	local mycmakeargs=(
		-DWITH_FFMPEG=OFF
		-DWITH_GTK=OFF
		-DWITH_SDL=OFF
		-DWITH_24BPP=$(usex 24bpp ON OFF)
		-DWITH_TIGHTVNC_FILETRANSFER=$(usex filetransfer ON OFF)
		-DWITH_GCRYPT=$(usex gcrypt ON OFF)
		-DWITH_GNUTLS=$(usex gnutls $(usex ssl ON OFF) OFF)
		-DWITH_IPv6=$(usex ipv6 ON OFF)
		-DWITH_JPEG=$(usex jpeg ON OFF)
		-DWITH_LZO=$(usex lzo ON OFF)
		-DWITH_OPENSSL=$(usex gnutls OFF $(usex ssl ON OFF))
		-DWITH_PNG=$(usex png ON OFF)
		-DWITH_SASL=$(usex sasl ON OFF)
		-DWITH_SYSTEMD=$(usex systemd ON OFF)
		-DWITH_THREADS=$(usex threads ON OFF)
		-DWITH_ZLIB=$(usex zlib ON OFF)
	)
	cmake_src_configure
}