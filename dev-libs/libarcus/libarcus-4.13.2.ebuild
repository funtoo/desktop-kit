# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit cmake python-single-r1

DESCRIPTION="This library facilitates communication between Cura and its backend"
HOMEPAGE="https://github.com/Ultimaker/libArcus"
SRC_URI="https://github.com/Ultimaker/libArcus/tarball/2066a9ddccece8f970902bb5e33147d674627edd -> libArcus-4.13.2-2066a9d.tar.gz"

LICENSE="LGPL-3"
SLOT="0/3"
KEYWORDS="*"
IUSE="examples +python static-libs"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="${PYTHON_DEPS}
	dev-libs/protobuf:=
	$(python_gen_cond_dep '
		<dev-python/sip-5[${PYTHON_USEDEP}]
		python? ( dev-python/protobuf-python[${PYTHON_USEDEP}] )
	')"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${PN}-4.8.0-deprecated-protobuf-calls.patch
)

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv Ultimaker-libArcus* "${S}" || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=$(usex examples ON OFF)
		-DBUILD_PYTHON=$(usex python ON OFF)
		-DBUILD_STATIC=$(usex static-libs ON OFF)
	)

	cmake_src_configure
}