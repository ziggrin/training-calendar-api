# ----- Stage 1: Build -----
FROM ruby:3.4.2-slim-bookworm AS builder

ENV RAILS_ENV=production \
    RACK_ENV=production 
    # BUNDLE_WITHOUT="development test"

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev \
        libyaml-dev \
        tzdata \
        curl && \
    rm -rf /var/lib/apt/lists/*

# Download Chamber
RUN curl -L https://github.com/segmentio/chamber/releases/download/v3.1.1/chamber-v3.1.1-linux-amd64 -o /usr/local/bin/chamber \
    && chmod +x /usr/local/bin/chamber

WORKDIR /app

COPY Gemfile Gemfile.lock ./

# Install gems -  bundler automatically respects BUNDLE_WITHOUT
RUN bundle config set --local without 'development:test'
RUN bundle install --jobs 4 --retry 3

# ----- Stage 2: Production ------------------------------------------------------------
FROM ruby:3.4.2-slim-bookworm

ENV RAILS_ENV=production \
    RACK_ENV=production 

# Install runtime dependencies only
# Using --no-install-recommends BUT 
# in case of dependencies troubles I might delete this flag
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
        libpq5 \
        tzdata \
        curl \
        nano && \
    rm -rf /var/lib/apt/lists/*

# Copy the installed gems from the builder stage
COPY --from=builder /usr/local/bundle /usr/local/bundle

# Copy chamber from the builder stage
COPY --from=builder /usr/local/bin/chamber /usr/local/bin/chamber

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /app

# Create a non-root user for running the app (SSH password login disabled)
RUN adduser --disabled-password --gecos '' --no-create-home app-user && \
    chown -R app-user:app-user /app

COPY --chown=app-user:app-user . /app

# .dockerdev folder is not written in .dockerignore because when locally building 
# from .dockerdev/docker-compose we need access to .dockerdev/nginx and 
# docker-entrypoint.dev.sh. I just think this is an easy fix to keep final image clean.
RUN rm -rf .dockerdev nginx

USER app-user

ENTRYPOINT ["/docker-entrypoint.sh"]

