#!/usr/bin/env bash
# exit on error
set -o errexit

# install chromedriver Possible alternatives gem
gem install chromedriver-installer
gem install chromedriver-helper
gem install capybara-chromedriver-logger

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate