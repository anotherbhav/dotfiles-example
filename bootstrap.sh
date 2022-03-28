#/usr/bin/env zsh

# way to get script name
SCRIPT="${0##*/}"
SCRIPT_PATH="${0%/*}"

#YADM
# its running from yadm; change PWD to repo dir
if echo "$SCRIPT_PATH" | egrep 'yadm' > /dev/null 2>&1; then
    echo its yadm time
    REAL_PATH_DIR=$(readlink $0)
    REAL_PATH_DIR="${REAL_PATH_DIR%/*}"
    echo REAL_PATH_DIR $REAL_PATH_DIR
    PWD="$REAL_PATH_DIR"
fi

# Check if YADM exists; create bootstrap
if ls "$HOME/.config/yadm/" > /dev/null 2>&1; then
    which echo
    echo "yadm config dir exists"
else
    echo "yadm config dir doesn't exist; create it"
    mkdir -p "$HOME/.config/yadm/"
fi

# Check if YADM bootsrap file exists; create bootstrap
if ls "$HOME/.config/yadm/bootstrap" > /dev/null 2>&1; then
    echo "yadm bootstrap present"
else
    echo "yadm bootstrap file does not exist"
    if echo "$SCRIPT" | egrep '^bootstrap.sh$' > /dev/null 2>&1; then
        # we are running the actual script - symlink the yadm
        ln -s "${PWD}/$SCRIPT" "$HOME/.config/yadm/bootstrap"
    fi
fi


# See if Brew is installed
command -V brew

if [ $? -ne 0 ]; then
    echo "brew.sh is not installed"
    echo "brew.sh is not installed. Navigate to https://brew.sh/ and install it"
    exit 1
fi

read -s -n 1 -p "You need to download Xcode (the full version) from the App store to continue.., please press any key to continue once this is done..."

# Install xcode command line tools
# If installed, it will throw an error 
# Seems opposite.
xcode-select --install > /dev/null 2>&1

if [ $? -eq 0 ]; then
    # Exit code 0 means that command line tools is NOT installed and should be installed first
    echo "Install Command line tools before continuing"
    echo "You should have a window pop up for command line tools"
    exit 1
fi


# Install Symlinks
ln -s "$PWD/files/bashrc.sh" ~/.bashrc > /dev/null 2>&1
ln -s "$PWD/files/bash_profile.sh" ~/.bash_profile > /dev/null 2>&1
ln -s "$PWD/files/bash_aliases.sh" ~/.bash_aliases > /dev/null 2>&1


echo create local bin directory and symlink scripts
mkdir "$HOME/bin/" > /dev/null 2>&1
mkdir "$HOME/tmp/" > /dev/null 2>&1

#cp -v "$PWD/bin/"* "$HOME/bin/"
gfind "$PWD/bin" -type f -exec ln -s -f "{}" "$HOME/bin/" \;

echo -en "\n\n--- running brew.sh ---\n"
$PWD/brew.sh

echo -en "\n\n--- running python-setup.sh ---\n"
$PWD/python-setup.sh

echo -en "\n\n--- running osx-defaults.sh ---\n"
$PWD/osx-defaults.sh


echo -en "\n\nFinished Bootstrapping\n"