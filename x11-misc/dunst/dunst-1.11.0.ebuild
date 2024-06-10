# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd toolchain-funcs

DESCRIPTION="Lightweight and customizable notification daemon"
HOMEPAGE="https://dunst-project.org/ https://github.com/dunst-project/dunst"
SRC_URI="https://github.com/dunst-project/dunst/tarball/d6dc43c5c56563336a2166a3fbacd009e5bdd1a3 -> dunst-1.11.0-d6dc43c.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="wayland"

DEPEND="
	dev-libs/glib:2
	sys-apps/dbus
	x11-libs/cairo[X,glib]
	x11-libs/gdk-pixbuf:2
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXScrnSaver
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libnotify
	x11-libs/pango[X]
	x11-misc/xdg-utils
	wayland? ( dev-libs/wayland )
"

RDEPEND="${DEPEND}"

BDEPEND="
	dev-lang/perl
	virtual/pkgconfig
	wayland? ( dev-libs/wayland-protocols )
"


post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv dunst-project-dunst* "${S}" || die
	fi
}

src_prepare() {
	default

	# Respect users CFLAGS
	sed -e 's/-Os//' -i config.mk || die

	# Use correct path for dbus and system unit
	sed -e "s|##PREFIX##|${EPREFIX}/usr|" -i dunst.systemd.service.in || die
	sed -e "s|##PREFIX##|${EPREFIX}/usr|" -i org.knopwob.dunst.service.in || die
}

src_configure() {
	tc-export CC PKG_CONFIG

	default
}

src_compile() {
	local myemakeargs=(
		SYSCONFDIR="${EPREFIX}/etc/xdg"
		SYSTEMD="0"
		WAYLAND="$(usex wayland 1 0)"
	)

	emake "${myemakeargs[@]}"
}

src_install() {
	local myemakeargs=(
		PREFIX="${ED}/usr"
		SYSCONFDIR="${ED}/etc/xdg"
		SYSTEMD="0"
		WAYLAND="$(usex wayland 1 0)"
	)

	emake "${myemakeargs[@]}" install

	insinto /usr/share/zsh/site-functions
	newins completions/_dunst.zshcomp _dunst
	newins completions/_dunstctl.zshcomp _dunstctl

	systemd_newuserunit dunst.systemd.service.in dunst.service
}