#!/bin/bash
# BakraDash Setup Script

echo "🐐 Setting up BakraDash..."

# Create directories
mkdir -p captured_images saved_locations

# Set permissions
chmod +x bakra-dash.sh
chmod 755 *.php
chmod 644 *.html

# Check PHP
if ! command -v php &> /dev/null; then
    echo "❌ PHP not found. Please install PHP first."
    exit 1
fi

echo "✅ Setup complete!"
echo "🐐 Run: ./bakra-dash.sh"