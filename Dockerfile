FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential nodejs zsh

RUN mkdir /var/src

ENV BUNDLER_VERSION 2.2.0
RUN gem update --system \
    && gem install bundler -v $BUNDLER_VERSION

WORKDIR /var/src

EXPOSE 3000
