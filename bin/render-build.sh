#!/usr/bin/env bash
# exit on error
set -o errexit

# Download chromedriver
wget https://chromedriver.storage.googleapis.com/109.0.5414.74/chromedriver_linux64.zip

# Unzip ChromeDriver
unzip chromedriver_linux64.zip

# Make ChromeDriver executable
chmod +x chromedriver

# Set the path to ChromeDriver in my application
export CHROME_DRIVER_BIN=`which chromedriver`
export PATH=$PATH:$CHROME_DRIVER_BIN
export PATH=$PATH:'./'


bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate