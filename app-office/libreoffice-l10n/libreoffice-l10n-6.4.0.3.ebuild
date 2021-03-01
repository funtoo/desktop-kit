# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="Translations for the Libreoffice suite"
HOMEPAGE="https://www.libreoffice.org"
BASE_SRC_URI="https://downloadarchive.documentfoundation.org/${PN/-l10n/}/old/${PV}/rpm"

LICENSE="|| ( LGPL-3 MPL-1.1 )"
SLOT="0"
KEYWORDS="*"
IUSE="offlinehelp"

LANGUAGES_HELP=" am ar ast bg bn-IN bn bo bs ca-valencia ca cs da de dz el en-GB en:en-US en-ZA eo es et eu fi fr gl gu he hi hr hu id is it ja ka km ko lo lt lv mk nb ne nl nn om pl pt-BR pt ro ru si sid sk sl sq sv ta tg tr ug uk vi zh-CN zh-TW "
LANGUAGES=" af am ar as ast be bg bn-IN bn bo br brx bs ca-valencia ca cs cy da de dgo dsb dz el en-GB en-ZA eo es et eu fa fi fr fy ga gd gl gu gug he hi hr hsb hu id is it ja ka kab kk km kmr-Latn kn ko kok ks lb lo lt lv mai mk ml mn mni mr my nb ne nl nn nr nso oc om or pa:pa-IN pl pt-BR pt ro ru rw sa:sa-IN sat sd si sid sk sl sq sr-Latn sr ss st sv sw-TZ szl ta te tg th tn tr ts tt ug uk uz ve vec vi xh zh-CN zh-TW zu "

for lang in ${LANGUAGES_HELP}; do
	helppack="offlinehelp? ( ${BASE_SRC_URI}/x86_64/LibreOffice_${PV}_Linux_x86-64_rpm_helppack_${lang#*:}.tar.gz )"
	SRC_URI+=" l10n_${lang%:*}? ( ${helppack} )"
done
for lang in ${LANGUAGES}; do
	if [[ ${lang%:*} != en ]]; then
		langpack="${BASE_SRC_URI}/x86_64/LibreOffice_${PV}_Linux_x86-64_rpm_langpack_${lang#*:}.tar.gz"
		SRC_URI+=" l10n_${lang%:*}? ( ${langpack} )"
	fi
	IUSE+=" l10n_${lang%:*}"
done
unset lang helppack langpack

RDEPEND+="app-text/hunspell"

RESTRICT="strip"

S="${WORKDIR}"

src_prepare() {
	default

	local lang dir rpmdir

	# First remove dictionaries, we want to use system ones.
	find "${S}" -name *dict*.rpm -delete || die "Failed to remove dictionaries"

	for lang in ${LANGUAGES}; do
		# break away if not enabled
		use l10n_${lang%:*} || continue

		dir=${lang#*:}

		# for english we provide just helppack, as translation is always there
		if [[ ${lang%:*} != en ]]; then
			rpmdir="LibreOffice_${PV}_Linux_x86-64_rpm_langpack_${dir}/RPMS/"
			[[ -d ${rpmdir} ]] || die "Missing directory: ${rpmdir}"
			rpm_unpack ./${rpmdir}/*.rpm
		fi
		if [[ "${LANGUAGES_HELP}" =~ " ${lang} " ]] && use offlinehelp; then
			rpmdir="LibreOffice_${PV}_Linux_x86-64_rpm_helppack_${dir}/RPMS/"
			[[ -d ${rpmdir} ]] || die "Missing directory: ${rpmdir}"
			rpm_unpack ./${rpmdir}/*.rpm
		fi
	done
}

src_configure() { :; }
src_compile() { :; }

src_install() {
	local dir="${S}"/opt/${PN/-l10n/}$(ver_cut 1-2)/
	# Condition required for people who do not install anything e.g. no l10n
	# or just english with no offlinehelp.
	if [[ -d "${dir}" ]] ; then
		insinto /usr/$(get_libdir)/${PN/-l10n/}/
		doins -r "${dir}"/*
	fi
	# remove extensions that are in l10n for some weird reason
	rm -rf "${ED}"/usr/$(get_libdir)/${PN/-l10n/}/share/extensions/ || \
		die "Failed to remove extensions"
}