#! /usr/bin/bash

# need to get the work and break time
# ratio is as follow
# 25 min works -> 5 mins break

wsec=${1:-25}*60; # default workig min is 25 mins
bsec=${2:-wsec/300}*60; # default break min is 5 mins

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    while true; do
        time1=$((`date +%s` + $wsec));
        while [ "$time1" -ge `date +%s` ]; do
            echo -ne "$(date -u --date @$(($time1 - `date +%s` )) +%H:%M:%S)\r";
        done
        notify-send "Break, Time to walk and rest";
        read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n';
        time2=$((`date +%s` + $pseconds));
        while [ "$date2" -ge `date +%s` ]; do
            echo -ne "$(date -u --date @$(($date2 - `date +%s` )) +%H:%M:%S)\r";
        done
        notify-send "Work" "Time to get back to work";
        read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n';
    done
else
    echo -ne "It seems like your OS is not Linux XD\n";
fi
