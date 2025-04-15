#!/bin/bash

# Colors
R='\e[1;91m' G='\e[1;92m' Y='\e[1;93m' C='\e[1;96m' N='\e[0m'

# Banner
function banner() {
  clear
  toilet -f big "Termux-usefull" | lolcat
  echo -e "${Y}        Coded by: Muhammad Shourov (VAMPIRE)${N}\n"
}

# Joke API
function joke() {
  curl -s https://icanhazdadjoke.com/ -H "Accept: text/plain"
}

# IP Tracker
function iptrack() {
  read -p "Enter IP/Domain: " ip
  curl -s ipinfo.io/$ip | lolcat
}

# Subdomain Finder (with crt.sh)
function subfinder() {
  read -p "Enter Domain: " domain
  echo -e "${C}Collecting Subdomains for $domain...${N}"
  curl -s "https://crt.sh/?q=%25.$domain&output=json" | jq -r '.[].name_value' | sort -u
}

# Port Scanner
function portscan() {
  read -p "Enter Target IP: " ip
  nmap -F $ip
}

# Banner Creator
function custom_banner() {
  read -p "Enter your banner text: " btext
  toilet -f big "$btext" | lolcat
}

# Vampire Mode
function vampire_mode() {
  clear
  toilet -f big "VAMPIRE" | lolcat
  echo -e "${R}Welcome to Vampire Mode...${N}"
  sleep 1
  cmatrix
}

# Menu
while true; do
  banner
  echo -e "${C}1) System Info          2) Network Info"
  echo -e "3) Battery Info         4) Storage Info"
  echo -e "5) IP Tracker           6) Port Scanner"
  echo -e "7) Subdomain Finder     8) Speed Test"
  echo -e "9) TTS Speak           10) Random Joke"
  echo -e "11) ASCII Banner       12) Matrix Mode"
  echo -e "13) Clean Storage      14) Vampire Mode"
  echo -e "15) Games Menu         16) Custom Banner"
  echo -e "0) Exit${N}"
  echo ""
  read -p $'\e[1;92mSelect Option: \e[0m' ch

  case $ch in
    1) neofetch ;;
    2) curl ifconfig.me ;;
    3) termux-battery-status ;;
    4) df -h ;;
    5) iptrack ;;
    6) portscan ;;
    7) subfinder ;;
    8) speedtest-cli ;;
    9) read -p "Text to Speak: " speak; termux-tts-speak "$speak" ;;
    10) joke ;;
    11) read -p "Enter text: " art; figlet "$art" | lolcat ;;
    12) cmatrix ;;
    13) rm -rf /data/data/com.termux/files/usr/tmp/* && echo -e "${G}Cache Cleaned!${N}" ;;
    14) vampire_mode ;;
    15)
      echo -e "${Y}Installing terminal games...${N}"
      yes | pkg install nsnake bastet moon-buggy ninvaders && clear
      echo -e "${C}1) nsnake   2) bastet   3) moon-buggy   4) ninvaders${N}"
      read -p "Choose Game: " g
      case $g in
        1) nsnake ;; 2) bastet ;; 3) moon-buggy ;; 4) ninvaders ;;
        *) echo -e "${R}Invalid${N}" ;;
      esac ;;
    16) custom_banner ;;
    0) echo -e "${R}Exiting...${N}"; exit ;;
    *) echo -e "${R}Invalid Option${N}" ;;
  esac

  echo -e "\n${C}Press ENTER to return to menu...${N}"
  read
done
