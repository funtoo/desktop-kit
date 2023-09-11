# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A Minimal, Configurable, Single-User GTK3 LightDM Greeter"
HOMEPAGE="https://github.com/prikhi/lightdm-mini-greeter"
SRC_URI="https://github.com/prikhi/lightdm-mini-greeter/tarball/0f51aba27048d016fc79f782bffa24a09d248b4b -> lightdm-mini-greeter-0.5.1-0f51aba.tar.gz"
KEYWORDS="*"

LICENSE="GPL-2.0"
SLOT="0"

IUSE=""

RDEPEND="
  x11-libs/gtk+
	x11-misc/lightdm
"

DEPEND="
    ${RDEPEND}
"
BDEPEND="virtual/pkgconfig"

src_prepare() {
  sed -i -e 's/-Werror//' Makefile.am || die
	eapply_user
	eautoreconf
}

post_src_unpack() {
    if [ ! -d "${S}" ]; then
        mv prikhi-lightdm-mini-greeter* "${S}"
    fi
}