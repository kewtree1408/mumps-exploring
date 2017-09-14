FROM ubuntu:16.04
MAINTAINER Victoria Karpova <me@vika.space>

RUN apt-get -y update \
    && apt-get -y install autoconf libreadline6 libpcre3 libpcre3-dev g++ wget libgmp-dev libgmpada5-dev libreadline-dev make sudo libelf-dev vim git

WORKDIR /tmp
RUN wget http://www.cs.uni.edu/~okane/source/MUMPS-MDH/mumps-17.12.src.tar.gz \
    && tar -zxvf mumps-17.12.src.tar.gz
WORKDIR /tmp/mumpsc
RUN ./BuildMumpsWithNativeClientServer.script

WORKDIR /tmp/gtm
RUN wget http://sourceforge.net/projects/fis-gtm/files/GT.M%20Installer/v0.13/gtminstall \
    && chmod +x gtminstall \
    && sudo ./gtminstall --utf8 default \
    && echo "source /usr/lib/fis-gtm/V6.3-001A_x86_64/gtmprofile" >> /root/.bashrc

WORKDIR /var/www
RUN git clone https://github.com/lparenteau/DataBallet.git \
    && git clone https://github.com/kewtree1408/mumps-exploring/data-ballet.conf \
    && git clone https://github.com/kewtree1408/mumps-exploring/static \
    && ./script/databallet.sh start data-ballet.conf

CMD [ "./script/databallet.sh", "start", "data-ballet.conf" ]
