FROM python:3.6.8-alpine3.9
LABEL maintainer="Intelivix"
COPY . /app
WORKDIR /app
RUN apk add \
    gcc=8.2.0-r2 \
    musl-dev=1.1.20-r4 \
    libffi-dev=3.2.1-r6 \
    openssl-dev=1.1.1b-r1 \
    libxml2-dev=2.9.9-r1 \
    libxslt-dev=1.1.32-r0 \
        && rm -rf /var/cache/apk/* \
        && addgroup -S -g 1001 app \
        && adduser -S -D -h /app -u 1001 -G app app \
        && chown -R app.app /app/

USER app
ENV PATH $PATH:/app/.local/bin
RUN pip3 install --user pipenv==2018.11.26 \
    && pipenv lock --requirements > requirements.txt \
    && pip3 install --user -r requirements.txt
ENTRYPOINT ["sh"]
