#!/usr/bin/env bash
#
set -o errexit

_ME="$(basename "$0")"
_DEPRECATED=1

link() {
  _TARGET="$1"
  _LINK="$2"
  if [[ ! -h "$_LINK" ]]; then
    printf "%s\n" "Linking ${_TARGET} to ${_LINK}..."
    ln -s "${_TARGET}" "${_LINK}"
    printf "%s\n" "Done..."
  else
    printf "%s\n" "Skip ${_TARGET}, target has been linked..."
  fi
}

help() {
  printf "%s\n" "Usage: ${_ME} [file-1] [file-2] [file-n]"
  printf "\t%s\n" "${_ME} without parameter(s)"
  printf "%s" "If you do not specify any file, then the script will find any *.g4 file(s)" \
        "and create a link to all directory inside this repository. If you specify the parameter(s)," \
        "make sure that the file is located inside root directory."
  printf "\n"
}

main() {
  _CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
  if [[ ! -z "$1" && "$1" =~ -h|--help ]]; then
    help
  elif [[ "$#" -eq 0 ]]; then
    # find all g4 files inside this directory
    for _g in *.g4; do
      for _d in */; do
        _TARGET="${_CURRENT_DIR}/${_g}"
        _LINK="${_CURRENT_DIR}/${_d}${_g}"
        link "${_TARGET}" "${_LINK}"
      done
    done
  elif [[ "$#" -gt 0 ]]; then
    for _file in "${@:1}"; do
      for _d in */; do
        if [[ -f "${_CURRENT_DIR}/${_file}" ]]; then
          _TARGET="${_CURRENT_DIR}/${_file}"
          _LINK="${_CURRENT_DIR}/${_d}${_file}"
          link "${_TARGET}" "${_LINK}"
        fi
      done
    done
  fi
}

if [[ "${_DEPRECATED}" == "0" ]]; then
  main "$@"
else
  printf "%s\n" "Sorry... Currently this helper was abandoned."
fi
