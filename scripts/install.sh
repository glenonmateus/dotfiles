#!/bin/bash

APTDEBIANFILE=/etc/apt/sources.list.d/debian.list
APTKALIFILE=/etc/apt/sources.list.d/kali.list
APTGOOGLEFILE=/etc/apt/sources.list.d/google-chrome.list
APTDROPBOXFILE=/etc/apt/sources.list.d/dropbox.list
SOURCESLIST=/etc/apt/sources.list
BLACKLISTMOD=/etc/modprobe.d/blacklist.conf
HOME=/home/glenonmateus
GOOGLEKEY=1397BC53640DB551

if [ ! "$(getent passwd | grep glenonmateus)" ]; then
    adduser glenonmateus --disabled-password
fi 

if [ ! -d $HOME ]; then
    mkdir $HOME
fi

cd $HOME

. /etc/os-release 2>&1

rm_source_list() { 
    echo "=> Removendo source.list default ..."
    if [ -e $SOURCESLIST ]; then
        rm $SOURCESLIST
    fi 
    rm -rf /etc/apt/sources.list.d/*
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

install_chrome() {
    echo "=> Instalando google-chrome ..." 
    if [ $(which gpg) ]; then
        apt-key adv --keyserver pgpkeys.mit.edu --receive-keys $GOOGLEKEY
        echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > $APTGOOGLEFILE
        apt update && apt -y install google-chrome-stable
    else 
        install_gpg
    fi
}

install_gpg() {
    echo "=> Install gnupg ..."
    apt -y install \ 
        gnupg \
        dirmngr
    install_chrome
}

install_dropbox() {
    echo "=> Install Dropbox ..."
    wget https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb -O dropbox.deb
    dpkg -i dropbox.deb
    apt -y install -f 
    rm dropbox.deb
}

apt_update(){
    echo "Atualizando repositório e removendo pacotes não usados ..."
    apt update \
        && apt -y upgrade \
        && apt -y autoremove
}

install_basic_packages(){
    echo "=> Instalando pacotes básicos ..."
    apt -y install \
        vim \
        firmware-linux-nonfree \
        lightdm bash-completion \
        accountsservice \
        plymouth \ 
        xorg \
        xfce4-terminal \
        sudo \
        git \
        python-gpgme \
        thunar \
        avahi-daemon \
        pavucontrol \
        pulseaudio \
        pulseaudio-utils \
        avahi-daemon \
        p7zip \
        genisoimage \
        libxslt1.1 \
        gnome-screenshot \
        qpdfview \
        mirage \
        texlive-publishers \
        texlive-lang-portuguese \
        texlive-latex-extra \
        texlive-fonts-recommended \
        lmodern \
        latexmk \
        unzip \
        rar \
        vim-gtk \
        python-pip \
        python-dev \
        xfburn \
        python-wheel \
        python-setuptools \
        ssh \
        wget \
        lsb-release \
        libpango1.0-0
}

install_files() {
    if [ -d "$HOME/git" ]; then
        rm -rf $HOME/git
        mkdir $HOME/git
    else 
        mkdir $HOME/git
    fi 
    echo "=> Baixando e configurando os arquivos do git ..."
    cd $HOME/git && git clone https://github.com/glenonmateus/files.git
    cd $HOME/git && git clone https://github.com/VundleVim/Vundle.vim
    if [ -d "$HOME/.vim/" ]; then
        rm -rf $HOME/.vim
        ln -s $HOME/git/files/.vim $HOME
    else 
        ln -s $HOME/git/files/.vim $HOME
    fi 
    if [ -e "$HOME/.bashrc" ]; then
        rm $HOME/.bashrc
        ln -s $HOME/git/files/.bashrc $HOME
    else
        ln -s $HOME/git/files/.bashrc $HOME
    fi
    if [ -e "$HOME/.bash_profile" ]; then
        rm $HOME/.bash_profile
        ln -s $HOME/git/files/.bash_profile $HOME
    else 
        ln -s $HOME/git/files/.bash_profile $HOME
    fi
    if [ -e "$HOME/.bash_aliases" ]; then
        rm $HOME/.bash_aliases
        ln -s $HOME/git/files/.bash_aliases $HOME
    else
        ln -s $HOME/git/files/.bash_aliases $HOME
    fi 
    if [ ! -d "$HOME/.config" ]; then
        mkdir $HOME/.config/
    fi
    if [ -d "$HOME/.config/i3/" ]; then
        rm -rf $HOME/.config/i3/
        ln -s $HOME/git/files/i3 $HOME/.config/
        ln -s $HOME/git/files/i3/.Xresources $HOME
    else 
        ln -s $HOME/git/files/i3 $HOME/.config/
        ln -s $HOME/git/files/i3/.Xresources $HOME
    fi
}

install_i3(){
    echo "=> Instalando i3 ..."
    apt -y install \ 
        i3 \
        lxappearance \
        i3blocks \
        i3lock \
        rofi \
        arandr \
        feh
}

install_xfce4(){
    echo "=> Instalando xfce4 ..."
    apt -y install \
        xfce4 \
        byobu
} 

remove_packages(){
    echo "=> Removendo pacotes desnecessários ..."
    apt -y purge \
        vim-tiny \ 
        mesa-vdpau-drivers \
        mesa-vdpau-drivers \
        && apt -y --purge autoremove
}

add_sudo(){
    echo "=> Adicionado usuário ao grupo sudo ..."
    adduser glenonmateus sudo
}

add_docker(){
    echo "=> Adicionando usuário ao grupo docker ..."
    adduser glenonmateus docker
}

install_docker(){
    echo "=> Instalando docker-ce e docker-compose ..."
    apt -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" > /etc/apt/sources.list.d/docker.list
    apt update
    apt -y install \
        docker-ce \
        docker-compose
}

install_icon(){
    cd $HOME/git/ && git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git 
    $HOME/git/papirus-icon-theme/install-papirus-root.sh
}

install_theme(){
    if [ -d "/usr/share/themes/Adwaita-Xfce" ]; then
        rm -rf /usr/share/themes/Adwaita-Xfce*
    fi
    cd $HOME/git/ && git clone https://github.com/thearakattack/adwaita-xfce.git/
    cp -R $HOME/git/adwaita-xfce/Adwaita-Xfce* /usr/share/themes/
}

install_powerline(){
    echo "=> Instalando Powerline ..."
    su - glenonmateus -c "pip install --user powerline-status"
    cd $HOME/git/ && git clone https://github.com/powerline/fonts.git 
    $HOME/git/fonts/install.sh 
}

create_blacklist(){
    echo "=> Criando modprobe blacklist.conf ..."
    echo "blacklist pcspkr" > $BLACKLISTMOD
    update-initramfs -u 
}

DISTRO=$(echo $ID)
rm_source_list

case $DISTRO in
    "debian") 
        create_debian_source_list
       ;;
    "kali")
        create_kali_source_list
       ;;
esac

apt_update
install_basic_packages
install_chrome
install_dropbox
install_docker
install_i3
install_files
install_theme
install_icon
install_powerline
add_sudo
add_docker
remove_packages
create_blacklist
