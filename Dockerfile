FROM ruby:2.6.5

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    mariadb-client \
    yarn

WORKDIR /origin-002

ADD Gemfile /origin-002/Gemfile
ADD Gemfile.lock /origin-002/Gemfile.lock

RUN gem install bundler
RUN bundle install
