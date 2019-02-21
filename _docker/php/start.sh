#!/bin/bash

mkdir -p /var/log/supervisor
mkdir -p /var/log/nginx
mkdir -p /var/log/mongodb
#sudo touch /var/log/syslog
touch /var/log/php-fpm.log
touch /var/log/php-www-error.log
mkdir -p /var/run/php/
mkdir -p /run/php/
#sudo chmod -R 777 /var/log/syslog
chmod -R 777 /run/php/

mkdir -p /var/run/sshd
chmod 0755 /var/run/sshd

# Tweaks to give Apache/PHP write permissions to the app
# chown -R www-data:staff /var/www

#sudo chown -R www-data:staff /var/log

chmod -R 777 /var/log
chmod -R 777 /tmp

# start all the services
/usr/local/bin/supervisord -c /image/supervisord.conf -n
