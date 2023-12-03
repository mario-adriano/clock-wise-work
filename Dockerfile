ARG RUBY_VERSION=3.2.2-slim-bookworm
FROM docker.io/ruby:$RUBY_VERSION AS base

ENV LANG=C.UTF-8

ENV TZ "America/Sao_Paulo"

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential libvips bash bash-completion libffi-dev tzdata postgresql-client redis-tools \
    libyaml-dev libxml2-dev libxslt-dev libcurl4-openssl-dev libffi-dev pkg-config dirmngr libreadline-dev zlib1g-dev libssl-dev libpq-dev \
    curl wget libjemalloc2 apt-transport-https apt-utils ca-certificates zip gnupg git-core

# Set production environment
ENV RACK_ENV="production" \
    RAILS_ENV="production" \
    RAILS_LOG_TO_STDOUT="1" \
    BUNDLE_WITHOUT="development" \
    RAILS_MAX_THREADS=10 \
    BUNDLE_FROZEN="1" \
    BUNDLE_JOBS="32" \
    WEB_CONCURRENCY="2"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

WORKDIR /app

# Update gems and bundler
RUN gem update --system --no-document

# Clean cache
RUN apt-get clean && rm -rf /var/libr/apt/lists/* /usr/share/doc /usr/share/man
RUN rm -rf /root/.local

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install

# Copy application files
COPY . .

FROM base AS runtime
ENV LD_PRELOAD="libjemalloc.so.2" \
    MALLOC_CONF="background_thread:true,metadata_thp:auto,dirty_decay_ms:5000,muzzy_decay_ms:5000,narenas:2" \
    RUBY_YJIT_ENABLE="1"

# Precompile bootsnap code for faster boot times
RUN rm -rf /app/tmp/cache
RUN bundle exec bootsnap precompile --gemfile app/ lib/

# Initialize entrypoint
EXPOSE 3000
CMD ["./bin/rails", "server", "-p", "3000"]
