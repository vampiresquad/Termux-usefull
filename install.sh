#!/bin/bash

clear
echo -e "\e[1;92m[+] Installing Termux-usefull tool...\e[0m"

# Update & Fix Errors
yes | pkg update && yes | pkg upgrade || apt update --fix-missing

# Essential Packages
pkgs=(figlet toilet neofetch curl wget nano lolcat cmatrix termux-api dnsutils nmap python git)
for pkg in "${pkgs[@]}"; do
  if ! command -v $pkg &> /dev/null; then
    echo -e "\e[1;93m[+] Installing $pkg...\e[0m"
    yes | pkg install "$pkg"
  else
    echo -e "\e[1;92m[✔] $pkg already installed\e[0m"
  fi
done

# Python Modules
pip install --upgrade pip
pip install requests speedtest-cli lolcat

chmod +x tool.sh

echo -e "\n\e[1;92m[✔] Installation Complete!"
echo -e "[*] Run the tool using: \e[1;96m./tool.sh\e[0m"
