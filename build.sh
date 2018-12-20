#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

build() {
  image_name=$1
  build_dir=$2

  printf "=> Building ${image_name} in ${build_dir}\n"
  docker build -t "${image_name}:latest" "${build_dir}"
  printf "=> Done building ${image_name}\n"
}

main() {
  build "${PWD##*/}" "."
}

main "$@"
