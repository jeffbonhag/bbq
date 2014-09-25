FROM debian:jessie
MAINTAINER jeff

RUN apt-get update
RUN apt-get -y install qt5-default
RUN apt-get -y install git
RUN git clone https://github.com/xplodwild/bbqscreen_client
WORKDIR bbqscreen_client
RUN apt-get -y install qtmultimedia5-dev
RUN qmake BBQScreenClient2.linux.pro
RUN apt-get -y install make
RUN apt-get -y install g++

WORKDIR /
ADD n2.4.1.zip n2.4.1.zip
RUN apt-get -y install unzip
RUN unzip n2.4.1.zip
WORKDIR /FFmpeg-n2.4.1
RUN apt-get -y install yasm
RUN apt-get -y install pkg-config
RUN ./configure --enable-shared
RUN make
RUN make install

WORKDIR /bbqscreen_client
RUN apt-get -y install libz-dev
RUN make

