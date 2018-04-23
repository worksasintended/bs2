#!/bin/bash
for user in user01 user02 user03 user04 user05; do useradd -m "$user"; done
mkdir -p /home/privat
mkdir -p /home/public
cd /home
groupadd privat
groupadd public
usermod -a -G public user02
usermod -a -G public user03
usermod -a -G public user04
usermod -a -G privat user02
usermod -a -G privat user03
chown -R user01:public public
chown -R user01:privat privat
chmod 774 /home/public
chmod  740 /home/privat
for user in user01 user02 user03 user04 user05; do echo i$user && sudo -u "$user" ls /home/public && sudo -u "$user" ls /home/privat && sudo -u "$user" mkdir /home/public/"$user" && sudo -u "$user" mkdir /home/privat/"$user"; done 
