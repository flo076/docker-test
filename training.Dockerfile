FROM python:3.11
RUN pip install --no-cache-dir poetry==1.8.2
ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache
WORKDIR /app
  
ARG MODEL_PATH
ARG MODEL_NAME

ENV PYTHONUNBUFFERED=true
ENV PATH="/${MODEL_NAME}/.venv/bin:$PATH"

WORKDIR /${MODEL_NAME}

COPY pyproject.toml ./pyproject.toml

RUN poetry install --no-interaction --no-ansi --only main -vvv

COPY ${MODEL_PATH} .
