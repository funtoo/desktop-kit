# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9+ )

inherit python-single-r1 toolchain-funcs xdg go-module
EGO_SUM=(
	"github.com/!a!l!tree/bigfloat v0.0.0-20220102081255-38c8b72a9924"
	"github.com/!a!l!tree/bigfloat v0.0.0-20220102081255-38c8b72a9924/go.mod"
	"github.com/alecthomas/assert/v2 v2.2.1"
	"github.com/alecthomas/chroma/v2 v2.8.0"
	"github.com/alecthomas/chroma/v2 v2.8.0/go.mod"
	"github.com/alecthomas/repr v0.2.0"
	"github.com/bmatcuk/doublestar/v4 v4.6.0"
	"github.com/bmatcuk/doublestar/v4 v4.6.0/go.mod"
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
	"github.com/google/go-cmp v0.5.9"
	"github.com/google/go-cmp v0.5.9/go.mod"
	"github.com/google/uuid v1.3.0"
	"github.com/google/uuid v1.3.0/go.mod"
	"github.com/hexops/gotextdiff v1.0.3"
	"github.com/jamesruan/go-rfc1924 v0.0.0-20170108144916-2767ca7c638f"
	"github.com/jamesruan/go-rfc1924 v0.0.0-20170108144916-2767ca7c638f/go.mod"
	"github.com/jessevdk/go-flags v1.4.0/go.mod"
	"github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0/go.mod"
	"github.com/lufia/plan9stats v0.0.0-20230326075908-cb1d2100619a"
	"github.com/lufia/plan9stats v0.0.0-20230326075908-cb1d2100619a/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c/go.mod"
	"github.com/power-devops/perfstat v0.0.0-20221212215047-62379fc7944b"
	"github.com/power-devops/perfstat v0.0.0-20221212215047-62379fc7944b/go.mod"
	"github.com/seancfoley/bintree v1.2.1"
	"github.com/seancfoley/bintree v1.2.1/go.mod"
	"github.com/seancfoley/ipaddress-go v1.5.4"
	"github.com/seancfoley/ipaddress-go v1.5.4/go.mod"
	"github.com/shirou/gopsutil/v3 v3.23.6"
	"github.com/shirou/gopsutil/v3 v3.23.6/go.mod"
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
	"github.com/tklauser/go-sysconf v0.3.11"
	"github.com/tklauser/go-sysconf v0.3.11/go.mod"
	"github.com/tklauser/numcpus v0.6.0"
	"github.com/tklauser/numcpus v0.6.0/go.mod"
	"github.com/yuin/goldmark v1.4.13/go.mod"
	"github.com/yusufpapurcu/wmi v1.2.3"
	"github.com/yusufpapurcu/wmi v1.2.3/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/exp v0.0.0-20230321023759-10a507213a29"
	"golang.org/x/exp v0.0.0-20230321023759-10a507213a29/go.mod"
	"golang.org/x/image v0.0.0-20191009234506-e7c1f5e7dbb8/go.mod"
	"golang.org/x/image v0.9.0"
	"golang.org/x/image v0.9.0/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4/go.mod"
	"golang.org/x/mod v0.8.0/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20220722155237-a158d28d115b/go.mod"
	"golang.org/x/net v0.6.0/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4/go.mod"
	"golang.org/x/sync v0.1.0/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190916202348-b4ddaad3f8a3/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20201204225414-ed752295db88/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f/go.mod"
	"golang.org/x/sys v0.2.0/go.mod"
	"golang.org/x/sys v0.5.0/go.mod"
	"golang.org/x/sys v0.9.0/go.mod"
	"golang.org/x/sys v0.10.0"
	"golang.org/x/sys v0.10.0/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/term v0.5.0/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/text v0.7.0/go.mod"
	"golang.org/x/text v0.11.0/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.1.12/go.mod"
	"golang.org/x/tools v0.6.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v1 v1.0.0-20140924161607-9f9df34309c0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"howett.net/plist v1.0.0"
	"howett.net/plist v1.0.0/go.mod"
)

go-module_set_globals

SRC_URI="https://github.com/kovidgoyal/kitty/releases/download/v0.29.0/kitty-0.29.0.tar.xz -> kitty-0.29.0.tar.xz
https://direct.funtoo.org/06/ac/17/06ac1766dadf170cf130351c0530406200deaea551312ed874ebf1fff38a280f17b9e18f03f65c63028393517b3adbbb29fab3f966969ef79cb63e8a06b58389 -> kitty-0.29.0-funtoo-go-bundle-e5ce95a7d94d88cde5fb7ce7fa2aeb7ab97e2c43bc3025d82f053a2778a9ce7c30988a7f715f45b7f99be6ce74a6b019ad78949ad79b236c98e9746c346a7e51.tar.gz"
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