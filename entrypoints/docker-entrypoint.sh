#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi
rails db:environment:set RAILS_ENV=development
rails db:drop
rails db:setup

bundle exec rails s -b 0.0.0.0
