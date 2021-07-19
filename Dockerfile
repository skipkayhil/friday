FROM ruby:3.0-alpine
WORKDIR /usr/src

RUN apk add --no-cache --update \
  bash \
  build-base \
  linux-headers \
  git \
  postgresql-dev \
  tzdata

# Dependabot native helpers set this path, so setting it here makes bundler
# install gems to where they'll be expected later
ENV BUNDLE_PATH=".bundle"
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.2.24 --no-document \
  && gem install bundler -v 1.17.3 --no-document \
  && bundle install -j 3

ENV DEPENDABOT_NATIVE_HELPERS_PATH=/opt
RUN mkdir -p /opt/bundler/v2 \
  && mkdir -p /opt/bundler/v1 \
  && bash "$(bundle show dependabot-bundler)/helpers/v2/build" /opt/bundler/v2 \
  && bash "$(bundle show dependabot-bundler)/helpers/v1/build" /opt/bundler/v1

COPY . ./

ENV RAILS_ENV=production
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
EXPOSE 3000
