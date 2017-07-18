#!/bin/bash
# Run Ping Tests for the Top Attacking IP Addresses Against Wordpress Sites
# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/mitchellkrogza/Top-Attacking-IP-Addresses-Against-Wordpress-Sites

# MIT License

# Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
# https://github.com/mitchellkrogza

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# ******************
# Set Some Variables
# ******************

_now="$(date)"
_startmarker="## Ping Tests Against Top Attacking Wordpress IP's ##"
_input=$TRAVIS_BUILD_DIR/wordpress-attacking-ips.txt
_outputactive=$TRAVIS_BUILD_DIR/active-wordpress-attacking-ips.txt
_outputdead=$TRAVIS_BUILD_DIR/inactive-wordpress-attacking-ips.txt

# ***************************************************
# First truncate our output files from our last build
# ***************************************************

sudo truncate -s 0 $_outputactive
sudo truncate -s 0 $_outputdead

# ************************************
# Run Ping Tests
# ************************************

printf '%s\n%s%s\n' "$_startmarker" "Date Last Updated: " "$_now" >> "$_outputactive"
printf '%s\n%s%s\n' "$_startmarker" "Date Last Updated: " "$_now" >> "$_outputdead"

cat $_input |  while read LINE
do
    ping -c1 -t1 "$LINE" > /dev/null
    if [ $? -eq 0 ]; then
    printf '%s\n' "$LINE" >> $_outputactive
    else
    printf '%s\n' "$LINE" >> $_outputdead
    fi
done

exit 0


# MIT License

# Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
# https://github.com/mitchellkrogza

