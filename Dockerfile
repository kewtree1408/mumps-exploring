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
    && echo "source /usr/lib/fis-gtm/V6.3-002_x86_64/gtmprofile" >> /root/.bashrc

WORKDIR /var/www
RUN git clone https://github.com/lparenteau/DataBallet.git \
    && wget https://raw.githubusercontent.com/kewtree1408/mumps-exploring/master/data-ballet.conf \ 
    && mkdir static && cd static \
    && wget https://raw.githubusercontent.com/kewtree1408/mumps-exploring/master/static/index.html \
    && cd /var/www

RUN /usr/lib/fis-gtm/V6.3-002_x86_64/mupip rundown -RELINKCTL /var/www/DataBallet/V6.3-002_x86_64/o
RUN /var/www/DataBallet/script/databallet.sh start data-ballet.conf

CMD [ "sleep", "365d" ]
