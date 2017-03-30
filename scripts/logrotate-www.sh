#!/bin/bash 

DIR_APACHE=/var/www
DIR_LOGROTATE=/etc/logrotate.d/www
CONF_LOGROTATE=/etc/logrotate.conf

if [ ! -d $DIR_LOGROTATE ];
 then mkdir $DIR_LOGROTATE
fi

sed -i "\,$DIR_LOGROTATE,d" $CONF_LOGROTATE
echo "include $DIR_LOGROTATE" >> $CONF_LOGROTATE

cd $DIR_APACHE

for f in *;
do
 if [ -e "$DIR_LOGROTATE/$f" ];
  then rm $DIR_LOGROTATE/$f
 fi
 touch $DIR_LOGROTATE/$f
 echo $DIR_APACHE/$f/logs/$f.error_log >> $DIR_LOGROTATE/$f
 echo $DIR_APACHE/$f/logs/$f.access_log >> $DIR_LOGROTATE/$f
 echo '{' >> $DIR_LOGROTATE/$f
 echo 'rotate 7' >> $DIR_LOGROTATE/$f
 echo 'daily' >> $DIR_LOGROTATE/$f
 echo 'missingok' >> $DIR_LOGROTATE/$f
 echo 'notifempty' >> $DIR_LOGROTATE/$f
 echo 'compress' >> $DIR_LOGROTATE/$f
 echo 'delaycompress' >> $DIR_LOGROTATE/$f
 echo 'maxsize 200M' >> $DIR_LOGROTATE/$f
 echo 'create 600 root root' >> $DIR_LOGROTATE/$f
 echo 'sharedscripts' >> $DIR_LOGROTATE/$f
 echo 'postrotate' >> $DIR_LOGROTATE/$f
 echo 'service apache2 reload > /dev/null' >> $DIR_LOGROTATE/$f
 echo 'endscript' >> $DIR_LOGROTATE/$f
 echo '}' >> $DIR_LOGROTATE/$f
done  
