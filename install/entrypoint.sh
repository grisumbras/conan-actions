#!/bin/sh -l


set -e
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


if [ -z "$*" ]; then
  conan install .
else
  conan install "$@"
fi
