FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget make gcc ocaml xorg libx11-dev

WORKDIR "/tmp"

RUN wget http://www.cis.upenn.edu/~bcpierce/papers/pict/pict-4.1/pict-4.1.tar.gz

RUN tar -xzf pict-4.1.tar.gz
RUN rm pict-4.1.tar.gz

WORKDIR "pict-4.1"

ENV NEW_BIN "INSTALLDIR = /usr/local/bin"
ENV OLD_BIN "INSTALLDIR = \$(HOME)/bin"
ENV NEW_LIB "INSTALLLIB = /usr/local/lib/pict"
ENV OLD_LIB "INSTALLLIB = \$(HOME)/lib/pict"
ENV NEW_X11 "X11INCLUDE = /usr/include/X11/"
ENV OLD_X11 "# X11INCLUDE ="

RUN sed -i "s%$OLD_LIB%$NEW_LIB%g" SiteSpecific
RUN sed -i "s%$OLD_BIN%$NEW_BIN%g" SiteSpecific
RUN sed -i "s%$OLD_X11%$NEW_X11%g" SiteSpecific

RUN make install; make install

WORKDIR "$(HOME)"

RUN rm -r /tmp/pict-4.1

