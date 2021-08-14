FROM ruby:3.0.2 AS development
WORKDIR /usr/local/src
RUN apt remove -y mysql-common libmariadb-dev-compat libmariadb-dev \
    && curl -sOL http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-8.0/mysql-common_8.0.25-1debian10_amd64.deb \
    && curl -sOL http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-8.0/libmysqlclient21_8.0.25-1debian10_amd64.deb \
    && curl -sOL http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-8.0/mysql-community-client-plugins_8.0.25-1debian10_amd64.deb \
    && curl -sOL http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-8.0/libmysqlclient-dev_8.0.25-1debian10_amd64.deb \
    && dpkg -i *.deb \
    && rm -rf *.deb

ARG UID
ARG GID

ENV UID ${UID}
ENV GID ${GID}

RUN groupadd -g ${GID} app && \
    useradd -u ${UID} -g ${GID} -m app

USER app
WORKDIR /var/app/api
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
CMD tail -f /dev/null

FROM development AS production
COPY --chown=app:app . .
ENV RAILS_ENV production
CMD rails server