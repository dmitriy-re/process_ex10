#!/bin/bash
yum update -y
yum install epel-release -y
echo -e '#!/bin/bash
START_TIME=$(date +%s)
for ((i=1;i<10000000;i++)) 
do
echo $i > /dev/null
done
END_TIME=$(date +%s)
DIFF=$(( $END_TIME - $START_TIME ))
echo "It took $DIFF seconds for fast script" >> /var/log/messages' > /usr/etc/scr.sh

echo -e '#!/bin/bash
START_TIME=$(date +%s)
for ((i=1;i<10000000;i++)) 
do
echo $i > /dev/null
done
END_TIME=$(date +%s)
DIFF=$(( $END_TIME - $START_TIME ))
echo "It took $DIFF seconds for slow script" >> /var/log/messages' > /usr/etc//scr_slow.sh

chmod +x /usr/etc/scr.sh
chmod +x /usr/etc/scr_slow.sh 
nice -n 10 /usr/etc/scr_slow.sh  &
/usr/etc/scr.sh &
