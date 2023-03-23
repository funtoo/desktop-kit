# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A flat Material Design theme for GTK"
HOMEPAGE="https://github.com/vinceliuice/vimix-gtk-themes"

SRC_URI="https://github.com/vinceliuice/vimix-gtk-themes/tarball/a0da43a593a13bbe3771a613946ca6ea64b21b4c -> vimix-gtk-themes-2023.03.23-a0da43a.tar.gz"
KEYWORDS="*"

LICENSE="GPL-3"
SLOT="0"
IUSE="gtk2"

BDEPEND="dev-lang/sassc"
DEPEND="
	x11-libs/gtk+:3
	gtk2? (
		"x11-themes/gtk-engines"
		"x11-themes/gtk-engines-murrine"
	)
"
RDEPEND="${DEPEND}"

src_unpack() {
	default
	rm -rf ${S}
	mv ${WORKDIR}/vinceliuice-vimix-gtk-themes-* ${S} || die
}

src_install() {
	mkdir -p "${ED}"/usr/share/themes
	./install.sh -t all -s all -d "${ED}"/usr/share/themes || die
}