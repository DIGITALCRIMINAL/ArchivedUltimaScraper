FROM python:3.10-slim

WORKDIR /usr/src/app

ENV POETRY_VIRTUALENVS_CREATE=false
RUN ["/bin/bash", "-c", "set -o pipefail && curl -sSL https://install.python-poetry.org | python3 -"]

COPY pyproject.toml poetry.lock ./
RUN poetry install --only main

COPY . .

CMD [ "poetry", "run", "python", "./start_us.py" ]
