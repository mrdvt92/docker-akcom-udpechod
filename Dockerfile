FROM almalinux:8 as build

RUN yum -y install make gcc which libtool autoconf automake pkg-config file diffutils gzip git
RUN git clone https://github.com/alaskacommunications/akcom-udpecho.git
WORKDIR /akcom-udpecho/build
RUN ../autogen.sh
RUN ../configure --prefix=/usr
RUN make
RUN gzip ./docs/akcom-udpecho.8
RUN gzip ./docs/akcom-udpechod.8
RUN find


FROM almalinux:8
RUN yum -y install man
COPY --from=build /akcom-udpecho/build/src/akcom-udpechod       /usr/bin/
COPY --from=build /akcom-udpecho/build/src/akcom-udpecho        /usr/bin/
COPY --from=build /akcom-udpecho/build/docs/akcom-udpechod.8.gz /usr/share/man/man8/
COPY --from=build /akcom-udpecho/build/docs/akcom-udpecho.8.gz  /usr/share/man/man8/

CMD ["/usr/bin/akcom-udpechod", "--foreground", "--echoplus"]
