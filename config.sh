#!/bin/bash

#install commandbox
echo "Installing Latest CommandBox CLI..."

sudo apt-get update
yes | sudo apt-get install openjdk-11-jre

#taken straight from ortus docs commandbox install
curl -fsSl https://downloads.ortussolutions.com/debs/gpg | sudo apt-key add -
echo "deb http://downloads.ortussolutions.com/debs/noarch /" | sudo tee -a /etc/apt/sources.list.d/commandbox.list
sudo apt-get update && sudo apt-get install commandbox

cd ~ && mkdir app && cd app
box
!sudo box install contentbox-installer
!sudo box start host=0.0.0.0 port=80 JVMArgs="-Djdk.attach.allowAttachSelf=true"

# Install cfconfig
echo "Installing CFConfig..."
box install commandbox-cfconfig