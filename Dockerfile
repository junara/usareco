FROM ruby:2.5.3
ENV LANG C.UTF-8
RUN apt-get update -qq &&\
    apt-get install -y curl zip &&\
    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh &&\
    bash nodesource_setup.sh &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    apt-get update -qq &&\
    apt-get install -y --no-install-recommends \
            build-essential libpq-dev libfontconfig1 libpq-dev postgresql-client nodejs yarn imagemagick &&\
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries &&\
    bundle install
COPY . /app
