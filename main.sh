# Server Setup Scripts
# Author: Brian Omondi
# Date: January 24, 2022
# Description: This script will setup the PSQL database and user.



# Full Server Environment
# Intall build-essential, curl, git
sudo apt-get update
sudo apt-get install build-essential curl git


echo "Choose type of environment, (full, selective)"
read serverType

# Check the type of environment
if ["$serverType" = "full"]; then
    sh ./lang-setup.sh
    sh ./psql-setup.sh
    sh ./editor-setup.sh
fi

echo "Do you need Nodejs? (y/n)"
read psql
# Check if user wants to install PostgreSQL
if [ "$psql" = "y" ]; then
    sh ./lang-setup.sh
fi

echo "Do you need PostgresSQL? (y/n)"
read psql
# Check if user wants to install PostgreSQL
if [ "$psql" = "y" ]; then
    sh ./psql-setup.sh
fi

# Prompt user to install VS Code
echo "Do you need VS Code? (y/n)"
read installCode

# Check if user wants to install VS Code
if [ "$installCode" = "y" ]; then
    sh ./editor-setup.sh
fi
