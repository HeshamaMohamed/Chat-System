FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
COPY . ./app
WORKDIR /app

ENV BUNDLER_VERSION=2.0.2
RUN gem install bundler -v 2.0.2
RUN bundle install


ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
EXPOSE 3000
