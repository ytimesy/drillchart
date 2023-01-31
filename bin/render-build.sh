#!/usr/bin/env bash
# exit on error
set -o errexit

# Download ChromeDriver
wget https://chromedriver.storage.googleapis.com/109.0.5414.74/chromedriver_linux64.zip

# Unzip ChromeDriver
unzip chromedriver_linux64.zip

# Make ChromeDriver executable
chmod +x chromedriver

# ChromeDriver to the current directory
APP_DIR="./"

# Set the path to ChromeDriver in my application
export PATH=$PATH:$APP_DIR

# install webdriver gem
gem install selenium-webdriver

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate