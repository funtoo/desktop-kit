# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Deduplicated, encrypted, authenticated and compressed backups"
HOMEPAGE="https://borgbackup.readthedocs.io/ https://pypi.org/project/borgbackup/"
SRC_URI="https://files.pythonhosted.org/packages/31/1a/da104fca8bac26dd689c58aed052c4aa50312bab13785dda82f061832852/borgbackup-1.1.18.tar.gz -> borgbackup-1.1.18.tar.gz
"

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
S="${WORKDIR}/borgbackup-1.1.18"

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
