#/bin/bash

LOG_PATH=/var/log/messages

grep -n FATAL: $LOG_PATH/*.log | awk '{match($0, "[A-Z][a-z][a-z] [0-9][0-9], 2015 [0-9]+:[0-9}+:[0-9]+ [AP]M", a);  cmd = "date +%Y%m%d%H%M%S -d \x22" a[0] "\x22"; cmd | getline mydate; if (mydate >= 20150427200000 && mydate < 20150430200000) print $0}' > text.txt
