FROM postgres:9.4
MAINTAINER Mike Dillon <mike@embody.org>

ENV POSTGIS_MAJOR 2.1
ENV POSTGIS_VERSION 2.1.4+dfsg-1.pgdg70+3

RUN echo deb http://http.debian.net/debian wheezy-backports main >> /etc/apt/sources.list
RUN apt-get update \
      && apt-get install -y \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./unaccent.sh /docker-entrypoint-initdb.d/unaccent.sh
