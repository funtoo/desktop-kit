# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit fcaps meson

DESCRIPTION=""
HOMEPAGE="https://i3wm.org/i3status/"
SRC_URI="https://api.github.com/repos/i3/i3status/tarball/refs/tags/2.14 -> i3status-2.14-8fc0f6e53119964ce2e9b4ab1ceb971476f53a8a.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="doc pulseaudio"

BDEPEND="virtual/pkgconfig"
RDEPEND="
	>=dev-libs/yajl-2.0.2
	dev-libs/confuse:=
	dev-libs/libnl:3
	media-libs/alsa-lib
	pulseaudio? ( || ( media-sound/pulseaudio media-sound/apulse[sdk] ) )
"

DEPEND="
	${RDEPEND}
	app-text/asciidoc
	app-text/xmlto
"

post_src_unpack() {
	mv "${WORKDIR}/"i3-i3status* "${S}" || die
}

PATCHES=(
)


src_configure() {
	local emesonargs=(
		-Ddocdir="${EPREFIX}"/usr/share/doc/${PF}
		$(meson_use doc docs)
		$(meson_use doc mans)
		$(meson_use pulseaudio)
	)

	meson_src_configure
}



pkg_postinst() {
	fcaps cap_net_admin usr/bin/${PN}

	elog "${PN} can be used with any of the following programs:"
	elog "   i3bar (x11-wm/i3)"
	elog "   x11-misc/xmobar"
	elog "   x11-misc/dzen"
	elog "Please refer to manual: man ${PN}"
}