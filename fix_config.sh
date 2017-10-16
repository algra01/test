#!/bin/bash

cd /home/testuser/mycode

git clone https://github.com/algra01/test.git .

sed 's/\"\(.*\)\":\([ \t]\)*\(\"\"\)*\(,\)*$/\"\1\":\2\"\$\1\"\4/' config.json >  config1.json

envsubst < config1.json > config.json

rm config1.json 

chown testuser *

cd /tmp

tar -czf mycode.tar.gz /home/testuser/mycode

md5sum mycode.tar.gz

scp mycode.tar.gz remote.test.com:/home/testuser/remotecode/

ssh testuser@remote.test.com <<EOF
sudo service node stop

mv remotecode/mycode.tar.gz /user/node/data/

cd /user/node/data

tar -xzf mycode.tar.gz

sudo service node start
EOF

ret=$(curl -I -s "http://remote.test.com/status" -o /dev/null -w "%{http_code}\n")

if [ $ret -eq 200 ]
then
  echo "Success"
fi
