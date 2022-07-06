# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A 3D model slicing engine for 3D printing"
HOMEPAGE="https://github.com/Ultimaker/CuraEngine"
SRC_URI="https://github.com/Ultimaker/CuraEngine/tarball/ebb53015413c568ccf20c050ef0d68c3072da9f9 -> CuraEngine-4.13.2-ebb5301.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="+arcus doc openmp test"
RESTRICT="!test? ( test )"

RDEPEND="
	${PYTHON_DEPS}
	arcus? (
		~dev-libs/libarcus-${PV}:*
		dev-libs/protobuf:=
	)
	dev-libs/clipper
	dev-libs/rapidjson
	dev-libs/stb"

DEPEND="${RDEPEND}
	test? ( dev-cpp/gtest )"
BDEPEND="doc? ( app-doc/doxygen )"

DOCS=( README.md )

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv Ultimaker-CuraEngine* "${S}" || die
	fi
}

src_prepare() {
	rm -r "${S}"/libs || die

	# remove static linking
	# respect cflags
	sed -i \
		-e "s/-static-libstdc++//g" \
		-e 's/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")//g' \
		-e 's/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE_INIT}")//g' \
		CMakeLists.txt || die

	if use test; then
		find "${S}"/tests/arcus "${S}"/tests/integration "${S}"/tests/settings "${S}"/tests/utils \
		 -type f -name '*.cpp' | xargs sed -i \
			-e 's <../src/utils/AABB.h> "../../src/utils/AABB.h" g'\
			-e 's <../src/utils/IntPoint.h> "../../src/utils/IntPoint.h" g' \
			-e 's <../src/utils/polygon.h> "../../src/utils/polygon.h" g'\
			-e 's <../src/utils/PolygonConnector.h> "../../src/utils/PolygonConnector.h" g'\
			-e 's <../src/utils/polygonUtils.h> "../../src/utils/polygonUtils.h" g'\
			-e 's <../src/utils/string.h> "../../src/utils/string.h" g' \
			-e 's <../src/utils/SVG.h> "../../src/utils/SVG.h" g' \
			-e 's#include "../src#include "../../src#g'|| die
	fi

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=$(usex test ON OFF)
		-DENABLE_ARCUS=$(usex arcus ON OFF)
		-DENABLE_MORE_COMPILER_OPTIMIZATION_FLAGS=OFF
		-DENABLE_OPENMP=$(usex openmp ON OFF)
		-DUSE_SYSTEM_LIBS=ON
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	if use doc; then
		doxygen || die "generating docs failed"
		mv docs/html . || die
		find html -type f '(' -name '*.md5' -o -name '*.map' ')' -delete || die
		HTML_DOCS=( html/. )
	fi
}