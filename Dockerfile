FROM python:3.10-alpine3.16

COPY requirements.txt /temp/requirements.txt
COPY mysite /mysite
WORKDIR /mysite
EXPOSE 8000

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt

RUN adduser --disabled-password mysite-user

USER mysite-user