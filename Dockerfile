FROM python:3.6.8-alpine3.9
ADD . .
RUN apk add gcc=8.2.0-r2 musl-dev=1.1.20-r4 libffi-dev=3.2.1-r6 openssl-dev=1.1.1b-r1 libxml2-dev=2.9.9-r1 libxslt-dev=1.1.32-r0 \
    && rm -rf /var/cache/apk/*
RUN pip3 install pipenv==2018.11.26
RUN pipenv lock --requirements > requirements.txt
RUN pip3 install -r requirements.txt
ENTRYPOINT ["/bin/sh"]
