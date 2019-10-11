#!/bin/bash
sudo systemctl stop aesmd.service
sudo systemctl start aesmd.service
source environment
cd SampleCode/SampleEnclave
sudo make clean
sudo make
echo " " | ./app
