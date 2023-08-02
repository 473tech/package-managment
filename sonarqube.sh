#!/bin/bash
# Purpose: Sonarqube installation on RedHat
# Website: www.473tech.com
# Created Date: Wed Aug  2 09:38:45 EDT 2023
# Author: Tolulope Gbadamosi
# Note(Optional): 

# Create a new user named 'sonar' (Note: 'sudo' is required for useradd)
sudo useradd sonar

# Add 'sonar' user to sudoers with NOPASSWD privileges (passwordless sudo)
# Note: 'sudo' is used for echo and tee operations requiring root privileges
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar

# Set the hostname to 'sonarqube' using hostnamectl (requires sudo privileges)
sudo hostnamectl set-hostname sonarqube

# Switch to 'sonar' user to perform further commands as 'sonar' user
sudo su - sonar

# Set a password for the 'sonar' user (user 'sonar' is currently active)
sudo passwd sonar

# Enable password-based authentication for SSH (in /etc/ssh/sshd_config)
# Note: 'sudo' is used for editing system configuration files
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart

# Install required packages: unzip, wget, git, and Java 11 JDK
sudo yum -y install unzip wget git -y
sudo yum install java-11-openjdk-devel -y

# Change to the /opt directory (requires sudo privileges)
cd /opt

# Download SonarQube version 7.8 and extract it (requires sudo privileges)
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8 sonarqube

# Change ownership and permissions for the /opt/sonarqube directory
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/

# Start SonarQube service (Note: 'sh' is used to execute the shell script)
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start 

# Check the status of the SonarQube service (Note: 'sh' is used to execute the shell script)
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status

# Below are comments with useful information about the SonarQube server

# Use 'curl' command to access SonarQube on localhost port 9000
# Example: curl -v localhost:9000

# Access SonarQube on the public IP address (public Ip) and port 9000
# Example: Public-ip:9000

# Default admin credentials for SonarQube web interface
# Username: admin
# Password: admin
