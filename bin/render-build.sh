#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake webdrivers:chromedriver:update WD_CACHE_TIME=86_400
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate