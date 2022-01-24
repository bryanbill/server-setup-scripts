
# PSQL Setup Script
# Author: Brian Omondi
# Date: January 24, 2022
# Description: This script will setup the PSQL database and user.

# Update the system
sudo apt-get update

# Grab the packages
sudo apt-get install -y postgresql postgresql-contrib

# Create the user
sudo -u postgres createuser -s -i -d -r -l -w "bill"

# Get user input
read -p "Enter the username: " username
read -p "Enter the password for the user: " password

# Check if password is less than 8 characters
if [ ${#password} -lt 8 ]; then
    echo "Password must be at least 8 characters"
    exit 1
fi

# Assign the password
sudo -u postgres psql -c "ALTER ROLE $username WITH PASSWORD '$password';"

# Get user database name input
read -p "Enter the database name: " database


# Create Database
sudo -u postgres createdb -O "$username" "$database"

# Autoremove the packages
sudo apt-get autoremove -y
