# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit distutils-r1
SRC_URI="https://files.pythonhosted.org/packages/97/68/27d96a12f54894223ad6676ce4d215ad61771e3e723580f3ee6e609e17b7/borgbackup-1.1.13.tar.gz"
KEYWORDS="*"

DESCRIPTION="Deduplicating backup program with compression and authenticated encryption"
HOMEPAGE="https://borgbackup.readthedocs.io/"

LICENSE="BSD"
SLOT="0"
IUSE="libressl"

# Unfortunately we have a file conflict with app-office/borg, bug #580402
RDEPEND="
	!!app-office/borg
	app-arch/lz4
	virtual/acl
	dev-python/llfuse[${PYTHON_USEDEP}]
	~dev-python/msgpack-0.5.6[${PYTHON_USEDEP}]
	dev-python/pyzmq[${PYTHON_USEDEP}]
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
"

DEPEND="
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
	${RDEPEND}
"

python_prepare_all() {
	# allow use of new (renamed) msgpack
	sed -i "s|'msgpack-python.*',||g" setup.py || die
	distutils-r1_python_prepare_all
}