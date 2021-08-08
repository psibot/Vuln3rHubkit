#!/bin/bash
# SCRIPT: vuln3rhunter.sh 
# REV: Version 1.0
# PLATFORM: Linux
# AUTHOR: Coenraad
#
# PURPOSE: vuln3rhunter control
#
##########################################################
########### DEFINE FILES AND VARIABLES HERE ##############
##########################################################

##########################################################
################ BEGINNING OF MAIN #######################
##########################################################
# Run as root.
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[1mMust be ROOT to run  this script!\e[0m"
    echo -e "\e[1mMust be ROOT to run  this script!\e[0m"
    echo -e "\e[1mMust be ROOT to run  this script!\e[0m"
    exit 1
fi

clear

function install()
{
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Kick off INSTALL \e[0m"
    echo
    echo "Build system"
    echo
    sudo bash init-install.sh
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m INSTALL DONE \e[0m"

  }

function namp-recon()
  {
      clear
      echo
      echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Starting NMAP TAGET RECON \e[0m"
      echo
      echo 
      read -p "Press [Enter] to start ..."
      nmap -sSV -p- $rhost -oX $rhost.xml -T4 -A 
      echo 
      echo 
      searchsploit --nmap $rhost.xml 
      sleep 5
      read -p "Press [Enter] to continue..."
      echo 

    }

function gobusterdhttp()
  {
      clear
      echo
      echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Starting  GoBuster HTTP \e[0m"
      echo
      echo 
      read -p "Press [Enter] ro start ..."
      echo 
      echo -e "Are your attack on HTTP (a) OR HTTPS (b)"
      read httpoption 
     if [ "$httpoption" == a ]; then
        gobuster -w /usr/share/wordlist/dirbuster/directory-list-2.3-medium.txt -u http://$rhost -x php,html,log,txt -e
        echo 
        sleep 5
        read -p "Press [Enter] to continue..."
        echo
      fi 

      if [ "$httpoption" == b ]; then
        gobuster -w /usr/share/wordlist/dirbuster/directory-list-2.3-medium.txt -u https://$rhost -x php,html,log,txt -e
        echo 
        sleep 5
        read -p "Press [Enter] to continue..."
        echo
       fi

    }

function wpscan-recon()
  {
      clear
      echo
      echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Starting WPSCAN TAGET RECON \e[0m"
      echo
      echo -e "YOU WILL NEED A API KEY FOR SCAN"
      echo -e "https://wpscan.com/wordpress-security-scanner"
      echo 
      echo -e "Please [Enter] your API key ..."
      read keywpscan
      echo 
      echo -e "Please [Enter] the full wordpress URL ..."
      read full_url
      echo 
      wpscan --url $full_url --api-token $keywpscan --detection-mode aggressive
      echo 
      sleep 5
      read -p "Press [Enter] to continue..."
      echo 

    }



function show_menus()
  {
  echo
  echo 
  echo -e "\e[40;38;5;82m [*] \e[30;48;5;82m ----------------------\e[0m"
  echo -e "\e[40;38;5;82m [*] \e[30;48;5;82m V1 \e[5m vuln3rhunter \e[0m"
  echo -e "\e[40;38;5;82m [*] \e[30;48;5;82m ----------------------\e[0m"
  echo 

  echo -e "\e[31m[-]\e[0m \e[1m   Choose : Hit 'a' for !!! WILL INSTALL SYSTEM * RUN ME FIRST !!! \e[0m"
  echo 
  echo -e "\e[31m[-]\e[0m \e[1m   Choose : Hit 'b' for runs NMAP AGAINTS TARGET !!!\e[0m"
  echo -e "\e[31m[-]\e[0m \e[1m   Choose : Hit 'c' for runs HTTP GOBUSTER AGAINTS TARGET !!!\e[0m"
  echo -e "\e[31m[-]\e[0m \e[1m   Choose : Hit 'd' for runs WPSCAN AGAINTS TARGET !!!\e[0m"
  echo -e "\e[31m[-]\e[0m \e[1m   Choose : Hit 'x' for Exit!!!\e[0m"
  echo
  echo "Pick Option:"
  }

  echo -e "\e[31m[-]\e[0m \e[1m PLEASE SETUP TARGET IP or DOMAIN \e[0m"
  echo 
  read rhost
  show_menus

  read choice
  if [ "$choice" == a ]; then
      install
      show_menus
      read choice
      fi

  if [ "$choice" == b ]; then
      namp-recon 
      clear
      sleep 2
      show_menus
      fi

    if [ "$choice" == c ]; then
      gobusterdhttp
      clear
      sleep 2
      show_menus
      fi

    if [ "$choice" == d ]; then
      wpscan-recon
      clear
      sleep 2
      show_menus
      fi


  if [ "$choice" == x ]; then
      clear
      sleep 2
      echo -e "\e[40;38;5;82m [*] \e[30;48;5;82m THANK YOU FOR USING ME !!!  \e[0m"
      echo -e "\e[40;38;5;82m [*] \e[30;48;5;82m Have a nice day! \e[0m"
      exit 0
      fi


####################################################
################ END OF MAIN #######################
####################################################
exit 0
# End of script