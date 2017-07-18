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
_endmarker="## End Ping Tests Against Top Attacking Wordpress IP's ##"
_input=$TRAVIS_BUILD_DIR/wordpress-attacking-ips.txt
_outputactive=$TRAVIS_BUILD_DIR/active-wordpress-attacking-ips.txt
_outputdead=$TRAVIS_BUILD_DIR/inactive-wordpress-attacking-ips.txt

# ************************************
# Run Ping Tests
# ************************************

cat $_input |  while read LINE
do
    #ping -c 1 "$LINE" 2>> $_output
    ping -c 1 "$LINE" > /dev/null
    if [ $? -eq 0 ]; then
    #echo "node $LINE is up" >> $_outputactive
    printf '%s\n' "$LINE" >> $_outputactive
    else
    #echo "node $LINE is down" >> $_outputdead
    printf '%s\n' "$LINE" >> $_outputdead
    fi
done

#printf '%s\n%s%s\n' "$_start1" "Date Run: " "$_now" >> "$_tmpips"
#while IFS= read -r LINE
#do
#printf '\t"~*%s%s%s"\t\t%s\n' "\b" "${LINE}" "\b" "$_action1" >> "$_tmpips"
#printf '\t"~*%s%s%s"\t\t%s\n' "\b" "${LINE}" "\b" "$_action1" >> "$_tmpips"
#done < $_input1
#printf '%s\n' "$_end1"  >> "$_tmpnginx1"
#mv $_tmpnginx1 $_inputdb1
#ed -s $_inputdb1<<\IN
#1,/## Ping Tests Against Top Attacking Wordpress IP's ##/d
#/## End Ping Tests Against Top Attacking Wordpress IP's ##/,$d
#,d
#.r /home/travis/build/mitchellkrogza/nginx-ultimate-bad-bot-blocker/travisCI/globalblacklist.template
#/## Ping Tests Against Top Attacking Wordpress IP's ##/x
#.t.
#.,/## End Ping Tests Against Top Attacking Wordpress IP's ##/-d
#,p
#,p used to print output replaced with w below to write
#w /home/travis/build/mitchellkrogza/nginx-ultimate-bad-bot-blocker/travisCI/globalblacklist.template
#q
#IN
#rm $_inputdb1


# **************************************************
# Generate Additional Files and Copy Them to Folders
# **************************************************

#sudo cp $_nginx $TRAVIS_BUILD_DIR/conf.d/globalblacklist.conf
#sudo cp $_nginx $TRAVIS_BUILD_DIR/_sample_config_files/Engintron_for_cPanel_WHM_Configuration_Example/etc/nginx/conf.d/globalblacklist.conf

exit 0


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