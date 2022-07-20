#!/bin/bash

echo "alias ss=\"sudo systemctl\"" >> $HOME/.bash_profile

echo "alias sdr=\"sudo systemctl daemon-reload\"" >> $HOME/.bash_profile
echo "alias sstop=\"sudo systemctl stop\"" >> $HOME/.bash_profile
echo "alias sstart=\"sudo systemctl start\"" >> $HOME/.bash_profile
echo "alias sr=\"sudo systemctl restart\"" >> $HOME/.bash_profile
echo "alias se=\"sudo systemctl enable\"" >> $HOME/.bash_profile
echo "alias sd=\"sudo systemctl disable\"" >> $HOME/.bash_profile
echo "alias j=\"sudo journalctl --no-hostname -o cat -f -u\"" >> $HOME/.bash_profile

source $HOME/.bash_profile
