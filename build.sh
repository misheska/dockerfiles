#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

build() {
  image_name=$1
  build_dir=$2

  echo "=> Building ${image_name} in ${build_dir}"
  docker build -t "${image_name}:latest" "${build_dir}"
  echo "=> Done building ${image_name}"
}

main() {
  build "${PWD##*/}" "."
}

main "$@"
