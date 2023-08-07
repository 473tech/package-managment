#!/bin/bash
# Purpose: Installation of maven on Redhat, Centos or Amazon Linux
# Website: www.473tech.com
# Created Date: Fri Jul 21 12:32:08 EDT 2023
# Author: Tolulope Gbadamosi
# Note(Optional): It performs the following actions:

# Set the hostname for the system
sudo hostnamectl set-hostname nexus-server

# Add a new user named 'nexus'
sudo useradd nexus

# Add the nexus user to the sudoers file to allow them to execute any command without a password
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus

# Switch to the nexus user
sudo su - nexus

# Navigate to the /opt directory
cd /opt

# 1. Install prerequisites such as JAVA, wget, git, nano, unzip
sudo yum install wget git nano unzip -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y

# 2. Download the latest version of Nexus software and extract it
sudo wget -O nexus.tar.gz https://download.sonatype.com/nexus/3/latest-unix.tar.gz
sudo tar -xvf nexus.tar.gz
sudo mv /opt/nexus-3* /opt/nexus

# 5. Change the owner and group permissions to /opt/nexus and /opt/sonatype-work directories
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work

# 6. Set the 'run_as_user' parameter to 'nexus' in the nexus.rc file
echo run_as_user="nexus" > /opt/nexus/bin/nexus.rc

# 7. Configure Nexus to run as a service by creating a symbolic link in the init.d directory
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

# 9. Enable and start the Nexus services
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus







