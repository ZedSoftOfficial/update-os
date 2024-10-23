#!/bin/bash

# Detect the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Unsupported Linux distribution."
    exit 1
fi

# Update system based on detected distribution
case $OS in
    ubuntu|debian)
        echo "Updating $OS..."
        sudo apt update -y && sudo apt upgrade -y
        ;;
    centos|rhel|almalinux|rocky)
        echo "Updating $OS..."
        sudo yum update -y
        ;;
    fedora)
        echo "Updating $OS..."
        sudo dnf update -y
        ;;
    arch)
        echo "Updating $OS..."
        sudo pacman -Syu --noconfirm
        ;;
    opensuse)
        echo "Updating $OS..."
        sudo zypper update -y
        ;;
    *)
        echo "Unsupported Linux distribution: $OS"
        exit 1
        ;;
esac

echo "System update completed!"
