# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV2=$(ver_cut 1-2)
MY_PV3=$(ver_cut 1-3)
MY_PV4=$(ver_cut 4)
SRC_URI="https://mirror1.cs-georgetown.net/tdf/libreoffice/stable/7.6.7/rpm/x86_64/LibreOffice_7.6.7_Linux_x86-64_rpm.tar.gz -> LibreOffice_7.6.7_Linux_x86-64_rpm.tar.gz"

inherit prefix rpm toolchain-funcs xdg-utils

DESCRIPTION="A full office productivity suite. Binary package"
HOMEPAGE="https://www.libreoffice.org"

IUSE="gnome +gtk java kde"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"

BIN_COMMON_DEPEND="
	=app-text/libexttextcat-3.4*
	=app-text/libmwaw-0.3*
	>=dev-libs/icu-64.2
	>=media-gfx/graphite2-1.3.10
	>=media-libs/harfbuzz-2.6.4:0=[graphite,icu]
"

# To create a list of what external libraries are needed for this package, you can create a report as follows:
# cd /var/db/pkg/app-office/libreoffice-bin-<version>
# for x in $(cat NEEDED.ELF.2  | cut -f5 -d\; | sed -e 's/,/\n/g' | sort -u); do if [ -z "$(grep $x CONTENTS)" ]; then echo ==== $x; (cd /var/db/pkg; grep -r $x | grep CONTENTS: ); fi; done
# This will show you a list of all libraries that are not already bundled with libreoffice-bin, and show you a
# list of candidate packages for these libraries.

RDEPEND="
	$BIN_COMMON_DEPEND
	app-crypt/mit-krb5
	dev-libs/glib
	dev-libs/nspr
	dev-libs/nss
	media-libs/fontconfig
	media-libs/freetype
	media-libs/gst-plugins-base
	media-libs/gstreamer
	net-dns/avahi
	net-print/cups
	sys-apps/dbus
	sys-devel/gcc
	sys-libs/e2fsprogs-libs
	sys-libs/glibc
	sys-libs/zlib
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libXext
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXrender
	app-arch/unzip
	app-arch/zip
	!app-office/libreoffice
	!app-office/openoffice
	media-fonts/liberation-fonts
	java? ( >=virtual/jre-1.6 )
	gtk? (
		dev-libs/atk
		x11-libs/cairo
		x11-libs/gdk-pixbuf
		x11-libs/gtk+
		x11-libs/pango
	)
	kde? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtx11extras:5
		kde-frameworks/kconfig:5
		kde-frameworks/kcoreaddons:5
		kde-frameworks/ki18n:5
		kde-frameworks/kio:5
		kde-frameworks/kwindowsystem:5
	)
"

PDEPEND="
	=app-office/libreoffice-l10n-${PV}*
"

DEPEND="${COMMON_DEPEND}"

REQUIRED_USE="gnome? ( gtk )"

RESTRICT="test strip"

S="${WORKDIR}"

#PYTHON_UPDATER_IGNORE="1"

QA_PREBUILT="/usr/*"

src_prepare() {
	cp "${FILESDIR}"/50-${PN} "${T}"
	eprefixify "${T}"/50-${PN}
	default

	local rpmdir
	use amd64 && rpmdir="LibreOffice_${PV}_Linux_x86-64_rpm/RPMS/"
	[[ -d ${rpmdir} ]] || die "Missing directory: ${rpmdir}"

	# Unpack RPMs but consider USE flags
	for rpms in ./${rpmdir}/*.rpm; do
		if [[ ${rpms} == "./${rpmdir}/libobasis${MY_PV2}-kde-integration-${PV}-${MY_PV4}.x86_64.rpm" ]]; then
			use kde && rpm_unpack ${rpms}
		elif [[ ${rpms} == "./${rpmdir}/libobasis${MY_PV2}-gnome-integration-${PV}-${MY_PV4}.x86_64.rpm" ]]; then
			use gtk && rpm_unpack ${rpms}
		else
			rpm_unpack ${rpms}
		fi
	done

	# Remove files that require java if USE flag not set
	use java || rm -f ./opt/libreoffice${MY_PV2}/program/libofficebean.so
}

src_configure() { :; }

src_compile() { :; }

src_install() {
	local progdir=/usr/$(get_libdir)/libreoffice
	dodir ${progdir}
	mv "${S}"/opt/libreoffice"${MY_PV2}"/* "${ED}"/"${progdir}"/

	rm ./usr/bin/libreoffice"${MY_PV2}"
	dosym "${progdir}"/program/soffice /usr/bin/libreoffice"${MY_PV2}"
	dosym "${progdir}"/program/soffice /usr/bin/libreoffice
	dosym "${progdir}"/program/soffice /usr/bin/loffice
	dosym "${progdir}"/program/soffice /usr/bin/soffice

	for prog in base impress calc math writer draw; do
		dosym "${progdir}"/program/s"${prog}" /usr/bin/lo"${prog}"
	done

	rm ./usr/share/applications/*
	mkdir -p "${ED}"/usr/share/applications

	for prog in base impress startcenter calc math writer draw xsltfilter; do
		cp "${ED}"/"${progdir}"/share/xdg/"${prog}".desktop "${ED}"/usr/share/applications/libreoffice"${MY_PV2}"-"${prog}".desktop
	done

	doins -r usr

	# prevent revdep-rebuild from attempting to rebuild all the time
	insinto /etc/revdep-rebuild && doins "${T}/50-${PN}"
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update

	use java || \
		ewarn 'If you plan to use lbase application you should enable java or you will get various crashes.'
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}