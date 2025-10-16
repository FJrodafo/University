#!/bin/bash

# Script to export nginx projects and configurations from the current working directory (local) to production!

set -eu

# Ensure the script is run with sudo privileges
echo "⚠️  To start running this script, sudo permissions are required!"
if ! sudo -v >/dev/null 2>&1; then
    echo "❌ This script requires sudo privileges. Exiting..."
    exit 1
fi

# Verify that Nginx is active, prompt to start if not
echo "🔎 Checking if Nginx service is active..."
if ! systemctl is-active --quiet nginx; then
    echo "❌ Nginx service is not active."
    read -p "❔ Do you want to start Nginx now? [Y/n]: " start_nginx_confirmation
    if [[ "$start_nginx_confirmation" =~ ^[Yy]$ ]]; then
        echo "🚀 Starting Nginx service..."
        sudo systemctl start nginx
        if systemctl is-active --quiet nginx; then
            echo "✅ Nginx started successfully."
        else
            echo "❌ Failed to start Nginx. Please check manually."
            exit 1
        fi
    else
        echo "⚠️  Nginx is required for this script to run properly. Exiting..."
        exit 1
    fi
else
    echo "✅ Nginx service is active."
fi

# Path variables and references
BACKUP_DIR="$(pwd)/.backup/nginx_$(date +%Y%m%d_%H%M%S)"
SITES_AVAILABLE_SOURCE=$(pwd)/etc/nginx/sites-available/
SITES_AVAILABLE_TARGET=/etc/nginx/sites-available/
SITES_AVAILABLE_REFERENCE=/etc/nginx/sites-available/default
SITES_AVAILABLE_REFERENCE_OWNER=$(stat -c "%U" "$SITES_AVAILABLE_REFERENCE")
SITES_AVAILABLE_REFERENCE_GROUP=$(stat -c "%G" "$SITES_AVAILABLE_REFERENCE")
SITES_ENABLED_TARGET=/etc/nginx/sites-enabled/
SITES_ENABLED_DEFAULT_SITE="default"
MIME_TYPES_SOURCE=$(pwd)/etc/nginx/mime.types
MIME_TYPES_TARGET=/etc/nginx/mime.types
WWW_SOURCE=$(pwd)/var/www/
WWW_TARGET=/var/www/
WWW_REFERENCE=/var/www/html
WWW_REFERENCE_OWNER=$(stat -c "%U" "$WWW_REFERENCE")
WWW_REFERENCE_GROUP=$(stat -c "%G" "$WWW_REFERENCE")

# Validate reference paths exist
if [ ! -f "$SITES_AVAILABLE_REFERENCE" ] || [ ! -d "$WWW_REFERENCE" ]; then
    echo "⚠️  Reference paths not found. Please ensure nginx is installed correctly."
    exit 1
fi

# Optional backup of nginx configuration and www content
read -p "❔ Do you want to create a backup before exporting? [Y/n]: " backup_confirmation
if [[ "$backup_confirmation" =~ ^[Yy]$ ]]; then
    echo "📦 Creating backup at $BACKUP_DIR ..."
    sudo mkdir -p "$BACKUP_DIR/etc/nginx/sites-available"
    sudo cp -a "$SITES_AVAILABLE_TARGET" "$BACKUP_DIR/etc/nginx/sites-available"
    sudo mkdir -p "$BACKUP_DIR/etc/nginx/sites-enabled"
    sudo cp -a "$SITES_ENABLED_TARGET" "$BACKUP_DIR/etc/nginx/sites-enabled"
    sudo mkdir -p "$BACKUP_DIR/etc/nginx/"
    sudo cp -a "$MIME_TYPES_TARGET" "$BACKUP_DIR/etc/nginx/"
    sudo mkdir -p "$BACKUP_DIR/var/www"
    sudo cp -a "$WWW_TARGET" "$BACKUP_DIR/var/www"
    echo "✅ Backup completed."
else
    echo "❌ Backup cancelled."
fi

