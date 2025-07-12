#!/bin/bash

# Script to convert Simplified Chinese files to Traditional Chinese using OpenCC
# Usage: ./convert_zh_in_bundle.sh -c <config> -b <bundle>
# Default config: s2tw (Simplified to Traditional with Taiwan phrases)
# Bundle directory is required

# Set default values
CONFIG="s2tw"
BUNDLE="./docs"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--config)
            CONFIG="$2"
            shift 2
            ;;
        -b|--bundle)
            BUNDLE="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [-c config] -b <bundle>"
            echo "  -c, --config    OpenCC config (default: s2tw)"
            echo "  -b, --bundle    Bundle directory (required)"
            echo "  -h, --help      Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use -h for help"
            exit 1
            ;;
    esac
done

# Check if bundle is provided
if [ -z "$BUNDLE" ]; then
    echo "Error: Bundle directory is required. Use -b <bundle>"
    echo "Use -h for help"
    exit 1
fi

# Source and destination directories
SOURCE_DIR="$BUNDLE/zh-hans"
DEST_DIR="$BUNDLE/zh-hant"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory $SOURCE_DIR not found"
    exit 1
fi

# Check if destination directory exists, create if not
if [ ! -d "$DEST_DIR" ]; then
    echo "Creating destination directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
fi

# Check if opencc is available at the specific path
if [ ! -f "/opt/homebrew/bin/opencc" ]; then
    echo "Error: opencc not found at /opt/homebrew/bin/opencc. Please install OpenCC first."
    exit 1
fi

echo "Converting files from $SOURCE_DIR to $DEST_DIR using config: $CONFIG"

# Process each file in the source directory
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        echo "Converting: $filename"
        
        /opt/homebrew/bin/opencc -c "$CONFIG" -i "$file" -o "$DEST_DIR/$filename"
        
        if [ $? -eq 0 ]; then
            echo "✓ Successfully converted: $filename"
        else
            echo "✗ Failed to convert: $filename"
        fi
    fi
done

echo "Conversion completed!"