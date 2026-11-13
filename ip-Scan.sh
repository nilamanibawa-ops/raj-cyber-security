#!/bin/bash

# Color Codes
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
C='\033[1;36m'
W='\033[1;37m'
NC='\033[0m'

banner() {
    clear
    echo -e "${C}"
    echo "   ____      _       _    ____  _  __ "
    echo "  |  _ \    / \     | |  / ___|| |/ / "
    echo "  | |_) |  / _ \ _  | |  \___ \| ' /  "
    echo "  |  _ <  / ___ \ |_| |   ___) | . \  "
    echo "  |_| \_\/_/   \_\___/   |____/|_|\_\ "
    echo -e "${G}  =========================================="
    echo -e "${Y}     RAJ CYBER SECURITY - PRO SUITE v2.0    "
    echo -e "${W}       Author: Raj | Mode: Non-Root         "
    echo -e "${G}  ==========================================${NC}"
    echo ""
}

spinner() {
    echo -ne "${C}[*] Processing"
    for i in {1..3}; do
        echo -ne "."
        sleep 0.2
    done
    echo -e "${NC}"
}

banner

while true
do
    echo -e "${B}┌──────────────────────────────────────────┐${NC}"
    echo -e "${B}│${W}            MAIN CONTROL PANEL            ${B}│${NC}"
    echo -e "${B}├──────────────────────────────────────────┤${NC}"
    echo -e "${B}│ ${G}[1]${W} Public IP & ISP Geo-Location        ${B}│${NC}"
    echo -e "${B}│ ${G}[2]${W} Local Network Interfaces            ${B}│${NC}"
    echo -e "${B}│ ${G}[3]${W} Fast Port Scanner (Nmap)            ${B}│${NC}"
    echo -e "${B}│ ${G}[4]${W} Service & OS Version Detection      ${B}│${NC}"
    echo -e "${B}│ ${G}[5]${W} System Storage & Memory Health      ${B}│${NC}"
    echo -e "${B}│ ${R}[0]${W} Exit Tool                           ${B}│${NC}"
    echo -e "${B}└──────────────────────────────────────────┘${NC}"
    echo ""
    echo -ne "${C}┌──(${R}raj@cybersec${C})-[${W}~/scanner${C}]\n└─${G}$ ${NC}"
    read choice

    if [ "$choice" = "1" ]; then
        echo ""
        spinner
        echo -e "${G}[+] Fetching Public IP & Location Data:${NC}"
        curl -s ipinfo.io
        echo ""
        read -p "Press Enter to continue..."
        banner

    elif [ "$choice" = "2" ]; then
        echo ""
        spinner
        echo -e "${G}[+] Active Network Interfaces:${NC}"
        ifconfig 2>/dev/null || ip a
        echo ""
        read -p "Press Enter to continue..."
        banner

    elif [ "$choice" = "3" ]; then
        echo ""
        echo -ne "${Y}[?] Enter Target IP or Domain: ${NC}"
        read target
        spinner
        echo -e "${G}[+] Running Fast Port Scan on $target...${NC}"
        nmap -F $target
        echo ""
        read -p "Press Enter to continue..."
        banner

    elif [ "$choice" = "4" ]; then
        echo ""
        echo -ne "${Y}[?] Enter Target IP or Domain: ${NC}"
        read target
        spinner
        echo -e "${G}[+] Running Version Scan on $target...${NC}"
        nmap -sV --top-ports 20 $target
        echo ""
        read -p "Press Enter to continue..."
        banner

    elif [ "$choice" = "5" ]; then
        echo ""
        spinner
        echo -e "${G}[+] Storage & Memory Status:${NC}"
        df -h
        echo ""
        free -h
        echo ""
        read -p "Press Enter to continue..."
        banner

    elif [ "$choice" = "0" ]; then
        echo -e "\n${R}[!] Exiting Raj Cyber Security Suite. Stay Safe!${NC}\n"
        exit 0

    else
        echo -e "\n${R}[!] Invalid Option! Select between 0 - 5.${NC}"
        sleep 1.5
        banner
    fi
done
