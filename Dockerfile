FROM python:3.6.8-alpine3.9
RUN pip install pipenv
ADD . .
RUN pipenv install
CMD [/bin/sh]
