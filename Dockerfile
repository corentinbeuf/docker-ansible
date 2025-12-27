FROM docker.io/library/python:3.13-alpine3.22

COPY requirements.txt ./

RUN apk add --update --no-cache \
    openssh-client \
    rsync \
    musl-dev \
    libffi-dev \
    openssl-dev \
    cargo

RUN apk add --update --no-cache \
    --virtual .build-deps \
    make \
    gcc \
    python3-dev \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del .build-deps

CMD ['ansible']