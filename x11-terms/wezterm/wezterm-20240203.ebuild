# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo desktop

DESCRIPTION="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
HOMEPAGE="https://github.com/wez/wezterm"
SRC_URI="https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203-110809-5046fc22-src.tar.gz -> wezterm-20240203-110809-5046fc22-src.tar.gz
https://direct.funtoo.org/28/c5/d1/28c5d10d3a75279986dbc838f2ca31e2ad63fbf0339c3a7a8967026970f3de8455b0ab39317e207309aa8a84a02c6e8e7c238d0547acf3a5aef7ec8f2e872427 -> wezterm-20240203-funtoo-crates-bundle-edb626b0cfa9b7fa25599ef2c7cc56d58798a871027391943321d609eacb451080a02b7a01ca1e9667074aff88592394fa6e63d0d05f7b7c0bfb9b4e25dfdc94.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
IUSE="wayland +X"

REQUIRED_USE="|| ( wayland X )"

# https://github.com/wez/wezterm/blob/main/get-deps
DEPEND="
	dev-libs/openssl
	media-libs/fontconfig
	media-libs/mesa[X?,wayland?]
	x11-libs/libxkbcommon[X,wayland?]
	sys-apps/dbus
	wayland? ( dev-libs/wayland )
	X? (
			x11-themes/hicolor-icon-theme
			x11-libs/libX11
			x11-libs/libxkbcommon
			x11-libs/libxcb:=[xkb]
			x11-libs/xcb-util
			x11-libs/xcb-util-image
			x11-libs/xcb-util-keysyms
			x11-libs/xcb-util-wm
			x11-themes/xcursor-themes
	)
"
BDEPEND="
	dev-util/cmake
	dev-vcs/git
	virtual/pkgconfig
	virtual/rust
"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="
	usr/bin/.*
"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/wezterm-* ${S} || die
}

# https://wezfurlong.org/wezterm/install/source.html
src_configure() {
	if use X ; then
		cargo_src_configure --no-default-features --features vendored-fonts
	fi
}

src_install() {
	exeinto /usr/bin
	doexe target/release/wezterm
	doexe target/release/wezterm-gui
	doexe target/release/wezterm-mux-server
	doexe target/release/strip-ansi-escapes

	newbashcomp assets/shell-completion/bash wezterm

	insinto /usr/share/fish/vendor_completions.d/
	doins assets/shell-completion/fish

	insinto /usr/share/zsh/site-functions
	doins assets/shell-completion/zsh

	newmenu assets/wezterm.desktop org.wezfurlong.wezterm.desktop
	newicon assets/icon/wezterm-icon.svg org.wezfurlong.wezterm.svg

	insinto /usr/share/metainfo
	newins assets/wezterm.appdata.xml org.wezfurlong.wezterm.appdata.xml
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}