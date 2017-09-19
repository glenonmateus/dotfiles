#!/bin/bash

APTDEBIANFILE=/etc/apt/sources.list.d/debian.list
APTKALIFILE=/etc/apt/sources.list.d/kali.list
APTGOOGLEFILE=/etc/apt/sources.list.d/google-chrome.list
APTDROPBOXFILE=/etc/apt/sources.list.d/dropbox.list
SOURCESLIST=/etc/apt/sources.list
BLACKLISTMOD=/etc/modprobe.d/blacklist.conf
HOME=/home/glenonmateus

if [ ! -d $HOME ]; then
    mkdir $HOME
fi

cd $HOME

. /etc/os-release 

rm_source_list() { 
    echo "=> Removendo source.list default ..."
    if [ -e $SOURCESLIST ]; then
        rm $SOURCESLIST
    fi 
} 

create_debian_source_list() {
    echo "=> Criando Debian Stable sources.list ..." 
    echo "deb http://mirror.ufpa.br/debian/ stable main contrib non-free" > $APTDEBIANFILE
    echo "deb http://mirror.ufpa.br/debian-security/ stable/updates main contrib non-free" >> $APTDEBIANFILE
    echo "deb http://ftp.br.debian.org/debian/ stable main contrib non-free" >> $APTDEBIANFILE
    echo "deb http://security.debian.org/ stable/updates main contrib non-free" >> $APTDEBIANFILE
}

create_kali_source_list() {
    echo "=> Criando Kali sources.list ..."
    echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > $APTKALIFILE
}

create_chrome_source_list() {
    echo "=> Instalando google-chrome" 
}
