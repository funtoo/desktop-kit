# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
MacTypes-sys-2.1.0
aho-corasick-0.6.6
ansi_term-0.11.0
antidote-1.0.0
arrayref-0.3.4
arrayvec-0.4.7
atty-0.2.11
autocfg-0.1.2
backblaze-b2-0.1.8
base64-0.5.2
base64-0.6.0
base64-0.9.2
bindgen-0.37.4
bitflags-1.0.3
blake2-0.7.1
blob-0.2.0
block-buffer-0.3.3
byte-tools-0.2.0
byteorder-1.2.3
bytevec-0.2.0
bzip2-0.3.3
bzip2-sys-0.1.6
cc-1.0.18
cexpr-0.2.3
cfg-if-0.1.4
chrono-0.4.5
clang-sys-0.23.0
clap-2.32.0
cloudabi-0.0.3
constant_time_eq-0.1.3
core-foundation-0.5.1
core-foundation-sys-0.5.1
crossbeam-0.4.1
crossbeam-channel-0.2.3
crossbeam-deque-0.5.1
crossbeam-epoch-0.5.1
crossbeam-utils-0.4.1
crossbeam-utils-0.5.0
crypto-mac-0.5.2
dangerous_option-0.2.0
digest-0.7.5
dtoa-0.4.3
env_logger-0.5.11
fake-simd-0.1.2
flate2-1.0.1
foreign-types-0.3.2
foreign-types-shared-0.1.1
fs2-0.4.3
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
gcc-0.3.54
generic-array-0.9.0
glob-0.2.11
hex-0.2.0
hex-0.3.2
httparse-1.3.2
humantime-1.1.1
hyper-0.10.13
hyper-native-tls-0.3.0
idna-0.1.5
isatty-0.1.8
itoa-0.4.2
kernel32-sys-0.2.2
language-tags-0.2.2
lazy_static-1.0.2
libc-0.2.48
libloading-0.5.0
libsodium-sys-0.1.0
linked-hash-map-0.5.1
log-0.3.9
log-0.4.6
matches-0.1.7
memchr-1.0.2
memchr-2.0.1
memoffset-0.2.1
mime-0.2.6
miniz-sys-0.1.10
native-tls-0.2.2
nodrop-0.1.12
nom-3.2.1
num-integer-0.1.39
num-traits-0.2.5
num_cpus-1.8.0
openssl-0.10.16
openssl-probe-0.1.2
openssl-sys-0.9.40
owning_ref-0.3.3
parking_lot-0.5.5
parking_lot_core-0.2.14
peeking_take_while-0.1.2
percent-encoding-1.0.1
pkg-config-0.3.12
proc-macro2-0.3.5
proc-macro2-0.4.9
quick-error-1.2.2
quote-0.5.2
quote-0.6.4
rand-0.4.2
rand-0.5.4
rand-0.6.4
rand_chacha-0.1.1
rand_core-0.2.1
rand_core-0.3.1
rand_core-0.4.0
rand_hc-0.1.0
rand_isaac-0.1.1
rand_os-0.1.1
rand_pcg-0.1.1
rand_xorshift-0.1.1
rdedup-cdc-0.1.0
rdrand-0.4.0
redox_syscall-0.1.40
redox_termios-0.1.1
regex-1.0.2
regex-syntax-0.6.2
remove_dir_all-0.5.1
rpassword-2.0.0
rust-lzma-0.2.1
rustc_version-0.2.3
safemem-0.2.0
same-file-1.0.2
schannel-0.1.13
scopeguard-0.3.3
security-framework-0.2.2
security-framework-sys-0.2.3
semver-0.9.0
semver-parser-0.7.0
serde-1.0.70
serde_derive-1.0.70
serde_json-1.0.24
serde_yaml-0.7.5
sha2-0.7.1
slog-2.3.2
slog-async-2.3.0
slog-perf-0.2.0
slog-term-2.4.0
smallvec-0.6.3
sodiumoxide-0.1.0
stable_deref_trait-1.1.0
strsim-0.7.0
syn-0.14.5
take_mut-0.2.2
tempfile-3.0.5
term-0.5.1
termcolor-1.0.1
termion-1.5.1
textwrap-0.10.0
thread_local-0.3.5
time-0.1.40
traitobject-0.1.0
typeable-0.1.2
typenum-1.10.0
ucd-util-0.1.1
unicase-1.4.2
unicode-bidi-0.3.4
unicode-normalization-0.1.7
unicode-width-0.1.5
unicode-xid-0.1.0
unreachable-1.0.0
url-1.7.1
utf8-ranges-1.0.0
vcpkg-0.2.4
vec_map-0.8.1
version_check-0.1.4
void-1.0.2
walkdir-2.1.4
which-1.0.5
winapi-0.2.8
winapi-0.3.5
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-1.0.0
yaml-rust-0.4.0
zstd-0.4.19+zstd.1.3.5
zstd-safe-1.4.4+zstd.1.3.5
zstd-sys-1.4.4+zstd.1.3.5
"

inherit cargo

DESCRIPTION="data deduplication with compression and public key encryption"
HOMEPAGE="https://github.com/dpc/rdedup"
SRC_URI="https://api.github.com/repos/dpc/rdedup/tarball/refs/tags/rdedup-v3.1.1 -> rdedup-3.1.1.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 BSD ISC MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="*"

RDEPEND=">=dev-libs/libsodium-1.0.11:="
DEPEND="${RDEPEND}"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/dpc-rdedup-* ${S} || die
}

src_prepare() {
	default

	export LIBCLANG_PATH=$(dirname $(clang --print-file-name=libclang.so))
	# ln -sf "${WORKDIR}/cargo_home/gentoo/rdedup-lib-${PV}" lib || die
}

src_install() {
	cargo_src_install
	dodoc {CHANGELOG,README}.md
}