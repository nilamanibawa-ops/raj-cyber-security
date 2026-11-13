#!/bin/bash

cyan='\033[0;36m'
green='\033[1;32m'
red='\033[1;31m'
yellow='\033[1;33m'
reset='\033[0m'

clear
echo -e "${cyan}"
echo "========================================"
echo "    RAJ CYBER SECURITY - INSTALLER      "
echo "========================================"
echo -e "${reset}"

echo -e "${yellow}[*] Updating package lists...${reset}"
pkg update -y && pkg upgrade -y

echo -e "${yellow}[*] Installing required dependencies (curl, git, nmap)...${reset}"
pkg install curl git nmap -y

echo -e "${yellow}[*] Setting up permissions for main tool...${reset}"
chmod +x ip-Scan.sh

echo -e "${green}[+] Installation Completed Successfully!${reset}"
echo -e "${cyan}[*] You can now run your tool using: ./ip-Scan.sh${reset}"
