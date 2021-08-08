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
    sudo ./init-install.sh
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
      read -p "Press [Enter] ro start ..."
      nmap -sSV -p- $rhost -oX $rhost.xml -T4 -A 
      echo 
      read -p "Press [Enter] to submit scan to searchsploit for check ..."
      echo 
      searchsploit --nmap $rhost.xml 
      sleep 5
      read -p "Press [Enter] to continue..."
      echo 

    }



function show_menus()
  {
  clear

  echo
  echo 
  echo -e "Hello to \e[5m vuln3rhunter \e[0m"
  echo -e "\e[31m[-]\e[0m \e[1m   Choose : Hit 'a' for !!! WILL INSTALL SYSTEM * RUN ME FIRST !!! \e[0m"
  echo 
  echo -e "\e[31m[-]\e[0m \e[1m   Choose : Hit 'a' for runs NMAP AGAINTS TARGET !!!\e[0m"
  echo -e "\e[31m[-]\e[0m \e[1m   Choose : Hit 'c' for Check DOMAINS for leaked accounts !!!\e[0m"
  echo -e "\e[31m[-]\e[0m \e[1m   Choose : Hit 'x' for Exit!!!\e[0m"
  echo
  echo "Pick Option:"
  }

  echo -e "\e[31m[-]\e[0m \e[1m PLEASE SETUP TARGET IP or DOMAIN  \e[0m"
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
      echo -e "\e[40;38;5;82m [*] \e[30;48;5;82m THANK YOU FOR USING ME !!!  \e[0m"
      echo -e "\e[40;38;5;82m [*] \e[30;48;5;82m Have a nice day! \e[0m"
      exit 0
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