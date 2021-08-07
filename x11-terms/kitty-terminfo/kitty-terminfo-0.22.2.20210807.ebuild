# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit python-any-r1 toolchain-funcs xdg

DESCRIPTION="Terminfo for kitty, an OpenGL-based terminal emulator"
HOMEPAGE="https://github.com/kovidgoyal/kitty"
SRC_URI="https://github.com/kovidgoyal/kitty/archive/e1ed9aca10b504d7334f386bbfc140c4afe2a60f.tar.gz"
S="${WORKDIR}/kitty-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="debug"

DEPEND="${PYTHON_DEPS}"

PATCHES=(
		${REPODIR}/x11-terms/kitty-gen/files/kitty-terminfo-setup-0.19.3.20210303.patch
)

# kitty-terminfo is a split package from kitty that only installs the terminfo
# file. As tests are designed to be run with the whole package compiled they
# would fail in this case.
RESTRICT="test"

src_unpack() {
	unpack ${A}
	rm -rf ${S}
	mv ${WORKDIR}/kitty-* ${S} || die
}

src_compile() {
	"${EPYTHON}" setup.py \
		--verbose $(usex debug --debug "") \
		--libdir-name $(get_libdir) \
		linux-terminfo || die "Failed to compile kitty."
}

src_install() {
	insinto /usr
	doins -r linux-package/*
}