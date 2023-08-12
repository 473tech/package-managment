#!/bin/bash
# Purpose: 
# Website: www.473tech.com
# Created Date: Sat Aug 12 19:40:38 EDT 2023
# Author: Tolulope Gbadamosi
# Note(Optional): 

# Prerequisite

# AWS Acccount.
# Create Redhat EC2 t2.medium Instance with 4GB RAM.
# Create Security Group and open Required ports. 8080
# Attach Security Group to EC2 Instance.
# Install java openJDK 1.8+ 




# Step 1: Set up the hostname for the system
sudo hostnamectl set-hostname jenkins-server

# Step 2: Install necessary software such as git, unzip, wget, and tree
sudo yum -y install unzip wget tree git

# Step 3: Install Java 11 as it's a prerequisite for Jenkins
sudo yum install java-11-openjdk -y

# Step 4: Import the Jenkins repository key for secure package downloads
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Change directory to the repository directory
cd /etc/yum.repos.d/

# Step 5: Download the Jenkins repo configuration to the system's repository list
sudo curl -O https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Step 6: Install Jenkins from the added repository
sudo yum -y install jenkins  --nobest

# Step 7: Start the Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Verify that Jenkins is up and running
sudo systemctl status jenkins

# Step 8: To access Jenkins via browser, use the public IP followed by port 8080. The following line fetches your public IP.
curl ifconfig.co 

# Note: In your browser, go to: http://<your-public-ip>:8080

# Step 9: Retrieve the initial Jenkins admin password which is required for first-time setup
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
