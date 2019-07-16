#!/bin/sh
PASSWD=$(openssl rand -base64 32)
echo "Secure password: $PASSWD"
echo "user:$PASSWD" >> /passwd
sudo mosquitto_passwd -U /passwd
cat /passwd
