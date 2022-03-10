#!/bin/bash
clear && echo "tB-essentials, created by tcn0blast"
FILE=~/Downloads/tB-essentials/.doneDL
if test -f "$FILE"; then
  echo "tB-essentials has detected a previous run of this program, where the applications were downloaded but not installed to /Applications"
  echo "tB-essentials will now attempt to install them and then clean up any residual files"
  read -n 1 -p "press any key to continue"
  mv ~/Downloads/tB-essentials/installs/* ~/Desktop
  rm ~/Downloads/tB-essentials/installs/*
  rmdir ~/Downloads/tB-essentials/installs
  rm ~/Downloads/tB-essentials/.doneDL
  rmdir ~/Downloads/tB-essentials
  exit 0;
fi

echo "this will download some programs that i think every mac user should have."
echo "if you want the program to install them automatically, then run this script again."
echo "you shouldn't need your password for this, but please enter it if prompted"
read  -n 1 -p "press any key to continue"


mkdir ~/Downloads/tB-essentials && cd $_
mkdir installs

echo "downloading coconutbattery"
curl https://coconut-flavour.com/downloads/coconutBattery_latest.zip --output cb.zip && unzip $_
mv "./coconutBattery.app" ./installs/
rm cb.zip

echo "downloading itsycal"
curl https://itsycal.s3.amazonaws.com/Itsycal.zip --output itsy.zip && unzip $_
mv "./Itsycal.app" ./installs/
rm itsy.zip

echo "downloading appcleaner"
curl https://freemacsoft.net/downloads/AppCleaner_3.6.3.zip --output appc.zip && unzip $_
mv "./AppCleaner.app" ./installs/
rm appc.zip

clear && echo "all done. run the script again if you want to automatically install these apps and clean up."
echo "everything downloaded is in [your home folder]/Downloads/tB-essentials/installs"
echo "you can manually copy the apps from there instead of running the script again should you want to."
echo "no files were modified outside of the tB-essentials directory, so deleting that folder should clean up any remnants of the program."
touch .doneDL
read  -n 1 -p "press any key to continue"
exit 0;
