#'''
#ubuntu-provision
#/ubuntu-provision-docker.sh
#©James Walker 2018. Public domain software.
#'''

echo "ubuntu-provision-docker: Commencing Docker provisioning...";
echo "ubuntu-provision-docker: READ \"README.md\" BEFORE PROCEEDING... ";
read;

echo "ubuntu-provision-docker: Docker installing...";
sudo apt-get update;
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";
sudo apt-get update;
sudo apt-get install docker-ce;
sudo usermod -aG docker $USER;
sudo docker run hello-world;

echo "ubuntu-provision-docker: Docker Compose installing...";
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
sudo chmod +x /usr/local/bin/docker-compose;
docker-compose --version;

echo "ubuntu-provision-docker: Provisioning complete! You should logout now to use Docker without \"sudo\".";
exit 0;

#'''
#End of file.
#'''