FROM ruby:2.7.1

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

ENV RAILS_ENV=development
ENV RACK_ENV=development

RUN bundle install

CMD rails s -b 0.0.0.0
