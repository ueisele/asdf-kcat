#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/edenhill/kcat"
TOOL_NAME="kcat"
TOOL_TEST="kcat -h"
TOOL_MIN_VERSION="1.5.0"

LIBRDKAFKA_GH_REPO="https://github.com/edenhill/librdkafka"
LIBRDKAFKA_MIN_VERSION="1.6.0"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

version_greater_equal() {
	printf '%s\n%s\n' "$2" "$1" | sort --check=quiet --version-sort
}

list_librdkafka_github_tags() {
	git ls-remote --tags --refs "${LIBRDKAFKA_GH_REPO}" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed -rn 's/^v([0-9\.]*)$/\1/p'
}

filter_librdkafka_versions() {
	while read version; do
		if version_greater_equal "${version}" "${LIBRDKAFKA_MIN_VERSION}"; then
			echo ${version}
		fi
	done <"${1:-/dev/stdin}"
}

list_tool_github_tags() {
	git ls-remote --tags --refs "${GH_REPO}" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed -rn 's/^([0-9\.]*)$/\1/p'
}

filter_tool_versions() {
	while read version; do
		if version_greater_equal "${version}" "${TOOL_MIN_VERSION}"; then
			echo ${version}
		fi
	done <"${1:-/dev/stdin}"
}

list_all_versions() {
	for tool_version in $(list_tool_github_tags | filter_tool_versions); do
		for librdkafka_version in $(list_librdkafka_github_tags | filter_librdkafka_versions); do
			echo "${tool_version}-${librdkafka_version}"
		done
	done
}

download_release() {
	local version filename toolversion url
	version="$1"
	filename="$2"

	tool_version="${version%-*}"

	url="$GH_REPO/archive/${tool_version}.tar.gz"

	echo "* Downloading $TOOL_NAME release $tool_version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"
	local librdkafka_version="${version#*-}"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		echo "* Installing $TOOL_NAME release $version..."

		podman build -t asdf-kcat-build \
			-v "$(realpath "${ASDF_DOWNLOAD_PATH}")":/usr/src/kcat:z \
			--build-arg BUILD_TIMESTAMP="$(date --iso-8601=seconds)" \
			--build-arg LIBRDKAFKA_VERSION="v${librdkafka_version}" \
			-f "${plugin_dir}/container/Containerfile" "${plugin_dir}/container"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$ASDF_DOWNLOAD_PATH/$tool_cmd" || fail "Expected $ASDF_DOWNLOAD_PATH/$tool_cmd to be executable."

		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/kcat "$install_path"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
