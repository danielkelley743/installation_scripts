#!/bin/bash

# Ubuntu 20.04 LTS installation script for OpenCanary
# Make sure you run as a non-privileged user

# Make sure we're up to date
sudo apt-get update -y
sudo apt-get install software-properties-common -y

# OpenCanary (runs on port 80 by default so make sure there are no conflicting services)
# Default configuration file is called opencanary.conf and here's where you can enable and disable options
sudo apt-get install python3-dev python3-pip python3-virtualenv python3-venv python3-scapy libssl-dev libpcap-dev -y
cd ~ && virtualenv opencanary/ && cd opencanary/bin/ && source activate
pip install opencanary 
opencanaryd --copyconfig
screen -dmS opencanary opencanaryd --dev --start 
deactivate && cd ~
