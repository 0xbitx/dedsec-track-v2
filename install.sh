#!/bin/bash

ILOG=$PWD/template/logs/install.log

debian_install() {
    echo -e '=====================\nINSTALLING FOR DEBIAN\n=====================\n' > $ILOG
    echo -ne 'Python3\r'
    sudo apt -y install python3 python3-pip &>> $ILOG && echo 'Python3 - Installed' || 'Python3 - Failed!'
    echo -e '\n--------------------\n' >> $ILOG
    echo -ne 'PHP\r'
    sudo apt -y install php &>> $ILOG && echo 'PHP - Installed' || echo 'PHP - Failed!'
    echo -e '\n--------------------\n' >> $ILOG
}

termux_install() {
    echo -e '=====================\nINSTALLING FOR TERMUX\n=====================\n' > $ILOG
    echo -ne 'Python3\r'
    apt -y install python &>> $ILOG && echo 'Python3 - Installed' || 'Python3 - Failed!'
    echo -e '\n--------------------\n' >> $ILOG
    echo -ne 'PHP\r'
    apt -y install php &>> $ILOG && echo 'PHP - Installed' || echo 'PHP - Failed!'
    echo -e '\n--------------------\n' >> $ILOG
}

echo -e '[!] Installing Dependencies...\n'

if [ -f 'linux-android' ]; then
    termux_install
else
    debian_install

echo -ne 'Requests\r'
pip3 install requests &>> $ILOG && echo 'Requests - Installed' || echo 'Requests - Failed!'

echo -ne 'Packaging\r'
pip3 install packaging &>> $ILOG && echo 'Packaging - Installed' || echo 'Packaging - Failed!'

echo -e '\nLog Saved :' $ILOG
