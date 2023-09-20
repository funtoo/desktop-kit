# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A flat Material Design theme for GTK"
HOMEPAGE="https://github.com/vinceliuice/vimix-gtk-themes"

SRC_URI="https://github.com/vinceliuice/vimix-gtk-themes/tarball/194b6ab4404a0b748e0c964c1f9ca8bb075934f8 -> vimix-gtk-themes-2023.09.09-194b6ab.tar.gz"
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