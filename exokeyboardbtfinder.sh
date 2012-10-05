#!/bin/bash
echo "**********************************************************************"
echo "* Raspberry-PI Exo Keyboard Bluetooth Finder                         *"
echo "* Script made in by Onuralp SEZER                                    *"
echo "**********************************************************************"
echo "******** Please Activate your exo keyboard before scan ***************"
echo "********       You have 5 second until scan start      ***************"
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