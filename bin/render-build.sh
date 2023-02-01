#!/usr/bin/env bash
# exit on error
set -o errexit

# Set the path to ChromeDriver in my application
export CHROME_DRIVER_BIN=`which chromedriver`
export PATH=$PATH:$CHROME_DRIVER_BIN
export PATH=$PATH:'./'


bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate