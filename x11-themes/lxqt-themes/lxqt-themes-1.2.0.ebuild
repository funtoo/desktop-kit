# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="LXQt Themes"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/lxqt-themes/releases/download/1.2.0/lxqt-themes-1.2.0.tar.xz -> lxqt-themes-1.2.0.tar.xz"
KEYWORDS="*"

LICENSE="LGPL-2.1+"
SLOT="0"

BDEPEND="dev-util/lxqt-build-tools"