# bdinfo-installer

bdinfo-installer
Needs swizzin and debian 11/10
Installs, mono, nuget and bdinfo. Makes alias in your .bashrc for fast runs.

How to run:
Elevate with:

sudo su -

and then

bash <(curl -sL https://gist.githubusercontent.com/ProfessionalMoron/d7261203a1cd307c8c367340a7e0b6bc/raw/8043adf333b1680fe38e43dc876eb163006021e1/bdinfo_installer.sh)

After that restart your ssh session for alias to work.
Usage is as follows;
CD to your BluRay disc directory that has the BDMW directory
Run bdinfo by running "bdinfo BDMW" without quotes and select playlist
Once the scan is done it will make a text file in /home/user/bdinfo/
