# Alpine didn't have libpq-dev or the minimum g++
# needed so using slim
FROM python:3.6-slim

# Need libpq-dev and gcc to compile psycopg2
# Need g++ to compile libsass
RUN apt-get update && apt-get install -y libpq-dev gcc g++

RUN mkdir /code
ADD . /code
WORKDIR /code

RUN pip install -r requirements.txt
RUN apt-get autoremove -y gcc g++

ENV PYTHONUNBUFFERED 1
