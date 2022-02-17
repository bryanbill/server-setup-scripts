

# Install nodejs using nvm

echo "Installing NVM, NodeJS, NPM and Typescript"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh

# Prompt user to install nodejs
echo "Verify the Script\n.Do you still want to install nodejs? (y/n)"
read installNode

# check if user wants to install nodejs
if [ "$installNode" = "y" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  source ~/.bashrc
  echo "Pick a version from the list below"
  nvm list-remote
  echo "Enter the version you want to install" 
  read nodeVersion

  # Check if user entered a version
  if [ -z "$nodeVersion" ]; then
    echo "Please enter a version"
    exit 1
  fi

  # Install the specified version
  nvm install $nodeVersion

  # Print the node version
  echo "Node version is: " node -v

  # Install TypeScript
  npm install -g typescript

fi

# Install FoalTS
npm install -g @foal/cli

exit 0
