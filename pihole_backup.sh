#!/bin/bash
mkdir /home/user/pihole-$(date '+%F')
cd /home/user/pihole-$(date '+%F')
pihole -a -t
sqlite3 /etc/pihole/pihole-FTL.db ".backup /home/user/pihole-$(date '+%F')/pihole-FTL.db.backup"
tar -czvf /home/user/pihole-$(date '+%F').tar.gz /home/user/pihole-$(date '+%F') --remove-files
mv /home/user/pihole-$(date '+%F').tar.gz /mnt/backup/
find /mnt/backup -name "pihole-*.tar.gz" -type f -mtime +7 -exec rm -f {} \;