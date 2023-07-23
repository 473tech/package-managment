#!/bin/bash
# Purpose: Installation of maven on Redhat, Centos or Amazon Linux
# Website: www.473tech.com
# Created Date: Fri Jul 21 12:32:08 EDT 2023
# Author: Tolulope Gbadamosi
# Note(Optional): It performs the following actions:
    # 1. Set the host name (optional)
    # 2. Install necessary tools (wget, tree, unzip, git)
    # 3. Install JDKs (OpenJDK 1.8 and 11) required by Maven
    # 4. Download and install Maven
    # 5. Set environmental variables necessary for Maven

# Optionally set the hostname for the server. If you wish to change the hostname, 

sudo hostnamectl set-hostname maven-server

# Install necessary utilities
echo "Installing necessary utilities: wget, tree, unzip, git..."
sudo yum install wget tree unzip git-all -y

# Install Java JDK 1.8 and JDK 11 - Maven pre-requisites
echo "Installing Java JDKs..."
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y

# Check the installed versions of Java and Git
echo "Java version:"
java -version

echo "Git version:"
git --version

# Download and install Maven
echo "Downloading and installing Maven..."
cd /opt 
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.zip
sudo unzip apache-maven-3.9.3-bin.zip
sudo rm -rf apache-maven-3.9.3-bin.zip
sudo mv apache-maven-3.9.3/ maven

# Set environment variables
# We use 'tee' to safely write to files with sudo privileges
echo "Setting Maven environment variables..."
echo -e "\n# Maven environment variables" | sudo tee -a ~/.bash_profile
echo "export M2_HOME=/opt/maven" | sudo tee -a ~/.bash_profile
echo "export PATH=\$PATH:\$M2_HOME/bin" | sudo tee -a ~/.bash_profile

# Apply the changes to the current session
source ~/.bash_profile

# Check Maven version
echo "Maven version:"
mvn --version
