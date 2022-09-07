# openWRT-env
This repository contains utilities to develop using OpenWRT

# Create environment

`docker-compose build`

**Run container**

`docker-compose run openwrtbuilder`

# Helpfull comands
## Download OpenWRT
Clone latest source repository by:

 `git clone https://www.github.com/openwrt/openwrt -b branch_name`

## Updating Feeds
Update feeds: `./scripts/feeds update -a`

all packages : `./scripts/feeds install -a`

## Image Configuration

`Make menuconfig`

Run make menuconfig and set "Target System", "Subtarget", "Target Profile" and modify set of package(s).

You have three options: y, m, n which are represented as follows:

pressing y sets the <*> built-in label

This package will be compiled and included in the firmware image file.

pressing m sets the package label

This package will be compiled, but not included in the firmware image file. (E.g. to be installed with opkg after flashing the firmware image file to the device.)

pressing n sets the < > excluded label

The source code will not be processed.

## Creating diff file (optional)
It also optional for you but i feel like it is a good practice to build diff file.

This file includes only the changes compared to the default configuration. A benefit is that this file can be version controlled with your OpenWRT based project. It's also less affected by OpenWRT updates, because it only contains the changes.

`./scripts/diffconfig.sh > diffconfig` # write the changes to diffconfig


## Defconfig
Will produce a general purpose configuration of the build system including a check of dependencies and prerequisites for the build environment etc

```
cp ../.config.newconfig .config
make defconfig
```

## Building Images
```
make download
make -j4
```

## Clean

`make distclean`

Deletes everything you have compiled or configured and also deletes all downloaded feeds contents and package sources.


## In a Nutshell:
```
git clone https://www.github.com/openwrt/openwrt -b branch_name(master | openwrt-17.01 | openwrt-18.06)
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a

make menuconfig and set "Target System", "Subtarget", "Target Profile" and modify set of package(s).
make defconfig

make download

make -j4

if build failed ...

run make -j4 V=s
```
