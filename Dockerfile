FROM python:3.6-slim

# need postgresql-dev and gcc to compile psycopg2
# need g++ to compile libsass
RUN apt-get update && apt-get install -y libpq-dev gcc g++

RUN mkdir /code
ADD . /code
WORKDIR /code

RUN pip install -r requirements.txt
RUN apt-get autoremove -y gcc g++

ENV PYTHONUNBUFFERED 1

CMD ["python", "pythonie/manage.py", "runserver", "0.0.0.0:8000", "--settings", "pythonie.settings.production"]
