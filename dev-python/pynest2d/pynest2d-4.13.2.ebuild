# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit cmake python-single-r1

DESCRIPTION="Python bindings for libnest2d"
HOMEPAGE="https://github.com/Ultimaker/pynest2d"
SRC_URI="https://github.com/Ultimaker/pynest2d/tarball/3533c8c8eb64d293740bd387011c30657ad2df05 -> pynest2d-4.13.2-3533c8c.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="*"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-libs/libnest2d
	$(python_gen_cond_dep '<dev-python/sip-5[${PYTHON_USEDEP}]')
	"

DEPEND="${RDEPEND}"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv Ultimaker-pynest2d* "${S}" || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DPython3_EXECUTABLE="${PYTHON}"
	)

	cmake_src_configure
}