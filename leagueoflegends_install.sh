#!/bin/bash
# LoL installation script
# ------------------------

NBETAPE="1"
NBTOTETAPE="8"
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
	clear
	echo "
Update complete successfully
"
else
	clear
	echo "
You don't want to update your software sources.
"
fi
NBETAPE="2"
#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  REMOVE PREVIOUS WINE VERSIONS
  -----------------------
  Before installing Wine, we need to remove previous versions.
  This script will now execute the command:

		sudo apt-get autoremove wine 
		sudo apt-get purge 
		sudo apt-get autoclean 
		rm -r ~/.wine"


if prompt "  Would you like to remove Wine from your system?"; then
	sudo apt-get autoremove wine 
	sudo apt-get purge 
	sudo apt-get autoclean 
	rm -r ~/.wine
	clear
	echo "
Wine removed successfully
"
else
	clear
	echo "
You don't want to remove previous wine installation.
"
fi
NBETAPE="3"
#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  FORCE WINE ARCHITECTURE TO 32BITS FOR 64BITS SYS
  -----------------------
  Wine 32bits is more stable than 64bits
  This script will now execute the command:

		sudo dpkg --print-foreign-architectures 
		sudo dpkg --add-architecture i386 
		sudo apt-get update"

var=$(sudo dpkg --print-foreign-architectures)
if [$var = 'i386'] 
	if prompt "  Would you like to force Wine architecture to 32bits? If you choose 'No' option League of Legend will not work"; then 
		sudo dpkg --add-architecture i386 
		sudo apt-get update
		clear
		echo "
	Wine exportation to 32bits complete successfully
	" 
	else
		clear
		echo "
	You don't want to export wine architecture to 32bits. League Of Legend will not work !
	"
	fi
fi
NBETAPE="4"
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
	clear
	echo "
Wine installation complete successfully
" 
else
	clear
	echo "
You don't want to install wine.
"
fi
NBETAPE="5"
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
	clear
	echo "
Requirements installation complete successfully
" 
else
	clear
	echo "
You don't want to install requirements for LoL...
"
fi
NBETAPE="6"
#----------------------------------------------------------------------------------------------------------
echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------
	COPY INSTALL FOLDERS
	-----------------------
	Copy your install folder to ~/.wine/dosdevices/c:/Program Files/Riot Games/League of Legends/
"

valide = 0

while valide == 0 ; do
	if prompt " Have you copy the installation's folder ?"; then 
		if [! -d "/home/$USER/.wine/dosdevices/c:/Program Files/Riot Games"] ; then
			echo "Installation's folder don't exist, please copy it"
			valide = 0
		else
			valide = 1
		
		fi
	fi
done

NBETAPE="7"
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
	clear
	echo "
Patch installation complete successfully
" 
else
	clear
	echo "
You don't want to install the Patch...
"
fi
NBETAPE="8"
#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  CREATION OF A LOL LAUNCHER
  -----------------------
  We need to create a lol launcher to make it easier to launch.
  This script will now execute the command:

		cp lol_launcher.sh /home/$USER/"


if prompt "  Would you like to install a LoL Launcher in your home directory?"; then
	cp "lol_launcher.sh" /home/$USER/
	clear
	echo "
Launcher creation complete successfully
" 
else
	clear
	echo "
You don't want to create a launcher for LoL...
"
	
fi
