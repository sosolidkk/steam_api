ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-slim AS base_image

ARG BUNDLER_VERSION

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    apt-utils \
    build-essential \
    gnupg2 \
    curl \
    git \
    cmake \
    pkg-config \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

ENV BUNDLE_PATH /gems
RUN gem install bundler --version ${BUNDLER_VERSION}

WORKDIR /app

# We need to copy the version.rb in order to reuse the images layers
# if any change are made in Gemfile or gemspec, improving the image build.
COPY ./lib/steam/version.rb /app/lib/steam/
COPY steam.gemspec Gemfile* /app/
RUN bundle install

COPY . /app/

# Delete unnecessary files to keep small the image size
RUN rm -rf /gems/cache/
