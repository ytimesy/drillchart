#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake webdrivers:chromedriver:update WD_CACHE_TIME=86_400  WD_INSTALL_DIR=/opt/render/project/src WD_CHROME_PATH=/opt/render/project/src
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate