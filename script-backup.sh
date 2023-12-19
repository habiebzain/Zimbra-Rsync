#!/bin/bash

TGL=$(date +%Y%m%d)
/bin/su - zimbra -c "/opt/zimbra/bin/zmcontrol -v > /opt/zimbra/backup/version.txt"
/bin/su - zimbra -c  "/opt/zimbra/libexec/zmslapcat  /opt/zimbra/backup/ldap-data-$TGL"
/bin/su - zimbra -c  "/opt/zimbra/libexec/zmslapcat  -c /opt/zimbra/backup/ldap-conf-$TGL"
/bin/su - zimbra -c  "/opt/zimbra/libexec/zmslapcat -a /opt/zimbra/backup/ldap-acs-$TGL"


DATE=$(date +%Y%m%d" "%H:%M:%S)
echo "Start: $DATE" >> /root/zimbra.log
echo "Start: $DATE" > /tmp/zimbra.backup

/etc/init.d/zimbra stop
ARGS="--archive --recursive --links --hard-links --keep-dirlinks --perms --owner --group --times --delete --verbose"

/usr/bin/rsync $ARGS -e "/usr/bin/ssh -p 19922" /opt/zimbra/ --exclude data/ldap/* root@10.0.100.20:/opt/zimbra  > /tmp/verbose.txt
/etc/init.d/zimbra start

DATE=$(date +%Y%m%d" "%H:%M:%S)
echo "End: $DATE" >> /root/zimbra.log
echo "End: $DATE" >> /tmp/zimbra.backup
echo "Zimbra Status: `/bin/su - zimbra -c 'zmcontrol status' `" >> /tmp/zimbra.backup
cat /tmp/zimbra.backup | mail -a /tmp/verbose.txt -s 'Zimbra SRV Backup at '$TGL' ' our-email@domain.com

exit 0