# Export nginx sites-available to production
read -p "❔ Do you want to export nginx sites-available from $SITES_AVAILABLE_SOURCE to $SITES_AVAILABLE_TARGET? [Y/n]: " export_nginx_sites_available_confirmation
if [[ "$export_nginx_sites_available_confirmation" =~ ^[Yy]$ ]]; then
    if [ -d "$SITES_AVAILABLE_SOURCE" ]; then
        echo "📂 sites-available source: $SITES_AVAILABLE_SOURCE"
        echo "📁 sites-available target: $SITES_AVAILABLE_TARGET"
        echo "🔎 sites-available reference: $SITES_AVAILABLE_REFERENCE"
        echo "   Owner: $SITES_AVAILABLE_REFERENCE_OWNER"
        echo "   Group: $SITES_AVAILABLE_REFERENCE_GROUP"
        if compgen -G "$SITES_AVAILABLE_SOURCE/*" > /dev/null; then
            echo "📦 Exporting content from $SITES_AVAILABLE_SOURCE to $SITES_AVAILABLE_TARGET ..."
            sudo cp -r "$SITES_AVAILABLE_SOURCE"/* "$SITES_AVAILABLE_TARGET"/
            echo "✅ Nginx sites-available files exported successfully."
        else
            echo "⚠️  No files to export in $SITES_AVAILABLE_SOURCE."
        fi
        # Apply ownership based on reference
        sudo chown -R "$SITES_AVAILABLE_REFERENCE_OWNER":"$SITES_AVAILABLE_REFERENCE_GROUP" "$SITES_AVAILABLE_TARGET"/*
    else
        echo "⚠️  Nginx sites-available directory not found: $SITES_AVAILABLE_SOURCE (skipping)."
    fi
else
    echo "❌ Nginx sites-available export cancelled."
fi

# Clean sites-enabled and create a single symlink
if [[ "$export_nginx_sites_available_confirmation" =~ ^[Yy]$ ]]; then
    # Step 1: Clean sites-enabled
    echo "🧹 Cleaning all existing symlinks/files in $SITES_ENABLED_TARGET ..."
    if [ -d "$SITES_ENABLED_TARGET" ]; then
        sudo rm -rf "$SITES_ENABLED_TARGET"/*
    fi
    echo "✅ sites-enabled cleaned."
    # Step 2: List all files in sites-available
    SITE_FILES=($(ls -1 "$SITES_AVAILABLE_TARGET"))
    if [ ${#SITE_FILES[@]} -eq 0 ]; then
        echo "⚠️  No files found in $SITES_AVAILABLE_TARGET to create symlinks."
    else
        # Step 3: Show menu to select a site
        echo "📋 Available site configuration files in sites-available:"
        for i in "${!SITE_FILES[@]}"; do
            printf "  [%d] %s\n" "$i" "${SITE_FILES[$i]}"
        done
        # Validate selection
        read -p "❔ Select a file to enable (number): " site_choice
        if [[ "$site_choice" =~ ^[0-9]+$ ]] && [ "$site_choice" -ge 0 ] && [ "$site_choice" -lt "${#SITE_FILES[@]}" ]; then
            SELECTED_SITE="${SITE_FILES[$site_choice]}"
            LINK_PATH="$SITES_ENABLED_TARGET/$SELECTED_SITE"
            # Step 4: Create symbolic link with absolute path
            sudo ln -s "/etc/nginx/sites-available/$SELECTED_SITE" "$LINK_PATH"
            echo "✅ Symbolic link created: $LINK_PATH -> /etc/nginx/sites-available/$SELECTED_SITE"
        else
            echo "❌ Invalid selection. Creating symlink for default site instead."
            sudo ln -s "/etc/nginx/sites-available/$SITES_ENABLED_DEFAULT_SITE" "$SITES_ENABLED_TARGET/$SITES_ENABLED_DEFAULT_SITE"
            echo "✅ Symbolic link created: $SITES_ENABLED_TARGET/$SITES_ENABLED_DEFAULT_SITE -> /etc/nginx/sites-available/$SITES_ENABLED_DEFAULT_SITE"
        fi
    fi
fi

# Export nginx mime.types to production
read -p "❔ Do you want to export /etc/nginx/mime.types to the production server? [Y/n]: " export_mime_types_confirmation
if [[ "$export_mime_types_confirmation" =~ ^[Yy]$ ]]; then
    if [ -f "$MIME_TYPES_SOURCE" ]; then
        echo "📦 Copying mime.types to /etc/nginx/mime.types ..."
        sudo cp "$MIME_TYPES_SOURCE" /etc/nginx/mime.types
        echo "✅ Nginx mime.types exported successfully."
    else
        echo "⚠️  Nginx mime.types file not found in local /etc/nginx directory: $MIME_TYPES_SOURCE"
    fi
else
    echo "❌ Nginx mime.types export cancelled."
fi


# Export web content to /var/www/
read -p "❔ Do you want to export nginx www from $WWW_SOURCE to $WWW_TARGET? [Y/n]: " export_nginx_www_confirmation
if [[ "$export_nginx_www_confirmation" =~ ^[Yy]$ ]]; then
    if [ -d "$WWW_SOURCE" ]; then
        echo "📂 www source: $WWW_SOURCE"
        echo "📁 www target: $WWW_TARGET"
        echo "🔎 www reference: $WWW_REFERENCE"
        echo "   Owner: $WWW_REFERENCE_OWNER"
        echo "   Group: $WWW_REFERENCE_GROUP"
        # Clean /var/www/
        read -p "❔ Do you want to clean ALL contents of /var/www/ directory? [Y/n]: " clear_www_confirmation
        if [[ "$clear_www_confirmation" =~ ^[Yy]$ ]]; then
            echo "🧹 Cleaning /var/www/ ..."
            sudo rm -rf /var/www/*
            echo "✅ Cleanup completed."
        else
            echo "❌ Cleanup cancelled."
        fi
        # Export new content
        if compgen -G "$WWW_SOURCE/*" > /dev/null; then
            echo "🚚 Exporting content from $WWW_SOURCE to $WWW_TARGET ..."
            sudo cp -r "$WWW_SOURCE"/* "$WWW_TARGET"/
            echo "✅ Export completed."
        else
            echo "⚠️  No files to export in $WWW_SOURCE."
        fi
        # Apply ownership based on reference
        sudo chown -R "$WWW_REFERENCE_OWNER":"$WWW_REFERENCE_GROUP" "$WWW_TARGET"/*
        # Set permissions: directories 755, files 644
        echo "🔧 Setting permissions: directories 755, files 644 ..."
        sudo find "$WWW_TARGET" -type d -exec chmod 755 {} +
        sudo find "$WWW_TARGET" -type f -exec chmod 644 {} +
        echo "✅ Permissions applied successfully."
        # Set www-data ownership for specific files
        echo "🔧 Setting www-data ownership for specific files..."
            CONTADOR="/var/www/daw/ejercicios/contador/contador.txt"
            FRASES="/var/www/daw/ejercicios/frases/frases.txt"
            if [ -f "$CONTADOR" ]; then
                sudo chown www-data:www-data "$CONTADOR"
                sudo chmod 664 "$CONTADOR"
            fi
            if [ -f "$FRASES" ]; then
                sudo chown www-data:www-data "$FRASES"
                sudo chmod 664 "$FRASES"
            fi
        echo "✅ www-data permissions applied successfully."
    else
        echo "⚠️  Nginx www source directory not found: $WWW_SOURCE (skipping)."
    fi
else
    echo "❌ Nginx www export cancelled."
fi

# Testing Nginx configuration
read -p "❔ Do you want to test nginx configuration before reload? [Y/n]: " nginx_test_confirmation
if [[ "$nginx_test_confirmation" =~ ^[Yy]$ ]]; then
    echo "🔍 Testing nginx configuration..."
    if sudo nginx -t; then
        echo "✅ Nginx configuration test passed."
    else
        echo "❌ Nginx configuration test failed. Aborting reload."
        exit 1
    fi
else
    echo "❌ Nginx test cancelled."
fi

# Reload Nginx
read -p "❔ Do you want to reload Nginx now? [Y/n]: " nginx_reload_confirmation
if [[ "$nginx_reload_confirmation" =~ ^[Yy]$ ]]; then
    echo "🔁 Reloading nginx..."
    sudo systemctl reload nginx.service
    echo "✅ Nginx reloaded successfully."
else
    echo "❌ Nginx reload cancelled."
    echo "⚠️  You may need to reload nginx manually because configuration files may have changed."
fi

# Summary
echo "🧾 Summary:"
echo "   - Backup created: $( [[ "$backup_confirmation" =~ ^[Yy]$ ]] && echo "✅ Yes" || echo "❌ No" )"
echo "   - Sites exported: $( [[ "$export_nginx_sites_available_confirmation" =~ ^[Yy]$ ]] && echo "✅ Yes" || echo "❌ No" )"
echo "   - mime exported:  $( [[ "$export_mime_types_confirmation" =~ ^[Yy]$ ]] && echo "✅ Yes" || echo "❌ No" )"
echo "   - www exported:   $( [[ "$export_nginx_www_confirmation" =~ ^[Yy]$ ]] && echo "✅ Yes" || echo "❌ No" )"
echo "   - Nginx tested:   $( [[ "$nginx_test_confirmation" =~ ^[Yy]$ ]] && echo "✅ Yes" || echo "❌ No" )"
echo "   - Nginx reloaded: $( [[ "$nginx_reload_confirmation" =~ ^[Yy]$ ]] && echo "✅ Yes" || echo "❌ No" )"

# Tips
echo "💡 Tips:"
echo "   - Remember: none of this will work properly if your Nginx server names are not mapped correctly in /etc/hosts."
echo "     Please open /etc/hosts and verify that each server name points to the right IP address (e.g., 127.0.0.1)."

echo "🎉 Script completed successfully!"
