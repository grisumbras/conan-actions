FROM conanio/gcc9:1.17.0

LABEL "com.github.actions.name"="conan-actions-install"
LABEL "com.github.actions.description"="GitHub Action that runs conan install"
LABEL "description"="GitHub Action that runs conan install"
LABEL "com.github.actions.icon"="download-cloud"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/grisumbras/conan-actions"
LABEL "maintainer"="Dmitry Arkhipov <grisumbras@gmail.com>"


RUN pip install conan conan-package-tools -U

USER root

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
