#!/bin/bash

clear
# Banner
toilet -f big "Termux-usefull" | lolcat
echo -e "\e[1;90m       Coded by: Muhammad Shourov (VAMPIRE)\e[0m"
echo ""

# Menu
echo -e "\e[1;96m[1] System Info"
echo -e "[2] Network Info"
echo -e "[3] Terminal Fun"
echo -e "[4] Clean Storage"
echo -e "[0] Exit\e[0m"
echo ""
read -p $'\e[1;92mSelect an option: \e[0m' choice

case $choice in
  1)
    echo -e "\n\e[1;93mFetching system info...\e[0m"
    neofetch
    ;;
  2)
    echo -e "\n\e[1;93mYour IP:\e[0m"
    curl -s ifconfig.me
    echo ""
    ;;
  3)
    echo -e "\n\e[1;95mEnjoy the matrix effect! Press CTRL+C to stop.\e[0m"
    sleep 1
    cmatrix || { echo -e "\n\e[1;91mCmatrix not installed. Installing now...\e[0m"; pkg install cmatrix -y && cmatrix; }
    ;;
  4)
    echo -e "\n\e[1;94mCleaning cache...\e[0m"
    rm -rf /data/data/com.termux/files/usr/tmp/*
    echo -e "\e[1;92mDone!\e[0m"
    ;;
  0)
    echo -e "\e[1;91mExiting...\e[0m"
    exit
    ;;
  *)
    echo -e "\e[1;91mInvalid choice!\e[0m"
    ;;
esac
