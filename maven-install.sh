#!/bin/bash
# Purpose: Installation of maven on Redhat, Centos or Amazon Linux
# Website: www.473tech.com
# Created Date: Fri Jul 21 12:32:08 EDT 2023
# Author: Tolulope Gbadamosi
# Note(Optional): 


# install Java JDK 1.8+ as a pre-requisit for maven to run.

sudo hostnamectl set-hostname maven-server
cd /opt #3rd party applications are installed here
sudo yum install wget -y 
sudo yum install tree -y
sudo yum install unzip -y
sudo yum install git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
java -version
git --version


#Download and install Maven using wget
#Step1) Download the Maven Software
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.zip
sudo unzip apache-maven-3.9.3-bin.zip
sudo rm -rf apache-maven-3.9.3-bin.zip
sudo mv apache-maven-3.9.3/ maven

#Set environmental variables
vi ~/.bash_profile  # and add the lines below
export M2_HOME=/opt/maven
export PATH=$PATH:$M2_HOME/bin
mvn --version