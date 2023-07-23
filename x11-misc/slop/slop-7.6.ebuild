# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Application that queries the user for a selection for printing"
HOMEPAGE="https://github.com/naelstrof/slop"
SRC_URI="https://github.com/naelstrof/slop/tarball/5f4f0727e502fc3622fc526e965bbdaba9b36546 -> slop-7.6-5f4f072.tar.gz"
KEYWORDS="*"

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE="opengl icu"

RDEPEND="
	icu? ( dev-libs/icu:= )
	x11-libs/libX11
	x11-libs/libXext
	opengl? (
		media-libs/glew:0=
		media-libs/libglvnd
		virtual/opengl
		x11-libs/libXrender:=
	)
"
BDEPEND="
	${RDEPEND}
	x11-base/xorg-proto
"
DEPEND="
	${RDEPEND}
	media-libs/glm
"

#PATCHES=( "${FILESDIR}/${PN}"-7.5-missing-header.patch )

src_unpack() {
	unpack "${A}"
	mv naelstrof-slop-* "${S}"
}

src_configure() {
	local mycmakeargs=(
		-DSLOP_OPENGL=$(usex opengl)
		-DSLOP_UNICODE=$(usex icu)
	)
	cmake_src_configure
}
