# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Deduplicated, encrypted, authenticated and compressed backups"
HOMEPAGE="https://borgbackup.readthedocs.io/ https://pypi.org/project/borgbackup/"
SRC_URI="https://files.pythonhosted.org/packages/93/87/98299ebfe41687f77ea01bd0e9eba2f43baa30f1b9256345134fd77286d3/borgbackup-1.2.8.tar.gz -> borgbackup-1.2.8.tar.gz"

DEPEND="
	!!app-office/borg
	app-arch/lz4
	virtual/acl
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]"
RDEPEND="
	${DEPEND}
	dev-python/llfuse[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]"
IUSE="libressl"
SLOT="0"
LICENSE="BSD"
KEYWORDS="*"
S="${WORKDIR}/borgbackup-1.2.8"

python_prepare_all() {
	# allow use of new (renamed) msgpack
	sed -i "s|'msgpack-python.*',||g" setup.py || die
	distutils-r1_python_prepare_all
}

src_compile() {
	BORG_OPENSSL_PREFIX=/usr distutils-r1_src_compile
}

src_install() {
	BORG_OPENSSL_PREFIX=/usr distutils-r1_src_install
}
