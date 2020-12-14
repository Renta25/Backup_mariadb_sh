#!/bin/bash
/usr/bin/mysqldump --skip-lock-tables --skip-add-locks --disable-keys --max_allowed_packet=512M -h **HOST** -u **DB_USER** -p**DB_USER_PASS** **DB_NAME** --result-file=/srv/backup/backup.sql && \
/usr/bin/mysql **DB_NAME** < /srv/backup/backup.sql && \
/usr/bin/curl -X POST http://**JENKINS_USER**:**JENKINS_USER_API_KEY**@**JENKINS_HOST**:**JENKINS_PORT**/job/**JENKINS_PROJECT**/build 
