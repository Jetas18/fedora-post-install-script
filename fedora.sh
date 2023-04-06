#!/bin/bash
cat << EOF | sudo tee -a /etc/dnf/dnf.conf
fastestmirror=True
max_parallel_downloads=5
defaultyes=True
keepcache=True
EOF
read -p "press enter to continue with the setup"
sudo dnf -y update && sudo -y dnf upgrade || exit 1
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm || exit 1
sudo dnf groupupdate core || exit 1
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo ||exit 1
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin || exit 1
sudo dnf groupupdate sound-and-video || exit 1
sudo dnf install -y gcc-c++ make cmake automake autoconf libtool pkg-config \
libpng-devel libjpeg-devel libtiff-devel zlib-devel libwebp-devel \
libjpeg-turbo-devel libicu-devel libxml2-devel gettext-devel libcurl-devel \
openssl-devel readline-devel ncurses-devel sqlite-devel libuuid-devel wget curl htop vim
sudo dnf install snapd || exit 1
sudo ln -s /var/lib/snapd/snap /snap
reboot


