# Ultima Online Forever linux cli patcher

I never manged to run the original Ultima Online forever client udpater it simply won't work for me.
hence updater.sh FTW!!!!

## PREREQ
Before the updater is applied you can follow following steps to install UO on Linux

if you have an working UO version you can skip directly to [download and run updater](#download-upatersh-and-run-it)

## Install and Run updater 


2) Once this is done place updater.sh scrip into UO folder and run it

```
[vmindru@vmindru UO]$ ./update.sh
Your spell fizeles. provide --path parameter
[vmindru@vmindru UO]$ ./update.sh ./
```

3) once this is done simply start UO, i also havea short cut for this
```
[vmindru@vmindru uoforever_linux_updater]$ cat /home/vmindru/bin/ultima_online
#!/bin/bash

cd "/home/vmindru/.wine32/drive_c/UOS" >> /tmp/uo_debug 2>&1
wine ./UOS.exe >> /tmp/uo_debug 2>&1


[vmindru@vmindru uoforever_linux_updater]$
```








## The Originak guide just in case

## UBUNTU VERSION

#### Install Wine 3.0 enable 32 bit architecture
```
sudo dpkg --add-architecture i386
```

### Add the repository:
```
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
```

### Update packages:
```
sudo apt-get update
```

### Install
```
sudo apt-get install --install-recommends winehq-stable
```

## FEDORA VERSION

```
sudo dnf install wine wine-mono
```

## COMMON STEPS for Fedora and UBUNTU

### Create a 32-bit WINE prefix on a 64-bit Ubuntu system, you need to enter in a terminal and run the following command:
```
WINEPREFIX="$HOME/.wine32" WINEARCH=win32 wine wineboot
```

Note: If wine asks to install mono or gecko go ahead and do so.

### Install winetricks, i know cp to usr/bin is evil feel free to use winetricks from other source if you feel more comfy.
```
pushd ~/Downloads/
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
sudo cp  winetricks /usr/bin/
popd 
```

### Configure wine to windows xp
```
WINEPREFIX=~/.wine32/ WINEARCH=win32 winetricks winecfg
```

### Continue with dotnet installs below:
```
WINEPREFIX=~/.wine32/ WINEARCH=win32 winetricks vcrun2010
```
Note: if your browser opens manually, download the file msxml3.msi and place it in the newly opened folder then redo last step again. (/home/.cache/winetricks/msxml3), then re-run the script.
```
WINEPREFIX=~/.wine32/ WINEARCH=win32 winetricks vcrun2013
WINEPREFIX=~/.wine32/ WINEARCH=win32 winetricks gdiplus
WINEPREFIX=~/.wine32/ WINEARCH=win32 bash winetricks dotnet452 corefonts
```
It will install a few times wait. Keep Answering yes, continue, restartnow etc,and installing until the terminal resets to Name ~ $.


### Install UO 

```
pushd ~/Downloads/
curl -O http://web.cdn.eamythic.com/us/uo/installers/20120309/UOClassicSetup_7_0_24_0.exe 
WINEPREFIX=~/.wine32/ WINEARCH=win32 wine UOClassicSetup_7_0_24_0.exe
popd
```

### Download and install UOSteam
```
pushd ~/Downloads/
curl -O http://uos-update.github.io/UOS_Latest.exe
WINEPREFIX=~/.wine32/ WINEARCH=win32 wine  UOS_Latest.exe
popd
```

### run UOPatch.exe, this will get latest Cliente version. This will take a while depending on your internet speed. Be patient until it's finished.
```
pushd ~/.wine32/drive_c/UO
INEPREFIX=~/.wine32/ WINEARCH=win32 wine UOPatch.exe
popd
```

### download upater.sh and run it
```
pushd ~/.wine32/drive_c/UO
curl -O https://raw.githubusercontent.com/vmindru/uoforever_linux_updater/master/update.sh
chmod +x update.sh
./update.sh ./
popd
```


# ENJOY!
if this actually helped you and you want to say thank you https://paypal.me/vmindru 
