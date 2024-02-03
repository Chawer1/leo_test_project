FROM ruby:3.2.2

RUN npm install -g yarn
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

RUN mkdir /app_training

WORKDIR /app_training

ENV BUNDLER_VERSION=2.4.15

COPY Gemfile* ./

RUN bundle install

COPY . .

RUN rails db:migrate && rails db:seed

CMD ["rails", "server", "-b", "0.0.0.0"]
