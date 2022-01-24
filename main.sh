# Full Server Environment

echo "Choose type of environment, (full, selective)"
read type

# Check the type of environment
if ['$type' = "full"]; then
    sh ./lang-setup.sh
    sh ./psql-setup.sh
    sh ./editor-setup.sh
fi

echo "Do you need PostrgresSQL? (y/n)"
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
