# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt OpenSSH user password prompt tool"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/lxqt-openssh-askpass/tarball/99aa2b3f65ba0eb1755ea201c1d64e8acdf351bc -> lxqt-openssh-askpass-1.3.0-99aa2b3.tar.gz"
KEYWORDS="*"

LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"

BDEPEND="
	dev-qt/linguist-tools:5
	dev-util/lxqt-build-tools
"
DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	=lxqt-base/liblxqt-$(ver_cut 1-2)*
"
RDEPEND="${DEPEND}"

src_install() {
	cmake_src_install
	doman man/*.1

	newenvd - 99${PN} <<- _EOF_
		SSH_ASKPASS='${EPREFIX}/usr/bin/lxqt-openssh-askpass'
	_EOF_
}
