#!/bin/bash
echo "**********************************************************************"
echo "* Raspberry-PI Exo Keyboard Installer                                *"
echo "* Script made in by Onuralp SEZER                                    *"
echo "**********************************************************************"
echo ""
echo "********* System Update Check ****************************************"
echo "Please wait until see update complete message"
sudo apt-get -q -q update && sudo apt-get -q -q upgrade -y
echo "**********************************************************************"
echo ""
echo "******** System Update and Upgrade Complete **************************"
echo
echo "******** Bluetooth Tool and Driver Install ***************************"
echo

$first_command > installed_packages
$second_command > packages_with_updates

if (grep bluez-utils installed_packages); then
   echo "Package is installed"
   if (grep bluez-utils packages_with_updates); then
      sudo apt-get -q -q update bluez-utils bluez-compat -y
      echo "Update available for package"
      echo "" 
      echo " Updating..."
	sudo apt-get update bluez-utils bluez-compat -y
   fi
else
   echo "Package not installed, installing..."
   sudo apt-get install bluez-utils bluez-compat -y
fi
echo "******** Bluetooh Installation Complete ******************************"
echo
echo
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

