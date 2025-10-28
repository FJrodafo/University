#!/bin/bash

# Script to export Nginx files and configurations from the current working directory (local) to production!

# Log file
LOG_FILE="$(pwd)/.log/nginx_$(date +%Y%m%d_%H%M%S).log"
mkdir -p "$(pwd)/.log"
# Redirige stdout y stderr al log y también a la pantalla
exec > >(tee -a "$LOG_FILE") 2>&1

# Ensure the script is run with sudo privileges.
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Verify that Nginx is installed and active, prompt to start if not.
if sudo nginx -v >/dev/null 2>&1; then
    if ! systemctl is-active --quiet nginx.service; then
        read -p "Nginx service is not active. Do you want to start it? [Y/n]: " start_nginx_confirmation
        echo "" >> "$LOG_FILE"
        if [[ "$start_nginx_confirmation" =~ ^[Yy]$ ]]; then
            sudo systemctl start nginx.service
            if ! systemctl is-active --quiet nginx.service; then
                echo "Failed to start Nginx. Please check manually."
                exit 1
            fi
        else
            echo "Nginx is required for this script to run properly."
            exit 1
        fi
    fi
else
    echo "Nginx is not installed..."
    exit 1
fi

# Verify that php8.2-fpm is installed and active, prompt to start if not.
if php -v | grep -q 8.2; then
    if ! systemctl is-active --quiet php8.2-fpm.service; then
        read -p "php8.2-fpm service is not active. Do you want to start it? [Y/n]: " start_php_fpm_confirmation
        echo "" >> "$LOG_FILE"
        if [[ "$start_php_fpm_confirmation" =~ ^[Yy]$ ]]; then
            sudo systemctl start php8.2-fpm.service
            if ! systemctl is-active --quiet php8.2-fpm.service; then
                echo "Failed to start php8.2-fpm. Please check manually."
                exit 1
            fi
        else
            echo "php8.2-fpm is required for this script to run properly."
            exit 1
        fi
    fi
else
    echo "php8.2-fpm is not installed..."
    exit 1
fi

# Backup Nginx files and configurations.
BACKUP_DIR="$(pwd)/.backup/nginx_$(date +%Y%m%d_%H%M%S)"
sudo mkdir -p "$BACKUP_DIR"
sudo mkdir "$BACKUP_DIR/etc"
sudo mkdir "$BACKUP_DIR/etc/nginx"
sudo mkdir "$BACKUP_DIR/etc/nginx/sites-available"
sudo mkdir "$BACKUP_DIR/etc/nginx/sites-enabled"
sudo mkdir "$BACKUP_DIR/var"
sudo mkdir "$BACKUP_DIR/var/www"
sudo cp -a /etc/nginx/mime.types "$BACKUP_DIR/etc/nginx/"
sudo cp -a /etc/nginx/sites-available/. "$BACKUP_DIR/etc/nginx/sites-available/"
sudo cp -a /etc/nginx/sites-enabled/. "$BACKUP_DIR/etc/nginx/sites-enabled/"
sudo cp -a /var/www/. "$BACKUP_DIR/var/www/"
echo "Backup directory at $BACKUP_DIR"

# Export Nginx mime.types to production.
if [ -f $(pwd)/etc/nginx/mime.types ]; then sudo cp $(pwd)/etc/nginx/mime.types /etc/nginx/mime.types; fi

