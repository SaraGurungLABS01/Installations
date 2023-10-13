#!/bin/bash

# Update the package lists from configured repositories
sudo apt-get update

# Install necessary packages: fontconfig and OpenJDK 17 JRE and python3-pip
sudo apt-get install fontconfig openjdk-17-jre python3-pip

# Download the Jenkins GPG key and store it in /usr/share/keyrings/jenkins-keyring.asc
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add the Jenkins repository to the package sources list
# [signed-by=/usr/share/keyrings/jenkins-keyring.asc] indicates the repository's packages are signed by the Jenkins GPG key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins from the added repository
sudo apt-get install jenkins

# Start the Jenkins service using systemd
sudo systemctl start jenkins
