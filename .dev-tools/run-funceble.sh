#!/bin/bash
# ********************
# Run Funceble Testing
# ********************

# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/mitchellkrogza/The-Big-List-of-Hacked-Malware-Web-Sites

# ****************************************************************
# This uses the awesome funceble script created by Nissar Chababy
# Find funceble at: https://github.com/funilrys/funceble
# ****************************************************************

# ******************
# Set our Input File
# ******************

_input=$TRAVIS_BUILD_DIR/.dev-tools/wordpress-attacking-ips.txt

# *********************************
# Make scripts executable by Travis
# *********************************

sudo chmod +x $TRAVIS_BUILD_DIR/.dev-tools/_funceble/tool
sudo chmod +x $TRAVIS_BUILD_DIR/.dev-tools/_funceble/funceble

cd $TRAVIS_BUILD_DIR/.dev-tools/_funceble/

# *************************
# Run Funceble Install Tool
# *************************

YEAR=$(date +%Y)
MONTH=$(date +%m)

sudo bash $TRAVIS_BUILD_DIR/.dev-tools/_funceble/tool --dev -u --autosave-minutes 35 --commit-autosave-message "V1.${YEAR}.${MONTH}.${TRAVIS_BUILD_NUMBER} [funceble]" --commit-results-message "V1.${YEAR}.${MONTH}.${TRAVIS_BUILD_NUMBER}" -i

# ************************************
#  Run Funceble and Check Domains List
# ************************************

sudo bash $TRAVIS_BUILD_DIR/.dev-tools/_funceble/funceble --cmd-before-end "bash $TRAVIS_BUILD_DIR/.dev-tools/modify-readme-file.sh" --travis -a -ex -h --plain --split -f $_input

exit 0
