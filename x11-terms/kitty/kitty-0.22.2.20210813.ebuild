# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit python-single-r1 toolchain-funcs xdg

SRC_URI="https://github.com/kovidgoyal/kitty/archive/dbc7e8e85d097a0e3bb1c48911fbab05ef1f9776.tar.gz
	https://github.com/kovidgoyal/kitty/releases/download/v0.22.2/kitty-0.22.2.tar.xz"
KEYWORDS="*"

DESCRIPTION="A modern, hackable, featureful, OpenGL-based terminal emulator"
HOMEPAGE="https://github.com/kovidgoyal/kitty"

LICENSE="GPL-3"
SLOT="0"
IUSE="debug wayland"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	x11-terms/kitty-terminfo
	media-libs/fontconfig
	media-libs/freetype:2
	>=media-libs/harfbuzz-1.5.0:=
	media-libs/lcms
	media-libs/libcanberra
	media-libs/libpng:0=
	sys-apps/dbus
	sys-libs/zlib
	x11-libs/libxcb[xkb]
	x11-libs/libXcursor
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libxkbcommon[X]
	x11-libs/libXrandr
	wayland? (
		dev-libs/wayland
		>=dev-libs/wayland-protocols-1.17
	)
	$(python_gen_cond_dep 'dev-python/importlib_resources[${PYTHON_USEDEP}]' python3_6)
"

DEPEND="${RDEPEND}
	media-libs/mesa[X]
	sys-libs/ncurses
"

BDEPEND="
	virtual/pkgconfig
"

PATCHES=(
)

src_unpack() {
	unpack ${A}
	mv ${WORKDIR}/kitty-0.22.2/docs/_build ${WORKDIR}/docs_build || die
	rm -rf ${WORKDIR}/kitty-0.22.2
	rm -rf ${S}
	mv ${WORKDIR}/kitty-* ${S} || die
	mv ${WORKDIR}/docs_build ${S}/docs/_build || die
}

src_prepare() {
	default

	sed -i -e "/build_terminfo =/,+4d" setup.py # remove terminfo
	sed -i "s/'launcher'/'..\/linux-package\/bin'/" kitty/constants.py # tests

	# flags
	sed -i \
		-e "s/optimize =.*/optimize = ''/g" \
		-e "s/ + ('' if debug else ' -O3')//g" \
		-e "s/ -Werror / /g" \
		-e "s/cflags.append('-O3')/pass/g" \
		-e "s/ -pipe //g" \
		setup.py

	# disable wayland as required
	if ! use wayland; then
		sed -i "/'x11 wayland'/s/ wayland//" setup.py || die
	fi

	# respect doc dir
	sed -i "/htmldir =/s/appname/'${PF}'/" setup.py || die

	tc-export CC
}

src_compile() {
	"${EPYTHON}" setup.py \
		--verbose $(usex debug --debug "") \
		--libdir-name $(get_libdir) \
		--update-check-interval=0 \
		linux-package || die "Failed to compile kitty."
}

src_test() {
	export KITTY_CONFIG_DIRECTORY=${T}
	"${EPYTHON}" test.py || die
}

src_install() {
	insinto /usr
	doins -r linux-package/*
	dobin linux-package/bin/kitty
	python_fix_shebang "${ED}"
}

pkg_postinst() {
	xdg_icon_cache_update
	elog "Displaying images in the terminal" virtual/imagemagick-tools
}

pkg_postrm() {
	xdg_icon_cache_update
}