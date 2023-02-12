#!/usr/bin/env bash
# exit on error
set -o errexit

export WD_INSTALL_DIR=`/opt/render/project/src`
export WD_CHROME_PATH=`/opt/render/project/src`
export CHROME_DRIVER_BIN=`/opt/render/project/src`
export PATH=$PATH:$WD_INSTALL_DIR
export PATH=$PATH:$WD_CHROME_PATH
export PATH=$PATH:$CHROME_DRIVER_BIN

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate