#!/bin/bash
# LoL installation script
# ------------------------

NBETAPE="1"
NBTOTETAPE="7"
LANGUE="en"

if [ -f "prompt" ]; then
source "prompt"
else
echo "Error: Failed to locate prompt"
exit 1
fi

#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  UPDATE SOFTWARE SOURCES
  -----------------------
  Before we can continue, we need to make sure your system's software sources
  are up-to-date. This script will now execute the command:

		sudo apt-get update"


if prompt "  Would you like to update your software sources?"; then
	sudo apt-get update
	NBETAPE="2"
	clear
	echo "
Update complete successfully
"
else
	clear
	echo "
You don't want to update your software sources.
"
	NBETAPE="2"
fi

#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  REMOVE PREVIOUS WINE VERSIONS
  -----------------------
  Before installing Wine, we need to remove previous versions.
  This script will now execute the command:

		sudo apt-get autoremove wine 
		sudo apt-get purge 
		sudo apt-get autoclean 
		sudo rm -r ~/.wine"


if prompt "  Would you like to remove Wine from your system?"; then
	sudo apt-get autoremove wine 
	sudo apt-get purge 
	sudo apt-get autoclean 
	sudo rm -r ~/.wine
	NBETAPE="3"
	clear
	echo "
Wine removed successfully
"
else
	clear
	echo "
You don't want to remove previous wine installation.
"
	NBETAPE="3"
fi

#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  INSTALL WINE FROM THE PPA
  -----------------------
  We need to install the last wine version from ubuntu-wine ppa.
  This script will now execute the command:

		sudo add-apt-repository ppa:ubuntu-wine/ppa 
		sudo apt-get update
		sudo apt-get install wine 
		export WINEARCH=\"win32\" 
		winecfg"


if prompt "  Would you like to install Wine on your system?"; then
	sudo add-apt-repository ppa:ubuntu-wine/ppa 
	sudo apt-get update
	sudo apt-get install wine 
	export WINEARCH="win32" 
	winecfg
	NBETAPE="4" 
	clear
	echo "
Wine installation complete successfully
" 
else
	clear
	echo "
You don't want to install wine.
"
	NBETAPE="4"
fi

#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  INSTALL REQUIREMENTS WITH WINETRICKS
  -----------------------
  We need to install those package to make LoL works correctly.
  This script will now execute the command:

		winetricks vcrun2005 (Visual C++)
		winetricks ie8 (Internet Explorer 8)
		winetricks wininet (Wininet)
		winetricks d3dx9 (DirectX 9)
		winetricks corefonts (CoreFonts)
		winetricks adobeair (Adobe Air)"


if prompt "  Would you like to install requirements for LoL on your system?"; then
	winetricks vcrun2005
	winetricks ie8
	winetricks wininet
	winetricks d3dx9
	winetricks corefonts
	winetricks adobeair 
	NBETAPE="5"
	clear
	echo "
Requirements installation complete successfully
" 
else
	clear
	echo "
You don't want to install requirements for LoL...
"
	NBETAPE="5"
fi

#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  PATCHING OF LOL
  -----------------------
  This patch is needed to correct some problems. Make sure to install it.
  This script will now execute the command:

		sudo apt-get install python3
		cd LoL-Linux-Tools-master/
		sed -i \"s/USER/$USER/g\" config.py 
		sudo chmod +x lol_python.py 
		sudo python ./lol_python.py texture_patch 
		cd .."


if prompt "  Would you like to install the Patch?"; then
	sudo apt-get install python3
	cd LoL-Linux-Tools-master/
	sed -i "s/USER/$USER/g" config.py 
	sudo chmod +x lol_linux.py 
	sudo python ./lol_linux.py texture_patch
	cd .. 
	NBETAPE="6"
	clear
	echo "
Patch installation complete successfully
" 
else
	clear
	echo "
You don't want to install the Patch...
"
	NBETAPE="6"
fi

#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  CREATION OF A LOL LAUNCHER
  -----------------------
  We need to create a lol launcher to make it easier to launch.
  This script will now execute the command:

		cp lol_launcher.sh /home/$USER/"


if prompt "  Would you like to install a LoL Launcher in your home directory?"; then
	cp "lol_launcher.sh" /home/$USER/
	NBETAPE="7"
	clear
	echo "
Launcher creation complete successfully
" 
else
	clear
	echo "
You don't want to create a launcher for LoL...
"
	NBETAPE="7"
fi
