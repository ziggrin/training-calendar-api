#!/bin/bash

# Default behavior is to launch the application
if [[ -z ${1} ]]; then
  echo "APP START:"
  chamber exec "$CHAMBER_SERVICE" -- bundle exec puma -C config/puma.rb
else
  echo "NOT RUNNING DEFAULT START, USING THE CONTAINER COMMAND INSTEAD: $@"
  if timeout 10 chamber exec "$CHAMBER_SERVICE" -- "$@"; then
    exec "$@"
  else
    echo "Chamber failed or timed out. Running the command without secrets from AWS Parameter Store."
    exec "$@"
  fi
fi