if [ -d $(pwd)/etc/nginx/sites-available/ ]; then
    # Clean sites-available
    sudo rm -rf /etc/nginx/sites-available/*
    # Export sites-available to production.
    sudo cp -r $(pwd)/etc/nginx/sites-available/* /etc/nginx/sites-available/
    # Clean sites-enabled
    sudo rm -rf /etc/nginx/sites-enabled/*
    # List all files in sites-available
    #SITE_FILES=($(ls -1 /etc/nginx/sites-available/))
    mapfile -t SITE_FILES < <(ls -1 /etc/nginx/sites-available/) # This avoids issues if filenames contain spaces (rare, but bulletproof).
    # Show menu to select a site.
    echo "Available site configuration files in sites-available:"
    for i in "${!SITE_FILES[@]}"; do
        printf "    [%d] %s\n" "$i" "${SITE_FILES[$i]}"
    done
    # Validate selection.
    read -p "Select a file to enable (number): " site_choice
    echo "" >> "$LOG_FILE"
    if [[ "$site_choice" =~ ^[0-9]+$ ]] && [ "$site_choice" -ge 0 ] && [ "$site_choice" -lt "${#SITE_FILES[@]}" ]; then
        SELECTED_SITE="${SITE_FILES[$site_choice]}"
        LINK_PATH="/etc/nginx/sites-enabled/$SELECTED_SITE"
        # Create symbolic link with absolute path.
        sudo ln -s "/etc/nginx/sites-available/$SELECTED_SITE" "$LINK_PATH"
        echo "Symlink created in $LINK_PATH"
    else
        sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
        echo "Invalid selection. Symlink created for the default site instead."
    fi
fi

# Export PHP www.conf to production.
if [ -f $(pwd)/etc/php/8.2/fpm/pool.d/www.conf ] && [ -f /etc/php/8.2/fpm/pool.d/www.conf ]; then
    sudo cp $(pwd)/etc/php/8.2/fpm/pool.d/www.conf /etc/php/8.2/fpm/pool.d/www.conf
else
    echo "PHP 8.2 is not installed or not active. Check the version using 'php -v'"
fi

if [ -d $(pwd)/var/www/ ]; then
    # Clean web content.
    sudo rm -rf /var/www/*
    # Export web content.
    sudo cp -r $(pwd)/var/www/* /var/www/
    # Apply ownership.
    sudo chown -R root:root /var/www/*
    # Set permissions: directories 755, files 644
    sudo find /var/www -type d -exec chmod 755 {} +
    sudo find /var/www -type f -exec chmod 644 {} +
    # Set www-data ownership for specific directories/files.
    TEST="/var/www/test/"
    if [ -d "$TEST" ]; then
        sudo chown -R www-data:www-data "$TEST"
        sudo chmod -R 755 "$TEST"
    fi
    CONTADOR="/var/www/daw/dsw/contador/contador.txt"
    if [ -f "$CONTADOR" ]; then
        sudo chown www-data:www-data "$CONTADOR"
        sudo chmod 664 "$CONTADOR"
    fi
    FRASES="/var/www/daw/dsw/frases/frases.txt"
    if [ -f "$FRASES" ]; then
        sudo chown www-data:www-data "$FRASES"
        sudo chmod 664 "$FRASES"
    fi
fi

# Testing Nginx configuration.
read -p "Do you want to test Nginx configuration before reload? [Y/n]: " nginx_test_confirmation
echo "" >> "$LOG_FILE"
if [[ "$nginx_test_confirmation" =~ ^[Yy]$ ]]; then
    sudo nginx -t
else
    echo "You may need to test Nginx manually because configuration files may have changed."
fi

# Reload Nginx.
read -p "Do you want to reload Nginx now? [Y/n]: " nginx_reload_confirmation
echo "" >> "$LOG_FILE"
if [[ "$nginx_reload_confirmation" =~ ^[Yy]$ ]]; then
    sudo systemctl reload nginx.service
else
    echo "You may need to reload Nginx manually because configuration files may have changed."
fi

# Reload PHP.
if php -v | grep -q 8.2; then
    read -p "Do you want to reload PHP now? [Y/n]: " php_fpm_reload_confirmation
    echo "" >> "$LOG_FILE"
    if [[ "$php_fpm_reload_confirmation" =~ ^[Yy]$ ]]; then
        sudo systemctl reload php8.2-fpm.service
    else
        echo "You may need to reload PHP manually because configuration files may have changed."
    fi
fi

echo "Remember: None of this will work properly if your Nginx server domains are not mapped correctly in /etc/hosts."
echo "          Open /etc/hosts and verify that each server domain points to the right IP address (e.g., 127.0.0.1)."

echo "Script completed successfully!"
