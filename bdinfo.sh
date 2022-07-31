#!/bin/bash
# BDInfo Install Script
# Meant for Swizzin running Debian 11/10
# Credits to Brettpetch for the base. Although this is a heavily modified version.

#Check if run with sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

#Get user
. /etc/swizzin/sources/globals.sh
. /etc/swizzin/sources/functions/mono
USER=$(cut -d: -f1 < /root/.master.info)
clear

#Install mono, nuget
	echo_progress_start "Installing mono. Might take a while"
sudo apt install mono-complete -y &> /dev/null
	echo_progress_done "Success"
	echo_progress_start "Installing nuget. Might take a while"
sudo apt install nuget -y &> /dev/null
	echo_progress_done "Success"

#Install 
	echo_progress_start "Making directories"
mkdir -p /home/${USER}/scripts/
chown -R ${USER}:${USER} /home/${USER}/scripts
	echo_progress_done "Success"
	echo_progress_start "Cloning git"
git clone https://github.com/ProfessionalMoron/BDInfoCLI-ng.git /home/${USER}/scripts/bdinfo &> /dev/null
	echo_progress_done "Success"
chown -R ${USER}:${USER} /home/${USER}/scripts/
chown -R ${USER}:${USER} /home/${USER}/scripts/bdinfo/

#make script file, change perms and add data
	echo_progress_start "Making script file for alias runs"
cd /home/${USER}/scripts/ || exit
touch bdinfo.sh
echo '#!/bin/bash
user=$(whoami)
mkdir -p /home/${USER}/bdinfo
mono /home/${USER}/scripts/bdinfo/BDInfo.exe $1 /home/${USER}/bdinfo/' >> bdinfo.sh
chmod u+x bdinfo.sh
chown ${USER}:${USER} bdinfo.sh
echo_progress_done "Success"

echo_progress_start "Making alias"
#add alias
echo "alias bdinfo='/home/${USER}/scripts/bdinfo.sh $1'" >> /home/${USER}/.bashrc
source /home/${USER}/.bashrc
echo_progress_done "Success. Restart your ssh session for alias to work"
echo_progress_done "Run BDInfo by just typing bdinfo and the target for example 'bdinfo BDMW' on your BluRay disc directory"
exit
