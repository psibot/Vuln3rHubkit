#!/bin/bash
# SCRIPT:
# REV: Version 1.0
# PLATFORM: Linux
# AUTHOR: Coenraad
#
# PURPOSE: Install VULN3RHUB-KIT 
# Kali Version 0.1
##########################################################
########### DEFINE FILES AND VARIABLES HERE ##############
##########################################################
# Run as sudo 

##########################################################
################ BEGINNING OF MAIN #######################
##########################################################



    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Installing Need Repo's and software!!! This will take TIME..  \e[0m"
    echo
    echo "Installing system"
    echo

sudo sudo apt update
sudo apt install -y kali-linux-everything
sudo apt install -y git python3 python3-pip rmlint-gui bleachbit curl wine64 wget vim sed nc libxml2-utils nmap netcat wireshark tshark 
sudo apt install amass 
sudo apt install john
sudo apt install nmap
sudo apt install sublime-text 
sudo apt install code 
sudo apt install tor-middle-relay
sudo apt install ngrok
sudo apt install i2pd
sudo apt install powershell
sudo pip3 install asciinema
sudo apt install asciinema
pip3 install mkdocs
pip3 install click-man
pip3 install pymetasploit3


git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

    echo
    echo -e "\e[40;38;5;82m [-] \e[30;48;5;82m Installing Python Sploitkit... \e[0m"
    echo
    echo
sudo -H pip3 install fs
sudo -H pip3 install prompt-toolkit --force-reinstall
pip3 install prompt-toolkit --force-reinstall
pip3 install --upgrade ipython
pip3 install 'prompt-toolkit<2.0.0,>=1.0.15' --force-reinstall
pip3 install sploitkit


#    echo
#    echo -e "\e[40;38;5;82m [-] \e[30;48;5;82m Installing Ruby... \e[0m"
#    echo
#    echo
#sudo apt-add-repository -y ppa:brightbox/ruby-ng
#gem install bundler
#\curl -sSL https://get.rvm.io | bash -s -- --autolibs=install-packages
#sudo .rvm/bin/rvm requirements
#\curl -sSL https://get.rvm.io | bash -s stable --ruby
#rvm install "ruby-2.7.2"


    echo
    echo -e "\e[40;38;5;82m [-] \e[30;48;5;82m Installing Go... \e[0m"
    echo
    echo
wget -q https://storage.googleapis.com/golang/getgo/installer_linux
chmod +x installer_linux 
./installer_linux
sudo apt install go --classic

# Add key and repo for MongoDB (4.0)
#wget -qO - https://www.mongodb.org/static/pgp/server-4.0.asc |  sudo apt-key add -
#sudo sh -c "cat <<EOT > /etc/sudo apt/sources.list.d/mongodb-org-4.0.list
#deb http://repo.mongodb.org/sudo apt/ubuntu $(lsb_release -c | awk '{print $2}')/mongodb-org/4.0 multiverse
#EOT"
#sudo apt-get update

#sudo apt-get install -y crudini
#sudo apt-get install -y mongodb-org
#sudo apt-get install -y rabbitmq-server
#sudo systemctl enable mongod
#sudo systemctl start mongod

#Install Comp HERE --- 

mkdir components 
cd components/

    echo
    echo -e "\e[40;38;5;82m [-] \e[30;48;5;82m Installing StackStorm ... \e[0m"
    echo
    echo

sudo bash <(curl -sSL https://stackstorm.com/packages/install.sh) --user=st2admin --password=Ch@ngeMe



# Git get needed software
#bleachbit 
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Installing Software NEEDED for Removal - shred \e[0m"
    echo
git clone --recursive https://github.com/bleachbit/bleachbit.git

#CandC 
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Installing Automation Systems \e[0m"
    echo
git clone --recursive https://github.com/sweetsoftware/Ares.git
git clone --recursive https://github.com/StackStorm/st2.git
git clone --recursive https://github.com/beefproject/beef.git
git clone --recursive https://github.com/gophish/gophish.git


#Clients
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Installing Clients \e[0m"
    echo
git clone --recursive https://github.com/M4cs/Slacky.git
git clone --recursive https://github.com/twintproject/twint.git

#Microsoft  
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Installing .Net - Windows Binaries  \e[0m"
    echo

wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-5.0
sudo apt install -y aspnetcore-runtime-5.0
sudo apt install -y dotnet-sdk-3.1
sudo apt install -y aspnetcore-runtime-3.1
sudo apt install -y dotnet-runtime-3.1

git clone --recurse-submodules https://github.com/cobbr/Covenant
git clone --recursive https://github.com/S3cur3Th1sSh1t/WinPwn.git
git clone --recursive https://github.com/SecureAuthCorp/impacket.git
git clone --recursive https://github.com/allfro/pymetasploit.git
cd pymetasploit
sudo python3 setup.py install 
cd ../
git clone --recursive  https://github.com/DanMcInerney/pymetasploit3.git
cd pymetasploit3/
sudo python3 setup.py install

cd ../

#END Comp

#Frameworks
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Installing Metasploit , Venom , Searchsploit  \e[0m"
    echo


curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall


sudo git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb
sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit


#Nmap Scripts  
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Installing Metasploit , Venom , Searchsploit  \e[0m"
    echo

git clone https://github.com/scipag/vulscan scipag_vulscan
sudo ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan  
sudo git clone https://github.com/vulnersCom/nmap-vulners.git /usr/share/nmap/scripts/nmap-vulners


####################################################
################ END OF MAIN #######################
####################################################
exit 0
# End of script
