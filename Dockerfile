FROM ubuntu:16.04
MAINTAINER Victoria Karpova <me@vika.space>

RUN apt-get -y update \
    && apt-get -y install autoconf libreadline6 libpcre3 libpcre3-dev g++ wget libgmp-dev libgmpada5-dev libreadline-dev make sudo libelf-dev vim git 

WORKDIR /tmp/gtm
RUN wget http://sourceforge.net/projects/fis-gtm/files/GT.M%20Installer/v0.13/gtminstall \
    && chmod +x gtminstall \
    && sudo ./gtminstall --utf8 default \
    && echo "source /usr/lib/fis-gtm/V6.3-002_x86_64/gtmprofile" >> /root/.bashrc

WORKDIR /var/www
RUN git clone https://github.com/lparenteau/DataBallet.git

COPY . /var/www/

COPY docker-entrypoint.sh /var/www/DataBallet/

EXPOSE 8080
ENTRYPOINT [ "/var/www/DataBallet/docker-entrypoint.sh" ]
CMD ["start", "/var/www/data-ballet.conf"]
#CMD ["sleep", "365d"]

