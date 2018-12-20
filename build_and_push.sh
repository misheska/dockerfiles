#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

build_and_push() {
  docker_repo=$1
  image_name=$2
  build_dir=$3
  git_sha=$4

  echo "=> Building ${image_name} in ${build_dir}"
  docker build -t "${image_name}:${git_sha}" -t "${image_name}:latest" "${build_dir}"
  echo "=> Done building"

  echo "=> Publishing ${image_name} to ${docker_repo}"
  docker push "${image_name}"
  echo "=> Done publishing" 
}

main(){
  DOCKER_REPO="${DOCKER_REPO:-sheska}"
  image_name=${DOCKER_REPO}/${PWD##*/}
  build_dir=.
  git_sha=$(git rev-parse --short HEAD)

  build_and_push "${DOCKER_REPO}" "${image_name}" "${build_dir}" "${git_sha}"
}

main "$@"
