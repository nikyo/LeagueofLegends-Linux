#!/bin/bash
cd "/home/$USER/.wine/dosdevices/c:/Program Files/Riot Games/League of Legends/RADS/system"; WINEDEBUG=+ntdll wine "rads_user_kernel.exe" run lol_launcher $(ls ../projects/lol_launcher/releases/) LoLLauncher.exe 
