#!/bin/bash

sudo sh -c echo fastestmirror=True >> /etc/dnf/dnf.conf
sudo sh -c echo max_parallel_downloads=5 >> /etc/dnf/dnf.conf
sudo sh -c echo default=True >> /etc/dnf/dnf.conf
sudo sh -c echo keepcache=Faslse >> /etc/dnf/dnf.conf
sleep 10
sudo dnf update
sleep 5
sudo dnf upgrade
sleep 5
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core
sleep 5
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sleep 5
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video
sleep 5
sudo dnf install -y gcc-c++ make cmake automake autoconf libtool pkg-config \
  libpng-devel libjpeg-devel libtiff-devel zlib-devel libwebp-devel \
  libjpeg-turbo-devel libicu-devel libxml2-devel gettext-devel libcurl-devel \
  openssl-devel readline-devel ncurses-devel sqlite-devel libuuid-devel
sleep 10
sudo dnf install -y wget curl htop vim
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh

