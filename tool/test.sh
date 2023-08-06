#!/usr/bin/env bash

set -e -o pipefail

dart pub global activate coverage

flutter test --coverage
lcov --list coverage/lcov.info

# Disable temporarily till the apt dependency libgtk-3-dev is fixed
if [[ ! $GITHUB_ACTIONS ]]; then
  pushd examples/counter &> /dev/null
  flutter pub get
  if [[ $(uname -s) =~ ^"Linux" ]]; then
    OS_NAME="linux"
    if [[ $GITHUB_ACTIONS ]]; then
      # https://github.com/flutter/flutter/issues/93567
      # https://stackoverflow.com/a/76620317/3302026
      DISPLAY_SERVER="xvfb-run"
    fi
  elif [[ $(uname -s) =~ ^"Darwin" ]]; then
    OS_NAME="macos"
  elif [[ $(uname -s) =~ ^"MINGW" ]]; then
    OS_NAME="windows"
  fi
  $DISPLAY_SERVER flutter test -d "$OS_NAME" integration_test
  popd &> /dev/null
fi
