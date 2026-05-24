#!/bin/bash
# Quick start for BakraDash

echo "🐐 BakraDash - Starting..."
echo "🐐 Brand: Linxploit | Mindless"
echo ""

# Check if main script exists
if [ ! -f "bakra-dash.sh" ]; then
    echo "❌ bakra-dash.sh not found!"
    exit 1
fi

# Make executable
chmod +x bakra-dash.sh

# Run
./bakra-dash.sh