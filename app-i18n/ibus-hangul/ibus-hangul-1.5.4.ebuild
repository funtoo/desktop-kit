# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit gnome3-utils python-single-r1 xdg virtualx

DESCRIPTION="Korean Hangul engine for IBus"
HOMEPAGE="https://github.com/libhangul/ibus-hangul/wiki"
SRC_URI="https://github.com/libhangul/ibus-hangul/releases/download/1.5.4/ibus-hangul-1.5.4.tar.gz -> ibus-hangul-1.5.4.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="nls"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep '
		app-i18n/ibus[python(+),${PYTHON_USEDEP}]
		dev-python/pygobject:3[${PYTHON_USEDEP}]
	')
	>=app-i18n/libhangul-0.1
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}"
BDEPEND="sys-devel/gettext
	virtual/pkgconfig"

src_configure() {
	econf \
		$(use_enable nls) \
		--with-python=${EPYTHON}
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