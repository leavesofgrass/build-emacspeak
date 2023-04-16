#!/bin/bash

cd ~

sudo apt-get install git tclx8.4-dev -y && sudo apt-get build-dep emacs emacspeak -y

git clone -b master https://git.savannah.gnu.org/git/emacs.git
git clone https://github.com/tvraman/emacspeak
git clone https://github.com/leavesofgrass/elisp
git clone https://github.com/leavesofgrass/.emacs.d

# cloning voxin repo requires github ssh key as it is non-free
# git clone git@github.com:leavesofgrass/voxin-tgz.git

cd ~/emacs
./autogen.sh && ./configure && make && sudo make install

cd ~/emacspeak 
make && sudo make install

## change to outloud to espeak or other TTS if not using voxin

cd ~/emacspeak
make outloud
echo "export DTK_PROGRAM" >> ~/.bashrc
echo "DTK_PROGRAM=outloud" >> ~/.bashrc

source ~/.bashrc
