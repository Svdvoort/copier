#!/bin/bash
# This script is necessary to execute some tasks
# only on first start-up

if [[ $PWD == /tmp* ]]; then
    echo "This is copier update. Exiting"
    exit 0
fi

if [ -d .git/ ]; then
  echo "This project is already initialized. Exiting"
  exit 0
fi

# Generate license
lice $1 -o $2 -p $3 > LICENSE

# Set-up pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Use pyenv to install and setup
# requested python version
pyenv install -s $5
pyenv local $5
pyenv shell $5

# Install python poetry in local python version
pyenv exec pip install poetry

# Set-up virtual environment using poetry
poetry env use $5
poetry run pip install --upgrade pip
poetry install --with dev,docs,copier

# Initial setup of git
git init --initial-branch="main"
git add .
git commit -m "Initial commit"
git remote add origin $4
git push --set-upstream origin main

# Set-up precommit
poetry run pre-commit install
