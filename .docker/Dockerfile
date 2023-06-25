ARG RUBY_VERSION
ARG BUNDLER_VERSION
FROM ruby:$RUBY_VERSION-slim AS base_image

# Common dependencies
# apt-utils: contains some less used commandline utilities related to package management with APT
# build-essential: package which contains references to numerous packages needed for building software in general.
# gnupg2: encryption tool that includes digital signatures and certificates.
# cURL: command-line tool for getting or sending data including files using URL syntax
# git: distributed version-control system for tracking changes in source code during software development
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

# Upgrade RubyGems and install required Bundler version
RUN gem update --system
RUN gem install bundler --version ${BUNDLER_VERSION}

WORKDIR /app

# We need to copy the version.rb in order to reuse the images layers
# if any change are made in Gemfile or gemspec, improving the image build.
COPY ./lib/steam_api/version.rb /app/lib/steam_api/
COPY steam_api.gemspec Gemfile* /app/

ENV BUNDLE_PATH /gems
RUN bundle install

COPY . /app/

# Makes sure git can track the `/app` directory
# inside the container, even if the directory is not
# owned by the current user (sometimes the directory becomes owned
# by `root` depending on how the host uses Docker`)
RUN git config --global --add safe.directory /app

# Delete unnecessary files to keep small the image size
RUN rm -rf /gems/cache/
