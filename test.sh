#!/bin/bash
for user in user01 user02 user03 user04 user05; do useradd -m "$user"; done
mkdir -p /home/privat
mkdir -p /home/public
cp /etc/passwd /home/privat
cp /etc/passwd /home/public
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
for user in user01 user02 user03 user04 user05; do \
  echo "------------------------------------"
  echo "results for $user :" 
  echo "ls /home/public:" 
  sudo -u "$user" ls /home/public 
  echo "ls /home/private" 
  sudo -u "$user" ls /home/privat 
  echo "mkdir /home/public/$user" 
  sudo -u "$user" mkdir -p /home/public/$user 
  echo "mkdir /home/privat/$user" 
  sudo -u "$user" mkdir -p /home/privat/$user 
  echo "grep root /home/public/passwd"
  sudo -u $user grep root /home/public/passwd
  echo "grep root /home/private/passwd"
  sudo -u $user grep root /home/private/passwd
done 
  echo "----------------------------------------"
echo "\n ls /home/privat" 
ls /home/privat
echo "ls /home/public"
ls /home/public
