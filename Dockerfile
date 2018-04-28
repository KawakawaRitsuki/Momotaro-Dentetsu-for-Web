FROM ubuntu:16.04
MAINTAINER mizucoffee

COPY game.iso /
COPY start.sh /
COPY index.html /
COPY main.rb /
COPY start.sh /

RUN set -x && \
    apt update && \
    apt install -y cmake pkg-config git libao-dev libasound2-dev libavcodec-dev libavformat-dev libbluetooth-dev libenet-dev libgtk2.0-dev liblzo2-dev libminiupnpc-dev libopenal-dev libpulse-dev libreadline-dev libsfml-dev libsoil-dev libsoundtouch-dev libswscale-dev libusb-1.0-0-dev libwxbase3.0-dev libwxgtk3.0-dev libxext-dev libxrandr-dev portaudio19-dev zlib1g-dev libudev-dev libevdev-dev "libpolarssl-dev|libmbedtls-dev" libcurl4-openssl-dev libegl1-mesa-dev libpng-dev screen xvfb netpbm xdotool imagemagick xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic fonts-ipafont-gothic fonts-ipafont-mincho ruby language-pack-ja language-pack-ja-base locales locales-all x11-apps xbitmaps && \
    git clone https://github.com/dolphin-emu/dolphin.git dolphin-emu && \
    cd ./dolphin-emu && \
    git checkout tags/5.0 && \
    mkdir Build && cd Build && \
    cmake .. && \
    make install && \
    chmod 755 /start.sh && \
    gem install sinatra && \
    mkdir public

COPY GCPadNew.ini /root/.config/dolphin-emu/
COPY Dolphin.ini /root/.config/dolphin-emu/
COPY controller.png /

EXPOSE 5588
