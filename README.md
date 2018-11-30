<!--
ubuntu-provision
/README.md
©James Walker 2018. Public domain software.
-->

ubuntu-provision
================

Ubuntu provisioning script to simplify the deployment of new installations.

# 1. ubuntu-provision

`bash ./ubuntu-provision.sh`

**Actions taken**

1. Create a new named user, from the `USER` environment variable.
2. Add the user to `sudo` group.
3. Copy SSH keys from `root` user to the new user.
4. Install Git if not available.
5. Install SSH if not available, change port to `2220`, disable root login and allow SSH through `ufw` firewall.
6. Enable `ufw` firewall.
7. Apply all available software updates, including Ubuntu release upgrades.

This script must be run as root.

Before use, you **must** set the `USER` environment variable to the name of the user account you wish to create during the provisioning.

# 2. ubuntu-provision-docker

`bash ./ubuntu-provision-docker.sh`

**Actions taken**

1. Configure system to install from Docker repositories.
2. Install the latest version of Docker CE; add your *current* user to the `docker` group.
3. Pull and run `hello-world` Docker image to test Docker is functioning correctly.
4. Download specified docker-compose version to `/usr/local/bin/docker-compose`, make it executable and ensure it's functioning.

This is designed to be run after `ubuntu-provision.sh`.

Before use, you **must** set the `DOCKER_COMPOSE_VERSION` environment variable to the docker-compose version you want to install (refer to [https://github.com/docker/compose/releases](https://github.com/docker/compose/releases), at the time of writing `1.23.2`).

All examples assume invocation from the same directory as you have downloaded the project to.

©James Walker 2018. Public domain software.

<!--
End of file.
-->