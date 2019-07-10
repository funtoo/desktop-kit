EAPI=4

inherit rpm multilib

DESCRIPTION="Brother DCP-8250DN LPR+cupswrapper drivers"
HOMEPAGE="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-7065DN"
PV=${PV%.*}-${PV##*.} 
SRC_URI="http://download.brother.com/welcome/dlf005566/dcp8250dnlpr-${PV}.i386.rpm
		http://download.brother.com/welcome/dlf005568/dcp8250dncupswrapper-${PV}.i386.rpm"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="strip"

DEPEND="net-print/cups
		app-text/a2ps"
RDEPEND="${DEPEND}"

S="${WORKDIR}" # Portage will bitch about missing $S so lets pretend that we have vaild $S.

src_unpack() {
	rpm_unpack ${A}
}

#src_install() {
#	has_multilib_profile && ABI=x86
#
#	dosbin "${WORKDIR}/opt/brother/Printers/DCP8250DN/cupswrapper/brcupsconfig4"
#
#	cp -r usr "${D}" || die
#
#	mkdir -p ${D}/usr/libexec/cups/filter || die
#	( cd ${D}/usr/libexec/cups/filter/ && ln -s ../../../../opt/brother/Printers/DCP8250DN/lpd/filter_DCP8250DN brlpdwrapperDCP8250DN ) || die
#	mkdir -p ${D}/usr/share/cups/model || die
#	( cd ${D}/usr/share/cups/model && ln -s ../../../.././opt/brother/Printers/DCP8250DN/cupswrapper/brother-DCP-8250DN-cups-en.ppd ) || die
#}

src_install() {
	cp -r opt "${D}" || die

    exeinto /opt/bin
	doexe opt/brother/Printers/DCP8250DN/lpd/brprintconflsr3
    #doexe usr/bin/brprintconf_DCP8250DN

    dosym ../../../../opt/brother/Printers/DCP8250DN/lpd/filter_DCP8250DN \
          /usr/libexec/cups/filter/brother_lpdwrapper_DCP8250DN
    dosym ../../../../opt/brother/Printers/DCP8250DN/cupswrapper/brother-DCP-8250DN-cups-en.ppd \
          /usr/share/cups/model/brother-DCP-8250DN-cups-en.ppd
}

pkg_postinst () {
	ewarn "You really wanna read this."
	echo
	elog "For add your printer to cups, it is needed to run the wrapper:"
	elog "      /usr/local/Brother/Printer/DCP7065DN/cupswrapper/cupswrapperDCP7065DN-2.0.4"
	elog
	elog "You need to use brprintconflsr4 to change printer options"
	elog "For example, you should set paper type to A4 right after instalation"
	elog "or your prints will be misaligned!"
	elog
	elog "Set A4 Paper type:"
	elog "		brprintconflsr4 -pt A4"
	elog "Set 'Fast Normal' quality:"
	elog "		brprintconflsr3 -reso 300x300dpi"
	elog
	elog "For more options just execute brprintconf_dcpj315w as root"
	elog "You can check current settings in:"
	elog "		/usr/local/Brother/Printer/DCP7065DN/inf/brdcpj315wrc"
	elog "To add printer over WIFI add use LPD or SOCKET protocol, for example:"
	elog "      lpd://<host_or_ip>/BINARY_P1"
	elog "            - or -"
	elog "      socket://<host_or_ip>:9100"
}

# TODO: Write alternative to filterdcpj315w or patch it for the security manner.
