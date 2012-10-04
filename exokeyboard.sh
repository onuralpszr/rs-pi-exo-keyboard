#!/bin/bash
echo "**********************************************************************"
echo "* Raspberry-PI Exo Keyboard Installer                                *"
echo "**********************************************************************"
echo
echo "********* System Update Check ****************************************"
echo
sudo apt-get update && sudo apt-get upgrade -y
echo "******** System Update and Upgrade Complete **************************"
echo
echo "******** Bluetooth Tool and Driver Install ***************************"
echo
sudo apt-get install bluez-utils bluez-compat -y
echo "******** Bluetooh Installation Complete ******************************"
echo
echo
echo "******** Please Activate your exo keyboard before scan ***************"
sleep 5
echo "******** Exo Keyboard Scan *******************************************"
hcitool scan |grep 'Macro Keyboard' >> temp.txt
b=$(cat temp.txt |grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
echo "You Keyboard MAC Adresses is $b"
echo "Now use this command for complete connection between,"
echo "your Raspberry-PI and keyboard"
echo "sudo hidd --connect $b"
echo 
echo "Have nice day ;)"
rm -rf temp.txt

