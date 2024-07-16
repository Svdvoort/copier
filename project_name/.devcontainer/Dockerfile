FROM ubuntu:22.04

COPY .python-version .python-version
ARG DEBIAN_FRONTEND=noninteractive


###################################
# Set-up user for persistent permission
###################################

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME



###################################
# Install pyenv
###################################

# Get pyenv requirements
RUN apt update && apt install -y curl git

WORKDIR $HOME
# Install pyenv using install script
ENV PYENV_ROOT="$HOME/.pyenv"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
RUN curl https://pyenv.run | bash

###################################
# Install python
###################################
# Install depedencies for python
RUN apt update && apt install -y build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev curl \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install python version
RUN pyenv install $(cat .python-version | tr -d '\r')
RUN pyenv global $(cat .python-version | tr -d '\r')

###################################
# Install python poetry
###################################
ENV POETRY_HOME=/usr/local
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV POETRY_VIRTUALENVS_CREATE="false"
ENV POETRY_VIRTUALENVS_IN_PROJECT="false"
RUN poetry self add poetry-plugin-export

###################################
# Settings for file permissions
###################################
USER $USERNAME
