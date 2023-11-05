#!/bin/bash


# Step 1: Update and install necessary packages
sudo apt-get update
sudo apt-get install -y gnupg software-properties-common

# Step 2: Install the HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Step 3: Verify the key's fingerprint
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

# Step 4: Add the official HashiCorp repository to your system
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Step 5: Download the package information from HashiCorp
sudo apt update

# Step 6: Install Terraform from the new repository
sudo apt-get install -y terraform

# Step 7: Verify the Terraform installation
terraform --version

echo "Terraform has been successfully installed."
