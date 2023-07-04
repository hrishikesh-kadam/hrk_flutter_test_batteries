#!/usr/bin/env bash

set -e -o pipefail

flutter pub get

dart format --output none --set-exit-if-changed .

flutter analyze

tool/test.sh

dart pub global activate pana
dart pub global run pana --no-warning

dart pub publish --dry-run

git status -s
