#!/bin/sh -l


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


python build.py
