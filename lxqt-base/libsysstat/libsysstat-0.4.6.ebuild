# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Qt GUI for System Statistics"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/libsysstat/tarball/b8a9ed1173db6b622a1ebc47f29a9a9e8e6c4f23 -> libsysstat-0.4.6-b8a9ed1.tar.gz"
KEYWORDS="*"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"

BDEPEND="dev-util/lxqt-build-tools"
DEPEND="dev-qt/qtcore:5"
RDEPEND="${DEPEND}"
