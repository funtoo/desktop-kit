# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler-1.0.2
antidote-1.0.0
atty-0.2.14
autocfg-1.0.1
backblaze-b2-0.1.8
base64-0.5.2
base64-0.9.3
base64-0.12.3
bitflags-1.2.1
blake2-0.9.1
block-buffer-0.9.0
byteorder-1.4.3
bytevec-0.2.0
bzip2-0.4.3
bzip2-sys-0.1.11+1.0.8
cc-1.0.69
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
clap-3.0.0-beta.4
clap_derive-3.0.0-beta.4
core-foundation-0.9.1
core-foundation-sys-0.8.2
cpufeatures-0.1.5
crc32fast-1.2.1
crossbeam-0.7.3
crossbeam-channel-0.4.4
crossbeam-channel-0.5.1
crossbeam-deque-0.7.4
crossbeam-epoch-0.8.2
crossbeam-queue-0.2.3
crossbeam-utils-0.7.2
crossbeam-utils-0.8.5
crypto-mac-0.8.0
dangerous_option-0.2.0
digest-0.9.0
dirs-next-2.0.0
dirs-sys-next-0.1.2
dtoa-0.4.8
ed25519-1.2.0
flate2-1.0.20
foreign-types-0.3.2
foreign-types-shared-0.1.1
fs2-0.4.3
generic-array-0.14.4
getrandom-0.1.16
getrandom-0.2.3
hashbrown-0.11.2
heck-0.3.3
hermit-abi-0.1.19
hex-0.4.3
httparse-1.4.1
hyper-0.10.16
hyper-native-tls-0.3.0
idna-0.1.5
indexmap-1.7.0
itoa-0.4.7
jobserver-0.1.23
language-tags-0.2.2
lazy_static-1.4.0
libc-0.2.98
libsodium-sys-0.2.7
linked-hash-map-0.5.4
log-0.3.9
log-0.4.14
matches-0.1.8
maybe-uninit-2.0.0
memoffset-0.5.6
mime-0.2.6
miniz_oxide-0.4.4
native-tls-0.2.7
num-integer-0.1.44
num-traits-0.2.14
num_cpus-1.13.0
once_cell-1.8.0
opaque-debug-0.3.0
openssl-0.10.35
openssl-probe-0.1.4
openssl-sys-0.9.65
os_str_bytes-3.1.0
owning_ref-0.4.1
percent-encoding-1.0.1
pkg-config-0.3.19
ppv-lite86-0.2.10
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.28
quote-1.0.9
rand-0.7.3
rand-0.8.4
rand_chacha-0.2.2
rand_chacha-0.3.1
rand_core-0.5.1
rand_core-0.6.3
rand_hc-0.2.0
rand_hc-0.3.1
rdedup-cdc-0.1.0
redox_syscall-0.2.10
redox_users-0.4.0
remove_dir_all-0.5.3
rpassword-4.0.5
rust-lzma-0.5.1
rustversion-1.0.5
ryu-1.0.5
safemem-0.3.3
same-file-1.0.6
schannel-0.1.19
scopeguard-1.1.0
security-framework-2.3.1
security-framework-sys-2.3.0
serde-1.0.127
serde_derive-1.0.127
serde_json-1.0.66
serde_yaml-0.8.17
sha2-0.9.5
signature-1.3.1
slog-2.7.0
slog-async-2.7.0
slog-perf-0.2.0
slog-term-2.8.0
sodiumoxide-0.2.7
stable_deref_trait-1.2.0
strsim-0.10.0
subtle-2.4.1
syn-1.0.74
take_mut-0.2.2
tempfile-3.2.0
term-0.7.0
termcolor-1.1.2
textwrap-0.14.2
thread_local-1.1.3
time-0.1.43
tinyvec-1.3.1
tinyvec_macros-0.1.0
traitobject-0.1.0
typeable-0.1.2
typenum-1.13.0
unicase-1.4.2
unicode-bidi-0.3.5
unicode-normalization-0.1.19
unicode-segmentation-1.8.0
unicode-width-0.1.8
unicode-xid-0.2.2
url-1.7.2
vcpkg-0.2.15
vec_map-0.8.2
version_check-0.1.5
version_check-0.9.3
walkdir-2.3.2
wasi-0.9.0+wasi-snapshot-preview1
wasi-0.10.2+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
yaml-rust-0.4.5
zstd-0.9.0+zstd.1.5.0
zstd-safe-4.1.1+zstd.1.5.0
zstd-sys-1.6.1+zstd.1.5.0
"

inherit cargo

DESCRIPTION="data deduplication with compression and public key encryption"
HOMEPAGE="https://github.com/dpc/rdedup"
SRC_URI="https://api.github.com/repos/dpc/rdedup/tarball/refs/tags/v3.2.1 -> rdedup-3.2.1.tar.gz
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