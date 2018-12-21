#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
# https://github.com/jessfraz/dockerfiles/blob/master/shellcheck.sh

ERRORS=()

main() {
  for f in $(find . -type f -not -iwholename '*.git*' -not -name "Dockerfile" | sort -u); do
    if file "$f" | grep --quiet shell; then
      {
        shellcheck "$f" && echo "[OK]: sucessfully linted $f"
      } || {
        ERRORS+=("$f")
      }
    fi
  done

  if [ ${#ERRORS[@]} -eq 0 ]; then
    echo "No errors, hooray"
  else
    echo "These files failed shellcheck: ${ERRORS[*]}"
    exit 1
  fi
}

main "$@"
