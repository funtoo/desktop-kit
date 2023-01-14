# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3+ )
PYTHON_REQ_USE="sqlite(+)"

inherit gnome3-utils python-single-r1 xdg

DESCRIPTION="Completion input method for IBus"
HOMEPAGE="https://mike-fabian.github.io/ibus-typing-booster"
SRC_URI="https://github.com/mike-fabian/ibus-typing-booster/releases/download/2.19.13/ibus-typing-booster-2.19.13.tar.gz -> ibus-typing-booster-2.19.13.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	dev-libs/m17n-lib
	$(python_gen_cond_dep '
		app-i18n/ibus[python(+),${PYTHON_USEDEP}]
		dev-python/dbus-python[${PYTHON_USEDEP}]
		dev-python/pyenchant[${PYTHON_USEDEP}]
		dev-python/pygobject:3[${PYTHON_USEDEP}]
		dev-python/pyxdg[${PYTHON_USEDEP}]
	')"
RDEPEND="${DEPEND}
	>=dev-db/m17n-db-1.7"
BDEPEND="sys-devel/gettext
	virtual/pkgconfig"

src_prepare() {
	default

	sed -i "s|/usr\(/bin/sh\)|\1|" {engine,setup}/*.in
}

pkg_preinst() {
	xdg_pkg_preinst
	gnome3_schemas_savelist
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome3_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome3_schemas_update
}