#!/bin/bash

APTDEBIANFILE=/etc/apt/sources.list.d/debian.list
APTGOOGLEFILE=/etc/apt/sources.list.d/google-chrome.list
APTDROPBOXFILE=/etc/apt/sources.list.d/dropbox.list
SOURCESLIST=/etc/apt/sources.list
BLACKLISTFILE=/etc/modprobe.d/blacklist.conf
HOME=/home/glenonmateus

echo
echo "=> Removendo default sources.list ..."
if [ -e $SOURCESLIST ]; then
    rm $SOURCESLIST
fi
echo
echo "=> Criando sources.list ..."
echo "deb http://mirror.ufpa.br/debian/ stable main contrib non-free" > $APTDEBIANFILE
echo "deb http://mirror.ufpa.br/debian-security/ stable/updates main contrib non-free" >> $APTDEBIANFILE
echo "deb http://ftp.br.debian.org/debian/ stable main contrib non-free" >> $APTDEBIANFILE
echo "deb http://security.debian.org/ stable/updates main contrib non-free" >> $APTDEBIANFILE
echo
echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf
echo "=> Atualizando repositório ..."
apt update && apt -y upgrade && apt -y autoremove
echo 
echo "=> Instalando gnupg ..."
apt -y install gnupg dirmngr
echo "=> Importando chaves ..."
apt-key adv --keyserver pgpkeys.mit.edu --receive-keys FC918B335044912E 
apt-key adv --keyserver pgpkeys.mit.edu --receive-keys 1397BC53640DB551 
apt-key adv --keyserver pgpkeys.mit.edu --receive-keys A040830F7FAC5991 
echo "deb [arch=i386,amd64] http://linux.dropbox.com/debian jessie main" > $APTDROPBOXFILE
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > $APTGOOGLEFILE
apt update && apt -y upgrade && apt -y autoremove 2>&1
echo
echo "=> Instalando pacotes básicos ..."
apt -y install vim \
    aptitude \
    firmware-linux-nonfree \
    lightdm \
    bash-completion \
    accountsservice \
    plymouth \
    xorg \
    xfce4-terminal \
    sudo \
    git \
    xfce4-clipman \
    network-manager-gnome \
    python-gpgme \
    thunar \
    xfce4-notifyd \
    pasystray \
    xscreensaver \
    p7zip \
    genisoimage \
    libxslt1.1 \
    google-chrome-stable \
    dropbox \
    gnome-screenshot \
    qpdfview \
    mirage \
    texlive-publishers \
    texlive-lang-portuguese \
    texlive-latex-extra \
    texlive-fonts-recommended \
    latexmk \
    unzip \
    rar \
    vim-gtk \
    python-pip \
    python-dev \
    xfburn \
    python-wheel \
    python-setuptools \
    linux-headers-$(uname -r) \
    byobu \
    ssh \
    gtk2-engines-pixbuf
echo 

if [ ! -d "$HOME/git" ]; then
    mkdir $HOME/git
fi
echo "Baixando arquivos do git ..."
cd $HOME/git $$ git clone https://github.com/glenonmateus/files.git 2>&1
echo 
while true; do 
    read -p "Escolha um gerenciador de sessão (i3/xfce4): " OPCAO
    if [ "$OPCAO" = "i3" -o "$OPCAO" = "xfce4" ]; then 
        break 
    else 
        echo "Error: Opção inválida"
        echo 
    fi 
done 
case $OPCAO in 
    i3) 
        echo "=> Instalando i3 ..."
        apt install i3 \
            lxappearance \
            i3blocks \
            rofi \
            arandr
        if [ -d "$HOME/.i3/" ]; then
            rm -rf $HOME/.i3/
        else
            ln -s $HOME/git/files/.i3 $HOME
            ln -s $HOME/git/files/.i3/.Xresources $HOME
        fi
        dpkg -i $HOME/git/files/.i3/playerctl-0.5.0_amd64.deb 2>&1
        echo
        ;;
    xfce4) 
        echo "=> Instalando xfce4 ..."
        apt install xfce4
        ;;
esac
echo
echo "=> Removendo pacotes desnecessários ..."
apt purge dunst vim-tiny 2>&1
echo  
echo "=> Adicionando usuário no grupo sudo ..."
adduser glenonmateus sudo 2>&1
echo
echo "=> Criando modprobe blacklist.conf ..."
echo "blacklist pcspkr" > $BLACKLISTFILE
update-initramfs -u 2>&1
echo 

if [ -d "$HOME/.vim"]; then 
    rm -rf $HOME/.vim 
else 
    ln -s $HOME/git/files/.vim $HOME
fi
if [ -e "$HOME/.bashrc" || -e "$HOME/.bash_aliases" ]; then
    rm $HOME/.bashrc $HOME/.bash_aliases
else
    ln -s $HOME/git/files/.bash* $HOME
fi

cd $HOME/.vim/bundle/ && git clone https://github.com/lervag/vimtex.git 2>&1
cd $HOME/.vim/bundle/ && git clone https://github.com/scrooloose/nerdtree.git 2>&1
cd $HOME/.vim/bundle/ && git clone https://github.com/vim-syntastic/syntastic.git 2>&1
cd $HOME/.vim/bundle/ && git clone https://github.com/jiangmiao/auto-pairs.git 2>&1
cd $HOME/git/ && git clone https://github.com/thearakattack/adwaita-xfce.git 2>&1
cd $HOME/git/ && git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git 2>&1

$HOME/git/papirus-icon-theme/install-papirus-root.sh 2>&1

if [ -d "/usr/share/themes/Adwaita-Xfce" ]; then 
    rm -rf /usr/share/themes/Adwaita-Xfce* 
fi
cp -R $HOME/git/adwaita-xfce/Adwaita-Xfce* /usr/share/themes/

echo "=> Instalando powerline-status ..."
pip install powerline-status 
cd $HOME/git/ && git clone https://github.com/powerline/fonts.git 2>&1
$HOME/git/fonts/install.sh 2>&1
echo 
while true; do
read -p "Você quer reiniciar agora (y/n)" -n 1 OPCAO
if [ $OPCAO = "y" -o $OPCAO = "n" ]; then 
    break
else 
    echo "Error: Opção inválida "
fi
done 
case $OPCAO in 
    y) 
        echo "=> Finalizando instalação \n Reiniciando ..."
        reboot
        ;;
    n)
        echo "=> Finalizando instalação."
        ;;
esac 
