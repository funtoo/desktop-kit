# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="FDM materials for media-gfx/cura"
HOMEPAGE="https://github.com/Ultimaker/fdm_materials"
SRC_URI="https://github.com/Ultimaker/fdm_materials/tarball/304287c3a69d79a14d33c1fe897bf653a2fc4f15 -> fdm_materials-4.13.2-304287c.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="*"
IUSE="embedded"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv Ultimaker-fdm_materials* "${S}" || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DEMBEDDED=$(usex embedded on off)
	)
	cmake_src_configure
}