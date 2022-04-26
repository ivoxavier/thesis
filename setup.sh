#!/bin/bash

function utfoods_install_requirements {
echo -n " Status --> $1: "
if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo  "Not Installed. Installing now..."
  if [[ ! -z $2 ]]
  then
    sudo apt-get -qq update
  fi
  sudo apt-get -qq -y install $1;
else
  echo "Already Installed!"
fi

}

echo ""
echo "** utFoods Requeriment-Installing-Tool **"
echo ""
echo "To Build This Project Locally The Following Requirements Need To Be Met:"
echo "docker , adb , python3 , python3-pip , python3-setuptools , pyotherside , clickable-ut*"
echo ""
echo "*It's Recommended To Install Using Pip Method"
echo ""

utfoods_install_requirements adb
utfoods_install_requirements docker
utfoods_install_requirements python3
utfoods_install_requirements python3-pip
utfoods_install_requirements python-setuptools
utfoods_install_requirements pyotherside
utfoods_install_requirements python3-pandas


sleep 1
echo ""
echo "If You Want We Can Run A Script Installer For clickable-ut Using pip"
echo ""
echo "Otherwise Go To https://clickable-ut.dev/en/latest/install.html"
echo ""
echo " (1) Run Script For clickable-ut Usin pip"
echo ""
echo " (2) Run Python Scrips For Extract Foods List"
echo ""
echo " (3) Exit"
echo ""
echo -n "Enter number: "; read choice
case "$choice" in
  1)
  . ./setup_modules/clickable_install.sh
  ;;
  2)
  python3 ./data_src/python_scripts/01_extract_data.py
  python3 ./data_src/python_scripts/02_data_cleaning.py
  python3 ./data_src/python_scripts/03_data_transform.py
  python3 ./data_src/python_scripts/01_data_creating.py
  exit
  ;;
  3)
  echo "Bye Bye!" 
  exit
  ;;
esac