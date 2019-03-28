FROM docker

LABEL "com.github.actions.name"="conan-actions"
LABEL "com.github.actions.description"="GitHub Actions for building/publishing with Conan"
LABEL "description"="GitHub Actions for building/publishing with Conan"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/grisumbras/conan-actions"
LABEL "homepage"="http://github.com/grisumbras/conan-actions"
LABEL "maintainer"="Dmitry Arkhipov <grisumbras@gmail.com>"

ENV PATH=/opt/pyenv/bin:/opt/pyenv/shims:/bin:/sbin:/usr/bin:/usr/sbin:${PATH}

RUN apk add --no-cache                                                        \
    bash                                                                      \
    git                                                                       \
    libffi-dev                                                                \
    ncurses-dev                                                               \
    openssl-dev                                                               \
    readline-dev                                                              \
    tk-dev                                                                    \
    xz-dev                                                                    \
    zlib-dev                                                                  \
  && wget --no-check-certificate --quiet                                      \
    -O /tmp/pyenv-installer                                                   \
    https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer   \
  && chmod a+x /tmp/pyenv-installer                                           \
  && PYENV_ROOT=/opt/pyenv /tmp/pyenv-installer                               \
  && rm /tmp/pyenv-installer                                                  \
  && eval "$(pyenv init -)"                                                   \
  && PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.1              \
  && pyenv global 3.7.1                                                       \
  && pip install -q --upgrade --no-cache-dir pip                              \
  && pip install -q --no-cache-dir conan conan-package-tools                  \
  && find /opt/pyenv -iname __pycache__ -print0 | xargs -0 rm -rf             \
  ;

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
