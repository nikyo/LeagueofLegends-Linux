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

		sudo apt-get update
		sudo apt-get upgrade"


if prompt "  Would you like to update your software sources?"; then
	sudo apt-get update
	sudo apt-get upgrade
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
		rm -rf ~/.wine
		rm -rf ~/.cache/winetricks
		rm -rf ~/.config/menus/applications-merged/wine*
		sudo rm -rf /usr/share/app-install/desktop/wine*
		sudo rm -rf /usr/share/bash-completion/completions/wine
		sudo rm -rf /usr/share/app-install/icons/wine*
		sudo rm -rf /home/.Trash-0/info/wine*
		sudo rm -rf /home/.Trash-0/files/.wine
		sudo rm -rf /home/.Trash-0/files/winetricks
		rm -rf ~/.local/share/applications/wine*
		rm -rf ~/.local/share/Trash/info/wine*
		rm -rf ~/.local/share/Trash/files/wine*
		rm -rf ~/.local/share/desktop-directories/wine*
		rm -rf ~/.Trash"


if prompt "  Would you like to remove Wine from your system?"; then
	sudo apt-get autoremove wine 
	sudo apt-get purge 
	sudo apt-get autoclean 
	rm -rf ~/.wine
	rm -rf ~/.cache/winetricks
	rm -rf ~/.config/menus/applications-merged/wine*
	sudo rm -rf /usr/share/app-install/desktop/wine*
	sudo rm -rf /usr/share/bash-completion/completions/wine
	sudo rm -rf /usr/share/app-install/icons/wine*
	sudo rm -rf /home/.Trash-0/info/wine*
	sudo rm -rf /home/.Trash-0/files/.wine
	sudo rm -rf /home/.Trash-0/files/winetricks
	rm -rf ~/.local/share/applications/wine*
	rm -rf ~/.local/share/Trash/info/wine*
	rm -rf ~/.local/share/Trash/files/wine*
	rm -rf ~/.local/share/desktop-directories/wine*
	rm -rf ~/.Trash
	
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

  FORCE WINE ARCHITECTURE TO 32BITS
  -----------------------
  Wine 32bits is more stable than 64bits
  This script will now execute the command:

		sudo dpkg --print-foreign-architectures 
		sudo dpkg --add-architecture i386 
		sudo apt-get update"


if prompt "  Would you like to force Wine architecture to 32bits?"; then
	 
	sudo dpkg --print-foreign-architectures 
	sudo dpkg --add-architecture i386 
	sudo apt-get update
	NBETAPE="4" 
	clear
	echo "
Wine exportation to 32bits complete successfully
" 
else
	clear
	echo "
You don't want to export wine architecture to 32bits.
"
	NBETAPE="4"
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
	NBETAPE="5" 
	clear
	echo "
Wine installation complete successfully
" 
else
	clear
	echo "
You don't want to install wine.
"
	NBETAPE="5"
fi

#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  INSTALL REQUIREMENTS WITH WINETRICKS
  -----------------------
  We need to install those package to make LoL works correctly.
  This script will now execute the command:

		winetricks vcrun2005 (Visual C++)
		winetricks ie8 (Internet Explorer 8)
		winetricks adobeair (Adobe Air)
		winetricks d3dx9 (DirectX 9)
		winetricks corefonts (CoreFonts)
		winetricks wininet (Wininet)"


if prompt "  Would you like to install requirements for LoL on your system?"; then
	winetricks vcrun2005
	winetricks ie8
	winetricks adobeair
	winetricks d3dx9
	winetricks corefonts
	winetricks wininet 
	NBETAPE="6"
	clear
	echo "
Requirements installation complete successfully
" 
else
	clear
	echo "
You don't want to install requirements for LoL...
"
	NBETAPE="6"
fi

#----------------------------------------------------------------------------------------------------------
sleep(2000)
echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  PATCHING OF LOL
  -----------------------
  /!\ PLEASE COPY THE FOLDER Riot Game IN /home/$USER/.wine/dosdevices/c:/Program Files
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
	NBETAPE="7"
	clear
	echo "
Patch installation complete successfully
" 
else
	clear
	echo "
You don't want to install the Patch...
"
	NBETAPE="7"
fi

#----------------------------------------------------------------------------------------------------------

echo "  -----------------------------[ STEP $NBETAPE / $NBTOTETAPE ]----------------------------

  CREATION OF A LOL LAUNCHER
  -----------------------
  We need to create a lol launcher to make it easier to launch.
  This script will now execute the command:
		mkdir /home/$USER/LoL
		cp lol_launcher.sh /home/$USER/"


if prompt "  Would you like to install a LoL Launcher in your home directory?"; then
	mkdir /home/$USER/LoL
	cp "lol_launcher.sh" /home/$USER/LoL
	NBETAPE="8"
	clear
	echo "
Launcher creation complete successfully
" 
else
	clear
	echo "
You don't want to create a launcher for LoL...
"
	NBETAPE="8"
fi
