#!/bin/bash

echo "alias ss=\"sudo systemctl\"" >> $HOME/.profile
echo "alias sdr=\"sudo systemctl daemon-reload\"" >> $HOME/.profile
echo "alias sr=\"sudo systemctl restart\"" >> $HOME/.profile
echo "alias j=\"sudo journalctl --no-hostname -o cat -f -u\"" >> $HOME/.profile

echo "alias d=\"docker \"" >> $HOME/.profile
echo "alias sd=\"sudo docker \"" >> $HOME/.profile
echo "alias sdc=\"sudo docker compose\"" >> $HOME/.profile
echo "alias sdl=\"sudo docker logs\"" >> $HOME/.profile
echo "alias sdps=\"sudo docker ps -a\"" >> $HOME/.profile

ln -s /etc/systemd/system $HOME/services

source $HOME/.profile
