#'''
#ubuntu-provision
#/ubuntu-provision.sh
#©James Walker 2018. Public domain software.
#'''

VERSION="1.1.0"
echo "ubuntu-provision: ubuntu-provision $VERSION";
echo "ubuntu-provision: ©James Walker 2018. Public domain software.";
echo "ubuntu-provision: READ \"README.md\" BEFORE PROCEEDING... ";
read;
echo "ubuntu-provision: Commencing provisioning...";

echo "ubuntu-provision: Creating user account \"$USER\"...";
adduser $USER;

echo "ubuntu-provision: Adding user account to \"sudo\" group...";
usermod -aG sudo $USER;

echo "ubuntu-provision: Copying root SSH keys to user account...";
mkdir -p /home/$USER/.ssh;
cp ~/.ssh/authorized_keys /home/$USER/.ssh/authorized_keys;
chmod 0700 /home/$USER/.ssh;
chmod 0600 /home/$USER/.ssh/authorized_keys;

echo "ubuntu-provision: Setting ownership of user account home directory...";
chown -R $USER:$USER /home/$USER;

echo "ubuntu-provision: Ensuring Git is available...";
apt-get install git;

echo "ubuntu-provision: Ensuring SSH is available...";
apt-get install ssh;
ufw allow OpenSSH;

echo "ubuntu-provision: Tightening SSH configuration (disabling root login, switching to port 2220)...";
sed -i 's/Port 22/Port 2220/g' /etc/ssh/sshd_config;
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config;
service sshd restart;

echo "ubuntu-provision: Enabling \"ufw\" firewall...";
ufw enable;
ufw status;

echo "ubuntu-provision: Applying system updates...";
apt-get update;
apt-get upgrade;
apt-get dist-upgrade;
apt-get autoremove;
do-release-upgrade;

echo "ubuntu-provision: Provisioning complete! You should reboot now.";
exit 0;

#'''
#End of file.
#'''