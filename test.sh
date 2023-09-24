!#/bin/bash

if   [ -f /etc/passwd ]

then
  echo exist
else
 echo missing
 fi

if [ -d /tmp/serge1 ]
 then 
  echo exist 
else 
 mkdir /tmp/serge1
echo new > /tmp/serge1/file
cat /tmp/serge1

fi

#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Update the package cache and install required dependencies
yum update -y
yum install -y yum-utils device-mapper-persistent-data lvm2

# Add the Docker repository
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker
yum install -y docker-ce

# Start the Docker service
systemctl start docker

# Enable Docker to start on boot
systemctl enable docker

# Check Docker version
docker --version

# Print a message indicating successful installation
echo "Docker has been installed and started successfully."
#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Define Splunk version and download URL
SPLUNK_VERSION="<Splunk Version>" # Replace with the desired Splunk version
SPLUNK_URL="https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=$SPLUNK_VERSION&product=splunk&filename=splunk-$SPLUNK_VERSION-Linux-x86_64.rpm&wget=true"

# Create a directory to store the installation file
mkdir -p /tmp/splunk_install

# Download Splunk package
curl -o /tmp/splunk_install/splunk.rpm -L "$SPLUNK_URL"

# Install Splunk
rpm -i /tmp/splunk_install/splunk.rpm

# Start Splunk for the first time
/opt/splunk/bin/splunk start --accept-license

# Enable Splunk to start on boot
/opt/splunk/bin/splunk enable boot-start

# Print installation status and access information
echo "Splunk has been installed and started successfully."
echo "You can access the Splunk Web interface at http://localhost:8000"
echo "Login with the username 'admin' and the password you specified during installation."

# Clean up
rm -rf /tmp/splunk_install

exit 0

# Exit the script
exit 0
