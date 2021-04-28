#!/bin/bash

BOLD=`tput bold`
YELLOW=`tput setaf 11`
RESET=`tput sgr0`

printf "Welcome!\nNeutral is a installer script for ease out of installation any type of Firefox.\n\n"

printf "Options:
    * Install Firefox -> 1
    * Install Firefox (ESR) Extended Support Release -> 2
    * Install Firefox Beta -> 3
    * Install Firefox Developer Edition -> 4
    * Install Firefox Nightly -> 5
    * Quit -> q
\n"
printf "${BOLD}${YELLOW}user@input: $RESET"
read option
while [[ $option -eq "" ]] || [ $option -lt 1 ] || [ $option -gt 5 ]; do
    if [[ $option -eq "q" ]]; then
        echo "Quit"
        exit 0
    fi
    printf "${BOLD}${YELLOW}user@input: $RESET"
    read option
done

((--option))

browsers=( 
        "firefox" 
        "firefox-esr" 
        "firefox-beta" 
        "firefox-devedition" 
        "firefox-nightly" 
)

# https://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash 
declare -A names=( 
        ["firefox"]="Firefox" 
        ["firefox-esr"]="Firefox ESR" 
        ["firefox-beta"]="Firefox Beta" 
        ["firefox-devedition"]="Firefox Developer Edition" 
        ["firefox-nightly"]="Firefox Nightly" 
)

# x86
# https://download.mozilla.org/?product=firefox-esr-latest-ssl&os=linux&lang=en-US

# x64
# https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US
# https://download.mozilla.org/?product=firefox-esr-latest-ssl&os=linux64&lang=en-US
# https://download.mozilla.org/?product=firefox-beta-latest-ssl&os=linux64&lang=en-US
# https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US
# https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US

echo "Installation is starting.."

APPLICATIONS=$HOME/.local/share/applications
BROWSER=${browsers[option]}
BROWSER_NAME=${names[$BROWSER]}
EXEC_PATH=/opt/$BROWSER
FILE=$BROWSER.tar.bz2
FOLDER=$BROWSER

ARCH=$(uname -m)

OS="&os=linux64"
LANG="&lang=en-US"

if [ $ARCH != "x86_64" ]; then
    OS="&os=linux"
fi

URL="https://download.mozilla.org/?product=${BROWSER}-latest-ssl${OS}${LANG}"

# echo "${BROWSER}"
# echo "${BROWSER_NAME}"
# echo "${URL}"

chmod +x junk.sh
./junk.sh $BROWSER

chmod +x uninstall.sh
./uninstall.sh $BROWSER 

install(){
    tar -xjf $BROWSER.tar.bz2

    if [[ "$BROWSER" != "firefox" ]]; then
        mv firefox $BROWSER
    fi

    sudo mv $BROWSER /opt

    chmod +x de.sh
    ./de.sh $BROWSER "${BROWSER_NAME}"

    echo "Desktop icon is creating.."
    cp $BROWSER.desktop $HOME/Desktop
    echo "Desktop icon is created."

    if [ -d "$APPLICATIONS" ]; then
        echo "$APPLICATIONS found.";
    else
        echo "$APPLICATIONS not found."
        mkdir $APPLICATIONS
        echo "$APPLICATIONS path is created."
    fi

    echo "${BROWSER_NAME} is moving into applications.."
    mv $BROWSER.desktop $APPLICATIONS
    echo "Moved."

    rm $BROWSER.tar.bz2
}

if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "Download is starting.."
    wget -O $BROWSER.tar.bz2 $URL
fi

if [ -f "$FOLDER" ]; then
    rm "$FOLDER"
fi

install
echo "Installation completed."
echo "Now you can access ${BROWSER_NAME} from your Start Menu or Desktop."
echo "Happy days. Bye!"
exit 0