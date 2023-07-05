#!/usr/bin/env bash

set -e -o pipefail

dart pub global activate coverage

flutter test --coverage
lcov --list coverage/lcov.info

# https://github.com/flutter/flutter/issues/93567
pushd examples/counter &> /dev/null
if [[ $(uname -s) =~ ^"Linux" ]]; then
  OS_NAME="linux"
elif [[ $(uname -s) =~ ^"Darwin" ]]; then
  OS_NAME="macos"
elif [[ $(uname -s) =~ ^"MINGW" ]]; then
  OS_NAME="windows"
fi
if [[ -n $OS_NAME ]]; then
  flutter test -d "$OS_NAME" integration_test
fi
popd &> /dev/null
