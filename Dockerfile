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
RUN apt-get -y install g++ ffmpeg

WORKDIR /bbqscreen_client
RUN apt-get -y install libz-dev
RUN make

