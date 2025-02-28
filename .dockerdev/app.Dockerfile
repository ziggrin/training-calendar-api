FROM ruby:3.4.2-bookworm

# Install system dependencies (including Node.js and PostgreSQL client libraries)
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs curl nano

# Set working directory
WORKDIR /app

#######################################
# Define build-time variables for UID and GID
ARG UID=1000
ARG GID=1000
# Create a group and user with a home directory (the -m flag creates /home/appuser)
RUN groupadd -g ${GID} appgroup && \
    useradd -m -u ${UID} -g appgroup appuser
# (Optional) Set the HOME environment variable
ENV HOME=/home/appuser
# Change ownership of the application directory
RUN chown -R ${UID}:${GID} /app
#######################################

# Copy Gemfile and Gemfile.lock, then install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# # Copy the rest of your application code
# COPY . .

# Copy docker-entrypoint.dev.sh with proper user permission
COPY ./.dockerdev/docker-entrypoint.dev.sh /docker-entrypoint.dev.sh
RUN chmod +x /docker-entrypoint.dev.sh

ENTRYPOINT ["/docker-entrypoint.dev.sh"]
