# Neutral: Firefox Linux Installer

Neutral aims to make ease out installation of Firefox which is any type with latest.

# Browsers

Any of below can be installed easily.

* Firefox
* Firefox ESR (Extended Support Release)
* Firefox Beta
* Firefox Developer Edition
* Firefox Nightly

# How To Install?
* Firstly, you have to mark it as executable with ```chmod +x install.sh```  
* Then, start the installer with ```./install.sh```
* That's all, the browser can be found by _Start Menu._

# How To Uninstall?

## Step 1: Find the Argument
Decide the installed browser and take its argument key.

* Firefox's argument key is _firefox_
* Firefox ESR's argument key is _firefox-esr_
* Firefox Beta's argument key is _firefox-beta_
* Firefox Developer Edition's argument key is _firefox-devedition_
* Firefox Nightly's argument key is _firefox-nightly_ 

## Step 2: Uninstall
Example argument: _firefox-devedition_
* Run ```./uninstall.sh firefox-devedition```
* Uninstalled.

## Warning
Do no try to use this uninstaller to uninstall Firefox browsers which are installed via package managers or other options. This uninstaller is completely specific for installations which are done via _Neutral_ 

# Compatible

* Linux Mint
* LMDE
* Kali Linux
* Pop!_OS
* Manjaro Linux (GNOME, KDE, XFCE)
* Arch Linux
* Debian
* Ubuntu

# LICENSE

This repository is under <a href="LICENSE">MIT LICENSE<a/>.
