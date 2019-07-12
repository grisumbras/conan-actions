#!/bin/sh -l


set -e
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


if [ -z "$*" ]; then
  echo Invoking conan install .
  conan install .
else
  echo Invoking conan install "$@"
  conan install "$@"
fi
