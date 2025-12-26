# My Playlist 
## Installation 
Ubuntu/Debian/Mint
```
sudo apt install ffmpeg youtube-dl
```
Fedora
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E $fedora).noarch.rpm & \
sudo dnf install ffmpeg youtube-dl
```
Arch Linux
```
sudo pacman -S ffmpeg youtube-dl
```

## Running Script
```
mkdir ./files & \
chmod +x playlist.sh & \
./playlist.sh ./files
```
