#!/bin/bash

echo "alias ss=\"sudo systemctl\"" >> $HOME/.bash_profile
echo "alias sdr=\"sudo systemctl daemon-reload\"" >> $HOME/.bash_profile
echo "alias sr=\"sudo systemctl restart\"" >> $HOME/.bash_profile
echo "alias j=\"sudo journalctl --no-hostname -o cat -f -u\"" >> $HOME/.bash_profile

echo "alias sd=\"sudo docker \"" >> $HOME/.bash_profile
echo "alias sdc=\"sudo docker compose\"" >> $HOME/.bash_profile
echo "alias sdl=\"sudo docker logs\"" >> $HOME/.bash_profile
echo "alias sdps=\"sudo docker ps -a\"" >> $HOME/.bash_profile

ln -s /etc/systemd/system $HOME/services

source $HOME/.bash_profile
