#!/bin/bash
for user in user01 user02 user03 user04 user05; do useradd -m "$user"; done
mkdir -p /home/privat
mkdir -p /home/public
cp /etc/passwd /home/privat/
cp /etc/passwd /home/public/
cd /home
groupadd priv
groupadd pub
usermod -a -G pub user02
usermod -a -G pub user03
usermod -a -G pub user04
usermod -a -G priv user02
usermod -a -G priv user03
chown -R user01:pub public
chown -R user01:priv privat
chmod 775 /home/public
chmod  750 /home/privat
for user in user01 user02 user03 user04 user05; do \
  echo "------------------------------------"
  echo "results for $user :" 

  echo "ls /home/public:" 
  sudo -u "$user" ls /home/public 
  echo $?

  echo "ls /home/private" 
  sudo -u "$user" ls /home/privat 
  echo $?
  
  echo "mkdir /home/public/$user" 
  sudo -u "$user" mkdir -p /home/public/$user 
  echo $?
  
  echo "mkdir /home/privat/$user" 
  sudo -u "$user" mkdir -p /home/privat/$user 
  echo $?
  
  echo "grep root /home/public/passwd"
  sudo -u $user grep root /home/public/passwd
  echo $?
  
  echo "grep root /home/private/passwd"
  sudo -u $user grep root /home/privat/passwd
  echo $?
done 
  echo "----------------------------------------"

  
echo "\n ls /home/privat" 
ls /home/privat
echo $?

echo "ls /home/public"
ls /home/public
echo $?
