#!/bin/bash
apt install -y git
cd opt
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
mv /tmp/reddit.service /etc/systemd/system/reddit.service
chmod 664 /etc/systemd/system/reddit.service && chown root: /etc/systemd/system/reddit.service
systemctl daemon-reload
systemctl strart reddit
