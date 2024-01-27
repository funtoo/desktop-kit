# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9+ )

inherit python-single-r1 toolchain-funcs xdg go-module
EGO_SUM=(
	"github.com/!a!l!tree/bigfloat v0.2.0"
	"github.com/!a!l!tree/bigfloat v0.2.0/go.mod"
	"github.com/alecthomas/assert/v2 v2.2.1"
	"github.com/alecthomas/assert/v2 v2.2.1/go.mod"
	"github.com/alecthomas/chroma/v2 v2.12.0"
	"github.com/alecthomas/chroma/v2 v2.12.0/go.mod"
	"github.com/alecthomas/repr v0.2.0"
	"github.com/alecthomas/repr v0.2.0/go.mod"
	"github.com/bmatcuk/doublestar/v4 v4.6.1"
	"github.com/bmatcuk/doublestar/v4 v4.6.1/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/disintegration/imaging v1.6.2"
	"github.com/disintegration/imaging v1.6.2/go.mod"
	"github.com/dlclark/regexp2 v1.10.0"
	"github.com/dlclark/regexp2 v1.10.0/go.mod"
	"github.com/go-ole/go-ole v1.2.6"
	"github.com/go-ole/go-ole v1.2.6/go.mod"
	"github.com/google/go-cmp v0.5.6/go.mod"
	"github.com/google/go-cmp v0.5.9/go.mod"
	"github.com/google/go-cmp v0.6.0"
	"github.com/google/go-cmp v0.6.0/go.mod"
	"github.com/google/uuid v1.5.0"
	"github.com/google/uuid v1.5.0/go.mod"
	"github.com/hexops/gotextdiff v1.0.3"
	"github.com/hexops/gotextdiff v1.0.3/go.mod"
	"github.com/jessevdk/go-flags v1.4.0/go.mod"
	"github.com/klauspost/cpuid/v2 v2.2.5"
	"github.com/klauspost/cpuid/v2 v2.2.5/go.mod"
	"github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0/go.mod"
	"github.com/lufia/plan9stats v0.0.0-20230326075908-cb1d2100619a"
	"github.com/lufia/plan9stats v0.0.0-20230326075908-cb1d2100619a/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c/go.mod"
	"github.com/power-devops/perfstat v0.0.0-20221212215047-62379fc7944b"
	"github.com/power-devops/perfstat v0.0.0-20221212215047-62379fc7944b/go.mod"
	"github.com/seancfoley/bintree v1.2.3"
	"github.com/seancfoley/bintree v1.2.3/go.mod"
	"github.com/seancfoley/ipaddress-go v1.5.5"
	"github.com/seancfoley/ipaddress-go v1.5.5/go.mod"
	"github.com/shirou/gopsutil/v3 v3.23.12"
	"github.com/shirou/gopsutil/v3 v3.23.12/go.mod"
	"github.com/shoenig/go-m1cpu v0.1.6"
	"github.com/shoenig/go-m1cpu v0.1.6/go.mod"
	"github.com/shoenig/test v0.6.4"
	"github.com/shoenig/test v0.6.4/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.4"
	"github.com/stretchr/testify v1.8.4/go.mod"
	"github.com/tklauser/go-sysconf v0.3.12"
	"github.com/tklauser/go-sysconf v0.3.12/go.mod"
	"github.com/tklauser/numcpus v0.6.1"
	"github.com/tklauser/numcpus v0.6.1/go.mod"
	"github.com/yusufpapurcu/wmi v1.2.3"
	"github.com/yusufpapurcu/wmi v1.2.3/go.mod"
	"github.com/zeebo/assert v1.3.0"
	"github.com/zeebo/assert v1.3.0/go.mod"
	"github.com/zeebo/xxh3 v1.0.2"
	"github.com/zeebo/xxh3 v1.0.2/go.mod"
	"golang.org/x/exp v0.0.0-20230801115018-d63ba01acd4b"
	"golang.org/x/exp v0.0.0-20230801115018-d63ba01acd4b/go.mod"
	"golang.org/x/image v0.0.0-20191009234506-e7c1f5e7dbb8/go.mod"
	"golang.org/x/image v0.15.0"
	"golang.org/x/image v0.15.0/go.mod"
	"golang.org/x/sys v0.0.0-20190916202348-b4ddaad3f8a3/go.mod"
	"golang.org/x/sys v0.0.0-20201204225414-ed752295db88/go.mod"
	"golang.org/x/sys v0.5.0/go.mod"
	"golang.org/x/sys v0.8.0/go.mod"
	"golang.org/x/sys v0.11.0/go.mod"
	"golang.org/x/sys v0.15.0/go.mod"
	"golang.org/x/sys v0.16.0"
	"golang.org/x/sys v0.16.0/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v1 v1.0.0-20140924161607-9f9df34309c0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"howett.net/plist v1.0.1"
	"howett.net/plist v1.0.1/go.mod"
)

go-module_set_globals

SRC_URI="https://github.com/kovidgoyal/kitty/releases/download/v0.32.1/kitty-0.32.1.tar.xz -> kitty-0.32.1.tar.xz
https://direct.funtoo.org/f5/7d/00/f57d00a59732738e948ee6b0473f0101d5251ea837bda06467fd9b07c1984ba080f6c2031dff073c6e09b56471c19d9795778f59b64f224804e50e8eaf99549b -> kitty-0.32.1-funtoo-go-bundle-a4760ee9c60a2dcc36a74859ea2f0236f0e1e393886bba21dc4b359dcd8e15f4345e58d5b741022eb46c4a04bf176df2258218689b94518508aa30e0588c573d.tar.gz"
KEYWORDS="next"

DESCRIPTION="Cross-platform, fast, feature-rich, GPU based terminal"
HOMEPAGE="https://github.com/kovidgoyal/kitty"

LICENSE="GPL-3"
SLOT="0"
IUSE="debug wayland"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	~x11-terms/kitty-shell-integration-${PV}
	~x11-terms/kitty-terminfo-${PV}
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
	net-libs/librsync
	dev-libs/xxhash
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

QA_FLAGS_IGNORED="usr/bin/kitten" # written in Go

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
		--shell-integration="enabled no-rc" \
		--update-check-interval=0 \
		linux-package || die "Failed to compile kitty."

	rm -r linux-package/$(get_libdir)/kitty/terminfo || die
}

src_test() {
	export KITTY_CONFIG_DIRECTORY=${T}
	"${EPYTHON}" test.py || die
}

src_install() {
	insinto /usr

	doins -r linux-package/*
	dobin linux-package/bin/kitty

	fperms +x /usr/$(get_libdir)/kitty/shell-integration/ssh/kitty
	fperms +x /usr/bin/kitten

	python_fix_shebang "${ED}"
}

pkg_postinst() {
	xdg_icon_cache_update
	elog "Displaying images in the terminal" virtual/imagemagick-tools
}

pkg_postrm() {
	xdg_icon_cache_update
}