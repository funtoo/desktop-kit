# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A flat Material Design theme for GTK"
HOMEPAGE="https://github.com/vinceliuice/vimix-gtk-themes"

SRC_URI="https://github.com/vinceliuice/vimix-gtk-themes/tarball/65f27bc120a58f3c24935ce5682a574e868e29a2 -> vimix-gtk-themes-2024.04.20-65f27bc.tar.gz"
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