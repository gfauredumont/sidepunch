FROM ruby:2.4.0
MAINTAINER Guillaume FAURE-DUMONT
RUN apt-get update -qq && apt-get install -y build-essential postgresql-contrib nodejs npm nodejs-legacy
RUN gem install foreman
RUN echo 'gem: --no-document' > /root/.gemrc

RUN mkdir /sidepunch

WORKDIR /sidepunch
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /sidepunch
WORKDIR /sidepunch
