FROM python:3.10-slim

WORKDIR /usr/src/app

ENV POETRY_VIRTUALENVS_CREATE=false
RUN pip install poetry

COPY pyproject.toml poetry.lock ./
RUN poetry install --only main

COPY . .

CMD [ "poetry", "run", "python", "./start_us.py" ]