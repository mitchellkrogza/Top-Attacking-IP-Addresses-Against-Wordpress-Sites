#!/bin/bash
# Fetch funceble script files and run a test
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
_input=$TRAVIS_BUILD_DIR/wordpress-attacking-ips.txt

# *****************************************
# Get latest versions of funceble from repo
# *****************************************
sudo wget https://raw.githubusercontent.com/funilrys/funceble/master/funceble -O $TRAVIS_BUILD_DIR/.dev-tools/_funceble/funceble
sudo wget https://raw.githubusercontent.com/funilrys/funceble/master/tool -O $TRAVIS_BUILD_DIR/.dev-tools/_funceble/tool
sudo wget https://raw.githubusercontent.com/funilrys/funceble/master/iana-domains-db -O $TRAVIS_BUILD_DIR/.dev-tools/_funceble/iana-domains-db

# ***************************************************************
# Clean up old result and output files as we only want the latest
# and don't want the repo to keep filling up with files
# ***************************************************************
sudo rm $TRAVIS_BUILD_DIR/.dev-tools/_funceble/output/hosts/ACTIVE/hosts*
sudo rm $TRAVIS_BUILD_DIR/.dev-tools/_funceble/output/hosts/INACTIVE/hosts*
sudo rm $TRAVIS_BUILD_DIR/.dev-tools/_funceble/output/hosts/INVALID/hosts*
sudo rm $TRAVIS_BUILD_DIR/.dev-tools/_funceble/output/logs/percentage/_*
sudo rm $TRAVIS_BUILD_DIR/.dev-tools/_funceble/output/result.txt

# *****************************
# Install Funceble Dependencies
# *****************************
sudo apt-get -y install expect
sudo apt-get -y install whois

# *********************************
# Make scripts executable by Travis
# *********************************
sudo chmod +x $TRAVIS_BUILD_DIR/.dev-tools/_funceble/tool
sudo chmod +x $TRAVIS_BUILD_DIR/.dev-tools/_funceble/funceble

cd $TRAVIS_BUILD_DIR/.dev-tools/_funceble/

# *************************
# Run Funceble Install Tool
# *************************
sudo bash $TRAVIS_BUILD_DIR/.dev-tools/_funceble/tool -i

# ************************************
#  Run Funceble and Check Domains List
# ************************************
sudo bash $TRAVIS_BUILD_DIR/.dev-tools/_funceble/funceble -a -t 1 -h -f $_input

exit 0
