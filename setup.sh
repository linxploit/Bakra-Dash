#!/bin/bash
echo "🐐 Setting up BakraDash..."

mkdir -p captured_images saved_locations

chmod +x bakra-dash.sh
chmod 755 *.php
chmod 644 *.html

if ! command -v php &> /dev/null; then
    echo "❌ PHP not found. Please install PHP first."
    exit 1
fi

echo "✅ Setup complete!"
echo "🐐 Run: ./bakra-dash.sh"
