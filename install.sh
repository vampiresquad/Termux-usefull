#!/bin/bash

clear
echo -e "\e[1;92m[+] Starting installation...\e[0m"

# Auto Fix for pkg update errors
echo -e "\e[1;94m[*] Updating packages...\e[0m"
yes | pkg update && yes | pkg upgrade || apt update --fix-missing

# Essential packages
packages=(figlet toilet ncurses-utils curl neofetch nano lolcat)

for pkg in "${packages[@]}"; do
    if ! command -v $pkg &> /dev/null; then
        echo -e "\e[1;93m[+] Installing $pkg...\e[0m"
        yes | pkg install "$pkg"
    else
        echo -e "\e[1;92m[✔] $pkg already installed\e[0m"
    fi
done

chmod +x tool.sh

echo -e "\e[1;92m[✔] Installation Complete!\e[0m"
echo -e "\e[1;94m[!] Run the tool with: ./tool.sh\e[0m"
