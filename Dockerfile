FROM debian:buster

RUN apt-get update &&\
    apt-get install -y \
        build-essential gawk gcc-multilib flex git gettext \
        libncurses5 libncurses5-dev zlib1g-dev curl libsnmp-dev \
        liblzma-dev sudo time git-core subversion g++ bash make \
        libssl-dev patch wget unzip xz-utils python python-distutils-extra \
        python3 python3-distutils python3-distutils-extra \
        python3-setuptools libpam0g-dev cpio rsync  && \
    apt-get clean && \
    useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

USER user
VOLUME ['/usr/local/src/custom_firmware/']
WORKDIR /usr/local/src/custom_firmware/openwrt/
