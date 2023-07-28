#!/bin/bash
# Purpose: To install tomcat9 on Centos9 Stream Server
# Website: www.473tech.com
# Created Date: Fri Jul 28 08:20:37 EDT 2023
# Author: Tolulope Gbadamosi
# Note(Optional): 


# Set the system hostname to 'tomcat'
sudo hostnamectl set-hostname tomcat

# Switch to the 'ec2-user' user account
sudo su - ec2-user

# Navigate to the /opt directory, where we will install the necessary packages
cd /opt 

# Install Git and Wget packages. These will be used for cloning repositories and downloading files, respectively.
sudo yum install git wget -y

# Install Java JDK 1.8+, which is a prerequisite for running Tomcat.
sudo yum install java-1.8.0-openjdk-devel -y

# Install wget and unzip packages, which will be used to download and extract files.
sudo yum install wget unzip -y

# Download the Tomcat 9.0.78 distribution from the official Apache repository
sudo wget  https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.zip

# Extract the downloaded Tomcat zip file
sudo unzip apache-tomcat-9.0.78.zip

# Remove the downloaded zip file to save space and maintain cleanliness
sudo rm -rf apache-tomcat-9.0.78.zip

# Rename the extracted directory to 'tomcat9' for consistency and easier reference
sudo mv apache-tomcat-9.0.78 tomcat9  

# Assign executable permissions to the entire tomcat home directory
sudo chmod 777 -R /opt/tomcat9

# Change the ownership of the tomcat directory to 'admin' user
sudo chown admin -R /opt/tomcat9

# Start the Tomcat server
sh /opt/tomcat9/bin/startup.sh

# Create symbolic links to the tomcat start and stop scripts.
# This enables us to manage Tomcat as if it was a system service, using 'starttomcat' and 'stoptomcat' commands.
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat

# Run the 'starttomcat' command to start the server
starttomcat
