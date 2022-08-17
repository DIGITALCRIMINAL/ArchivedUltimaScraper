FROM python:3.10-slim

WORKDIR /usr/src/app

ENV POETRY_VIRTUALENVS_CREATE=false
RUN pip install poetry

COPY pyproject.toml poetry.lock ./
RUN poetry install --no-dev

COPY . .

CMD [ "poetry", "run", "python", "./start_ofd.py" ]
