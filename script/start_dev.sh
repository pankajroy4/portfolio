#!/bin/bash
set -e

bundle check || bundle install

rm -f tmp/pids/server.pid

echo "Preparing database..."
bundle exec rails db:prepare

bundle exec ./bin/dev