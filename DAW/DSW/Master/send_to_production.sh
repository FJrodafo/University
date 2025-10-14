#!/bin/bash

# Script to copy nginx projects from the current directory to /var/www/
# It keeps the same owner, group, and permissions as /var/www/html/

SOURCE=$(pwd)/var/www/
TARGET=/var/www/
REFERENCE=/var/www/html

echo "📂 Source: $SOURCE"
echo "📁 Target: $TARGET"
echo

# Get owner and group from reference folder
OWNER=$(stat -c "%U" "$REFERENCE")
GROUP=$(stat -c "%G" "$REFERENCE")

echo "🔎 Reference folder: $REFERENCE"
echo "   Owner: $OWNER"
echo "   Group: $GROUP"
echo

# Confirm before cleaning
read -p "Do you want to clean /var/www/ except the html folder? [Y/n]: " confirmation
if [ "$confirmation" != "Y" ]; then
    echo "❌ Operation cancelled."
    exit 1
fi
sudo echo

echo "🧹 Cleaning /var/www/ (except html) ..."
sudo find "$TARGET" -mindepth 1 -maxdepth 1 ! -name 'html' -exec rm -rf {} +
echo "✅ Cleanup completed."
echo

echo "🚚 Copying content from $SOURCE to $TARGET ..."
sudo cp -r "$SOURCE"/* "$TARGET"
echo "✅ Copy completed."
echo

# Apply ownership to everything
sudo chown -R "$OWNER":"$GROUP" "$TARGET"

# Set permissions: directories 755, files 644
echo "🔧 Setting permissions: directories 755, files 644 ..."
sudo find "$TARGET" -type d -exec chmod 755 {} +
sudo find "$TARGET" -type f -exec chmod 644 {} +
echo "✅ Permissions applied successfully."
echo

# Set special permissions: contador 
echo "🔧 Setting special permissions: contador ..."
CONTADOR="/var/www/daw/ejercicios/contador/contador.txt"
sudo chown www-data:www-data "$CONTADOR"
sudo chmod 664 "$CONTADOR"
echo "✅ Special permissions applied successfully."
