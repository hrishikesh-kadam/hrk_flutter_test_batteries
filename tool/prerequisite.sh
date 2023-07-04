#!/usr/bin/env bash

set -e -o pipefail

source ./tool/shell/logs-env-posix.sh

check_command_on_path() {
  if [[ ! -x $(command -v "$1") ]]; then
    error_log_with_exit "$1 command not accessible from PATH" 1
  fi
}

check_directory_on_path() {
  local directory=$1
  if [[ $(uname -s) =~ ^"MINGW" ]]; then
    directory=$(cygpath "$directory")
  fi
  if [[ ! $PATH =~ $directory ]]; then
    error_log_with_exit "$1 directory not found on PATH" 1
  fi
}

check_command_on_path flutter

if [[ $(uname -s) =~ ^"Darwin" ]]; then
  check_command_on_path brew
elif [[ $(uname -s) =~ ^"MINGW" ]]; then
  check_command_on_path pwsh
  if ! pwsh -NoProfile ./tool/shell/is-admin.ps1; then
    error_log_with_exit "Please run this script from Elevated Session" 1
  fi
  check_command_on_path choco
fi

if [[ ! -x $(command -v lcov) ]]; then
  if [[ $(uname -s) =~ ^"Linux" ]]; then
    sudo apt install lcov
  elif [[ $(uname -s) =~ ^"Darwin" ]]; then
    brew install lcov
  elif [[ $(uname -s) =~ ^"MINGW" ]]; then
    choco install lcov
    : "${ChocolateyInstall:=C:\ProgramData\chocolatey}"
    LCOV_ROOT_WIN="$ChocolateyInstall\lib\lcov\tools\bin"
    LCOV_ROOT_NIX=$(cygpath "$LCOV_ROOT_WIN")
    if [[ ! $PATH =~ $LCOV_ROOT_NIX ]]; then
      if [[ $GITHUB_ACTIONS == "true" ]]; then
        echo "$LCOV_ROOT_WIN" >> "$GITHUB_PATH"
        PATH="$LCOV_ROOT_NIX:$PATH"
      else
        # Deliberately avoiding to set PATH by setx command
        error_log_with_exit "$LCOV_ROOT_NIX directory not found on PATH" 1
      fi
    fi
  fi
  lcov --version
fi
