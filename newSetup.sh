#!/bin/bash
##make sure that script is being run as sudo
if [[ $EUID -ne 0 ]]; then
   sleep 0.5
   echo "This script must be run as root" 
   sleep 3 
   exit 1
fi
##check to make sure that cores are matching to conky when it installs
##if not tells you you will need to update
cores="$cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l"
if[$cores != 4]
then
	echo This machine has a number of corse that is not the same as conky,
	echo please update code to match core count when finished
	sleep 5
fi
echo $cores
echo Installing main packages
apt install net-tools
apt install conky-all
apt install chromium-browser
apt install lua5.3
apt install gawk
apt install dkms
apt install gparted
apt install vanilla-gnome-desktop
apt install libcairo2-dev
snap install --clasic slack
snap install discord
echo Main repository packages installed
##getting vscode, vbox latest and installing them (also installing displaylink drivers included)
##oh and get my background for me
echo Installing VSCode,Vbox and Displaylinks drivers
chmod +x displaylink-driver-5.1.26.run
sudo ./displaylink-driver-5.1.26.run
wget https://go.microsoft.com/fwlink/?LinkID=760868
wget https://download.virtualbox.org/virtualbox/6.0.4/virtualbox-6.0_6.0.4-128413~Ubuntu~bionic_amd64.deb
dpkg -i code_1.32.1-1552006243_amd64.deb
dpkg -i virtualbox-6.0_6.0.4-128413_Ubuntu_bionic_amd64.deb
apt install -f
cd
##add source folder for holding code projects and add conky/install overlay
echo Adding src folder and adding conky-prime repositroy
mkdir src
cd src
git clone https://github.com/1Jamie/conky-prime.git
cp .conkyrc ~/
cp -r .conky ~/


