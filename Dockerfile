FROM cm2network/steamcmd:latest

USER root

ADD ./rs2server.sh /
RUN chmod +x /rs2server.sh

RUN apt-get update && apt-get -y install --no-install-recommends wget locales procps && touch /etc/locale.gen &&       echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen &&   locale-gen &&   apt-get -y install --reinstall ca-certificates &&      rm -rf /var/lib/apt/lists/*

RUN dpkg --add-architecture i386 && apt-get update && apt -y install gnupg2 software-properties-common && wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - &&    apt-add-repository https://dl.winehq.org/wine-builds/debian/ && wget -O- -q https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/Release.key | apt-key add - && echo "deb http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10 ./" | tee /etc/apt/sources.list.d/wine-obs.list && apt-get update && apt -y install --install-recommends xvfb winehq-staging && apt-get -y --purge remove software-properties-common gnupg2 && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

USER steam
ENV HOME /home/steam
ENV WINEPREFIX $HOME/wine
ENV WINEARCH win64
ENV WINEDEBUG -all
ENV DISPLAY :0:0
ENV WORKDIR /home/steam
ADD rs2server.txt /home/steam/rs2server.txt

ENTRYPOINT ["/rs2server.sh"]
CMD ["/bin/bash"]
