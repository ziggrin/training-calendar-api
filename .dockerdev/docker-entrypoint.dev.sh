#!/bin/bash
# Exit immediately if any command fails
set -e

# Remove a potentially pre-existing server.pid for Rails. Local dev setup
rm -f tmp/pids/server.pid

echo "Checking migration status..."
# Get pending migrations (lines that contain "down")
PENDING=$(bin/rails db:migrate:status | grep 'down' || true)

if [ -z "$PENDING" ]; then
  echo "Nothing to migrate."
else
  echo "Running migrations..."
  bin/rails db:migrate
  echo "Successfully migrated."
fi

# Default behavior is to launch the application
if [[ -z ${1} ]]; then
  echo "APP START:"
  exec bundle exec puma -C config/puma.rb
else
  echo "Executing: $@"
  exec "$@"
fi
