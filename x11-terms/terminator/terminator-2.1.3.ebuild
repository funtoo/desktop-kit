# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3+ )
inherit distutils-r1 optfeature virtualx xdg

DESCRIPTION="Multiple GNOME terminals in one window"
HOMEPAGE="https://github.com/gnome-terminator/terminator"
SRC_URI="https://github.com/gnome-terminator/terminator/tarball/b61d877bb5857bd3f1ea4750d9768e8c4f9208fa -> terminator-2.1.3-b61d877.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	dev-libs/glib:2
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	gnome-base/gsettings-desktop-schemas
	x11-libs/gtk+:3
	x11-libs/vte:2.91[introspection]
"
BDEPEND="
	dev-util/intltool
	sys-devel/gettext
"

PATCHES=(
	"${FILESDIR}"/terminator-1.91-desktop.patch
)

post_src_unpack() {
	mv "${WORKDIR}"/gnome-terminator-terminator-* "${S}" || die
}

src_prepare() {
	xdg_environment_reset
	sed -i -e '/pytest-runner/d' setup.py || die
	distutils-r1_src_prepare
}


pkg_postinst() {
	xdg_pkg_postinst

	optfeature "D-Bus" dev-python/dbus-python
	optfeature "desktop notifications" "x11-libs/libnotify[introspection]"
	optfeature "global keyboard shortcuts" "dev-libs/keybinder:3[introspection]"
}