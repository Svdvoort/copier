# Copier template for Python

[Copier](https://copier.readthedocs.io) template for Python

---

## Installation

Install [pyenv](https://github.com/pyenv/pyenv), and use it to install an appropiate python version.

Install [python poetry](https://python-poetry.org/docs/#installation).
To support the virtual environments within vscode easily, we need to make poetry create virtualenvs within the project:

```bash
poetry config virtualenvs.in-project true
poetry config virtualenvs.path "{project-dir}/.venv"
```

Within your global python installation install the following packages:

```bash
pip install copier jinja2 jinja2-time
```

You can set up an (empty) git repository to automatically get started.
Create new repository and copy the git link when asked during the set-up.

Then, create a project itself:

```bash
copier copy --trust gh:Svdvoort/copier.git /path/to/repo
```

Now you can open the the project folder in Visual Studio Code and you are good to go!
Recommended package installations for Visual Studio Code will automatically be suggested.

## Purpose

This project is used to scaffold a `python` project structure.

## License

MIT. See [LICENSE](https://github.com/Svdvoort/copier/blob/master/LICENSE) for more details.
