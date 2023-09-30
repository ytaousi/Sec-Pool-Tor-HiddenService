#!/bin/bash

sed -i "s|#HiddenServiceDir /var/lib/tor/hidden_service/|HiddenServiceDir /var/lib/tor/hidden_service/|g" /etc/tor/torrc
sed -i '0,/#HiddenServicePort 80 127.0.0.1:80/s//HiddenServicePort 80 127.0.0.1:80/' /etc/tor/torrc

sed -i "s|#Port 22|Port 22|g" /etc/ssh/sshd_config
sed -i "s|#ListenAddress 0.0.0.0|ListenAddress 0.0.0.0|g" /etc/ssh/sshd_config
sed -i "s|#PermitRootLogin prohibit-password|PermitRootLogin yes|g" /etc/ssh/sshd_config
sed -i "s|#PasswordAuthentication yes|PasswordAuthentication yes|g" /etc/ssh/sshd_config
sed -i "s|#PermitEmptyPasswords no|PermitEmptyPasswords no|g" /etc/ssh/sshd_config

service ssh start
mkdir -p /run/sshd
nginx -g 'daemon off;'

