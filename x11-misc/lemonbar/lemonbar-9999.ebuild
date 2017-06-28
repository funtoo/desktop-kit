# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN="bar"
DESCRIPTION="A featherweight, lemon-scented, bar based on xcb"
HOMEPAGE="https://github.com/LemonBoy/bar"

if [[ ${PV} == "9999" ]]; then
    inherit git-r3

    SRC_URI=""
    EGIT_REPO_URI="https://github.com/LemonBoy/${MY_PN}.git"
else
    SRC_URI="https://github.com/LemonBoy/${MY_PN}/archive/v${PV}.tar.gz"
    S="${WORKDIR}/${MY_PN}-${PV}"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/libxcb
		>=dev-lang/perl-5"
RDEPEND="x11-libs/libxcb"

src_prepare() {
    default
    sed -i -e 's/-Os//' Makefile || die "Sed failed"
}
